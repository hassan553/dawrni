import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/features/profile/domain/entities/user_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/widgets/container_location.dart';
import 'package:dawrni/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:dawrni/features/profile/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {

// ************************************************* fields controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
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
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl<ProfileBloc>(),
        child: BlocConsumer<ProfileBloc, BaseState<UserProfileEntitiy>>(
          listener: (context, state) {
 
             if (state.isSuccess) {
              showToast(message: 'edit succss');
             }else if (state.isError) {
              FailureComponent.handleFailure(
                  context: context, failure: state.failure);
            }
          },
          builder: (context, state) {
            return state.isLoading
          ? const CustomLoadingWidget(): SingleChildScrollView(
              child: Form(
                key:formKey ,
                child: Column(
                  children: [
                    _buildTop(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.data?.name ??' ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    _buildNameField(
                        context,
                        _switchNameFieldWidget,
                        showNameListTile,
                        _doneFieldNameTapped,
                        _nameController,
                        state.data?.name ?? 'Add your Name'),
                    _buildPhoneNumberTextField(
                        __switchNumberFieldWidget,
                        showPhoneListTile,
                        _doneFieldPhoneNumberTapped,
                        _phoneController,
                        state.data?.phoneNumber ?? 'Add your Phone Number'),
                    _buildAddress(
                        _switchLocationFieldWidget,
                        showLocationListTile,
                        _switchLocationFieldWidget,
                        _addressController,
                        state.data?.address ?? 'Add your Location'),
                    _buildPassword(
                        _switchPasswordFieldWidget,
                        showPasswordListTile,
                        
                        _doneFieldPasswordTapped,
                        _passwordController,
                        _passwordConfirmController,
                        state.data?.password ?? 'Add Your Password'),
                  ],
                ),
              ),
            );
            //} else if (state.isError) {
            // return FailureComponent(failure: state.failure);
            //}
            return const LoadingComponent();
          },
        ),
      )
    );
  }
}
// ************************************************* method to build ui componen
Widget _buildTop() {
  return Stack(
    children: [
      Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: Image.asset(
            ImagesPaths.rectangleProfile,
            fit: BoxFit.fill,
            height: 185,
          )),
      const Positioned(
        top: 130,
        left: 150,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(ImagesPaths.ellipse),
        ),
      ),
      Positioned(
          top: 180,
          left: 200,
          child: IconButton(
              onPressed: null, icon: SvgPicture.asset(ImagesPaths.imageEdit)))
    ],
  );
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
