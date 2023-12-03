import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/domain/entities/user_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/company_profile_bloc/company_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/widgets/company_photo_card.dart';
import 'package:dawrni/features/profile/presentation/widgets/container_location.dart';
import 'package:dawrni/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:dawrni/features/profile/presentation/widgets/password_field.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  late final CompanyProfileBloc _bloc;

// ************************************************* fields controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  
  @override
  void initState() {
    _bloc = context.read<CompanyProfileBloc>();
    _bloc.add(const FetchCompanyProfileEvent());
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void getProfile() {
    _bloc.add(const FetchCompanyProfileEvent());
  }

// ************************************************* form key
    final formKey = GlobalKey<FormState>();

// ************************************************* bool for switch methods

  bool showPasswordListTile = true;
  bool showLocationListTile = true;
  bool showNameListTile = true;
  bool showPhoneListTile = true;
  // ************************************************ Tapped Done Method to update user info
  void _doneFieldNameTapped(BuildContext context) {
    context.read<ProfileBloc>().add(PostUserProfileEvent(
          name: _nameController.text,
        ));

    _switchNameFieldWidget();
  }
  void _doneFieldPhoneNumberTapped(BuildContext context) {
        context.read<ProfileBloc>().add(PostUserProfileEvent(
          phoneNumber: _phoneController.text,
        ));

    __switchNumberFieldWidget();
  }
  void _doneFieldPasswordTapped(BuildContext context) {

        context.read<ProfileBloc>().add(PostUserProfileEvent(
          password: _passwordController.text,
          confirmPassword: _passwordConfirmController.text
        ));

       _switchPasswordFieldWidget(   ) ;
  }
 
//  ************************************************* switch method
  void _switchPasswordFieldWidget() {
    setState(() {
      showPasswordListTile = !showPasswordListTile;
    });
  }

  void _switchLocationFieldWidget() {
    setState(() {
      showLocationListTile = !showLocationListTile;
    });
  }

  void _switchNameFieldWidget() {
    setState(() {
      showNameListTile = !showNameListTile;
    });
  }

  void __switchNumberFieldWidget() {
    setState(() {
      showPhoneListTile = !showPhoneListTile;
    });
  }
//  ************************************************* build method
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyProfileBloc, BaseState<CompanyProfileEntity>>(
        builder: (context, state) {
          return Column(
            children: [
              buildTop(context, state),
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
                    child: ListView(
                      children: [
                        Text(state.data!.name, style: context.f25700?.copyWith(letterSpacing: 1.6), textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.data!.category?.name ?? '', style: context.f20400),
                            const Spacer(),
                            if(true || state.data!.isCertified)
                            Column(
                              children: [
                                Image.asset(ImagesPaths.certifiedPng, height: 40, width: 40),
                                const SizedBox(height: 7),
                                Text(S.of(context).certified, style: context.f15600)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 5.0.w,
                          percent: 0.7,
                          linearStrokeCap: LinearStrokeCap.butt,
                          backgroundColor: AppColors.white.withOpacity(0.1),
                          progressColor: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("70 %", style: context.f14700?.copyWith(color: AppColors.primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        buildProfileInfo(context, state),
                        const SizedBox(height: 40),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          crossAxisCount: 3,
                          childAspectRatio: 9 / 10,
                          physics: const NeverScrollableScrollPhysics(),
                          children: (state.data?.photos?.map((e) => CompanyPhotoCard(id: e.id , imageUrl: e.imageUrl)).toList()?..insert(0, const CompanyPhotoCard())) ?? [],
                        ),
                    const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
        }
            ],
          );
        }
    );
  }

  Widget buildProfileInfo(
      BuildContext context, BaseState<CompanyProfileEntity> state) {
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
              Text("${S.of(context).name}:", style: context.f15700),
              const SizedBox(height: 5),
              Text(state.data!.name, style: context.f15400),
              const SizedBox(height: 10),
              Text("${S.of(context).address}:", style: context.f15700),
              const SizedBox(height: 5),
              Text(state.data!.address, style: context.f15400),
              const SizedBox(height: 10),
              Text("${S.of(context).about}:", style: context.f15700),
              const SizedBox(height: 5),
              Text(state.data!.about, style: context.f15400),
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
                child: IconButton(onPressed: () {

                }, icon: const Icon(Icons.edit)))),
      ],
    );
  }

  Widget buildTop(BuildContext context, BaseState<CompanyProfileEntity> state) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.only(bottom: 70),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 50))),
        ),
        if(state.isSuccess)...{
          Positioned(
              top: 80,
              height: 140,
              width: 140,
              child: Stack(
                children: [
                  (state.data!.imageUrl?.isEmpty ?? true) ? Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 140,
                    ),
                  ) : AppNetworkImage(
                    url: state.data!.imageUrl!,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.edit, color: AppColors.primaryColor)),
                    ),
                  ),
                  if(state.data?.imageUrl?.isNotEmpty ?? false)
                  PositionedDirectional(
                    bottom: 0,
                    start: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.remove, color: Colors.red)),
                    ),
                  ),
                ],
              )),
        }
      ],
    );
  }
}
Widget _buildNameField(
    BuildContext context,
    void Function()? onPressedEdit,
    bool showListTile,
    void Function(BuildContext context)? onPressedDone,
    TextEditingController nameController,
    String name) {
  return AnimatedSwitcher(
      switchInCurve: Curves.easeInSine,
      switchOutCurve: Curves.easeInOutBack,
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      child: showListTile
          ? CustomListTile(title: name, onPressed: onPressedEdit)
          : SizedBox(
              width: 350,
              child: AppTextField(
                  controller: nameController,
                  prefixIcon: Image.asset(ImagesPaths.personPng),
                  suffixIcon: IconButton(
                      onPressed: () => onPressedDone!(context),
                      icon: SvgPicture.asset(ImagesPaths.profDone))),
            ));
}

