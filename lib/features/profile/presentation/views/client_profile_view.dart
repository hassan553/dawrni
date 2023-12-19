import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/client_profile_bloc/client_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/routes/client_edit_profile_route.dart';
import 'package:dawrni/features/profile/presentation/widgets/container_location.dart';
import 'package:dawrni/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:dawrni/features/profile/presentation/widgets/password_field.dart';
import 'package:dawrni/features/profile/presentation/widgets/profile_top_widget.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class ClientProfileView extends StatefulWidget {
  const ClientProfileView({super.key});

  @override
  State<ClientProfileView> createState() => _ClientProfileViewState();
}

class _ClientProfileViewState extends State<ClientProfileView> {
  late final ClientProfileBloc _bloc;
  late final UpdateProfileBloc _updateBloc;

  final ImagePicker picker = ImagePicker();
  final RefreshController _refreshController = RefreshController();


  @override
  void initState() {
    _bloc = context.read<ClientProfileBloc>();
    _updateBloc = context.read<UpdateProfileBloc>();
    _bloc.add(const FetchClientProfileEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getProfile() {
    _bloc.add(const FetchClientProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppConfigBloc, AppConfigState>(
      listenWhen: (prev, curr) => prev.language != curr.language,
      listener: (context, state) {
        getProfile();
      },
  child: BlocListener<UpdateProfileBloc, BaseState<void>>(
      listener: (context, state) {
        if(state.isLoading) {
          LoadingComponent.showProgressModal(context);
        } else if (state.isError) {
          FailureComponent.handleFailure(context: context, failure: state.failure);
          context.pop();
        } else if (state.isSuccess) {
          showToast(message: S.of(context).success);
          getProfile();
          context.pop();
        }
      },
      child: BlocBuilder<ClientProfileBloc, BaseState<ClientProfileEntity>>(
          builder: (context, state) {
            return Column(
              children: [
                ProfileTopWidget(image: state.isSuccess ? state.data?.imageUrl ?? '' : '', onEdit: _onImageEdit, onDelete: _onImageDelete),
                const SizedBox(height: 25),
                if(state.isLoading)...[
                  const SizedBox(height: 50),
                  const LoadingComponent(),
                ]
                else if(state.isError)...{
                  FailureComponent(failure: state.failure, retry: getProfile),
                } else if(state.isSuccess)...{
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: false,
                        onRefresh: getProfile,
                        physics: const BouncingScrollPhysics(),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Text(state.data!.name, style: context.f25700?.copyWith(letterSpacing: 1.6), textAlign: TextAlign.center),
                            const SizedBox(height: 20),
                            buildEmail(context),
                            const SizedBox(height: 20),
                            buildProfileInfo(context, state),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                }
              ],
            );
          }
      ),
    ),
);
  }

  Widget buildEmail(BuildContext context) {
    return Row(
      children: [
        Text("${S.of(context).email}:", style: context.f14400),
        const SizedBox(width: 10),
        Text(CacheStorageServices().email, style: context.f15400),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
      ],
    );
  }

  Widget buildProfileInfo(
      BuildContext context, BaseState<ClientProfileEntity> state) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(),
              Text("${S.of(context).name}:", style: context.f15700),
              const SizedBox(height: 5),
              Text(state.data!.name, style: context.f15400),
              const SizedBox(height: 10),
            ],
          ),
        ),
        PositionedDirectional(
            end: 10,
            top: 10,
            child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle
                ),
                child: IconButton(onPressed: () => _editProfileInfo(state.data!), icon: const Icon(Icons.edit)))),
      ],
    );
  }

  Future<void> _onImageEdit () async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      _updateBloc.add(UpdateClientProfileImageEvent(image: image));
    }
  }

  void _editProfileInfo (ClientProfileEntity profile) async {
    context.push(ClientEditProfileRoute.name, extra: profile);
  }

  void _onImageDelete () {
    _updateBloc.add(const DeleteClientProfileImageEvent());
  }
}