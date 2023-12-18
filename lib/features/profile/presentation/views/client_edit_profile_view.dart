import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/client_profile_bloc/client_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClientEditProfileView extends StatefulWidget {
  final ClientProfileEntity client;

  const ClientEditProfileView({super.key, required this.client});

  @override
  State<ClientEditProfileView> createState() => _ClientEditProfileViewState();
}

class _ClientEditProfileViewState extends State<ClientEditProfileView> {
  late final UpdateProfileBloc _updateBloc;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameEnController = TextEditingController();
  final TextEditingController _nameArController = TextEditingController();

  @override
  void initState() {
    _updateBloc = context.read<UpdateProfileBloc>();
    _nameEnController.text = widget.client.nameEn ?? '';
    _nameArController.text = widget.client.nameAr ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameEnController.dispose();
    _nameArController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).editProfile)),
        body: BlocListener<UpdateProfileBloc, BaseState<void>>(
          listener: (context, state) {
            if (state.isError) {
              FailureComponent.handleFailure(
                  context: context, failure: state.failure);
            } else if (state.isSuccess) {
              showToast(message: S.of(context).success);
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  context
                      .read<ClientProfileBloc>()
                      .add(const FetchClientProfileEvent());
                  context.pop();
                },
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    AppTextField(
                      labelText: S.of(context).nameEn,
                      hintText: S.of(context).nameEnHint,
                      controller: _nameEnController,
                    ),
                    AppTextField(
                      labelText: S.of(context).nameAr,
                      hintText: S.of(context).nameArHint,
                      controller: _nameArController,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<UpdateProfileBloc, BaseState<void>>(
                      builder: (context, state) {
                        return AppButton(
                          text: S.of(context).confirm,
                          onPressed: _onConfirm,
                          loading: state.isLoading,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _onConfirm() {
    if (_formKey.currentState?.validate() ?? false) {
      _updateBloc.add(UpdateClientProfileEvent(
        nameEn: _nameEnController.text,
        nameAr: _nameArController.text,
      ));
    }
  }
}