Widget _buildPhoneNumberTextField(
    void Function()? onPressedEdit,
    bool showListTile,
    void Function(BuildContext context)? onPressedDone,
    TextEditingController phoneController,
    String phone) {
  return AnimatedSwitcher(
      switchInCurve: Curves.easeInSine,
      switchOutCurve: Curves.easeInOutBack,
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      child: showListTile
          ? CustomListTile(title: phone, onPressed: onPressedEdit)
          : SizedBox(
              width: 350,
              child: AppTextField(
                  controller: phoneController,
                  prefixIcon: SvgPicture.asset(
                    ImagesPaths.phone,
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () => onPressedDone,
                      icon: SvgPicture.asset(ImagesPaths.profDone))),
            ));
}

Widget _buildAddress(
    void Function()? onPressedEdit,
    bool showListTile,
    void Function()? onPressedDone,
    TextEditingController phoneController,
    String phone) {
  return AnimatedSwitcher(
      switchInCurve: Curves.easeInSine,
      switchOutCurve: Curves.easeInOutBack,
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      child: showListTile
          ? CustomListTile(title: phone, onPressed: onPressedEdit)
          : const ContainerLocation());
}

Widget _buildPassword(
    void Function()? onPressedEdit,
    bool showListTile,
    void Function(BuildContext context)? onPressedConfirmPassowrd,
    TextEditingController passowrdController,
    TextEditingController confirmPassowrdController,
    String password) {
  return AnimatedSwitcher(
      switchInCurve: Curves.easeInSine,
      switchOutCurve: Curves.easeInOutBack,
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      child: showListTile
          ? CustomListTile(title: password, onPressed: onPressedEdit)
          : SizedBox(
              width: 350,
              child: PassowrdField(
                  passwordController: passowrdController,
                  confirmPasswordController: confirmPassowrdController,
                  onPressedConfirmPassowrd:()=> onPressedConfirmPassowrd)));
}
