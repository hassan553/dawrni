import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/constants/constants.dart';
import 'package:dawrni/core/widgets/show_awesomeDialog.dart';
import 'package:dawrni/core/widgets/snack_bar_widget.dart';
import 'package:dawrni/features/profile/presentation/cubit/client/client_profile_cubit.dart';
import 'package:dawrni/features/profile/presentation/widgets/custom-loading_profile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_filed.dart';

class ClientProfileView extends StatefulWidget {
  const ClientProfileView({super.key});

  @override
  State<ClientProfileView> createState() => _ClientProfileViewState();
}

class _ClientProfileViewState extends State<ClientProfileView> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: BlocConsumer<ClientProfileCubit, ClientProfileState>(
            listener: (context, state) {
          if (state is NoInternetState) {
            showAwesomeDialog(
              context: context,
              description: "No Internet Connection",
              buttonText: 'Check Connection',
              status: RequestStates.warrning,
            );
          }
          if (state is ChangePasswordErrorState) {
            showAwesomeDialog(
              context: context,
              description: 'An Error ,Please Try Again',
              buttonText: 'Try Again',
            );
          }
          if (state is ChangePasswordSuccessState) {
            showAwesomeDialog(
              context: context,
              description: "We Send An Email To You ",
              buttonText: 'OK',
              status: RequestStates.success,
            );
          }
        }, builder: (context, state) {
          var cubit = ClientProfileCubit.get(context);
          if (cubit.clientModel != null) {
            nameController.text = cubit.clientModel?.name ?? '';
            phoneController.text = cubit.clientModel?.phone ?? '';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 220,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                          top: 0,
                          child: Image.asset(
                            'assets/rectangle-49-ZgK.png',
                            height: 150,
                            width: 100.w,
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        bottom: 0,
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              cubit.imageProfile == null
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage: NetworkImage(
                                          cubit.clientModel!.image),
                                    )
                                  : CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          FileImage(cubit.imageProfile!),
                                    ),
                              Positioned(
                                bottom: 2,
                                right: 5,
                                child: BlocListener<ClientProfileCubit,
                                    ClientProfileState>(
                                  listener: (context, state) {
                                    if (state
                                        is UpdateClientProfileImageSuccessState) {
                                      showSnackBarWidget(
                                          context: context,
                                          message: 'Successfuly Change Image',
                                          requestStates: RequestStates.success);
                                    } else if (state
                                        is UpdateClientProfileImageErrorState) {
                                      showAwesomeDialog(
                                        context: context,
                                        description: '',
                                        buttonText: 'Try Again',
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: InkWell(
                                      onTap: () {
                                        cubit.updateUserImage();
                                      },
                                      child: const Icon(
                                        Icons.border_color_outlined,
                                        color: Colors.orange,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(27),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            cubit.clientModel!.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        profileData('Name', nameController, true),
                        const SizedBox(height: 15),
                        BlocBuilder<ClientProfileCubit, ClientProfileState>(
                          builder: (context, state) {
                            if (!cubit.isTab) {
                              return profileData(
                                  'Phone Number', phoneController, true);
                            } else {
                              return customPhoneWidget();
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            cubit.changePassword(cubit.clientModel!.email);
                          },
                          child: profileData(
                              '',
                              TextEditingController(text: 'Change Password'),
                              false),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          function: () {
                            cubit.updateName(nameController.text);
                          },
                          color: AppColors.primaryColor,
                          textColor: AppColors.white,
                          fontSize: .04,
                          title: ' Save Changes',
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetClientProfileLoadingState) {
            return const CustomLoadingProfile();
          } else if (state is GetClientProfileErrorState) {
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 200),
                    const Text(
                      'An Error ,Try Again',
                      style: TextStyle(color: Colors.amber),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      child: CustomButton(
                        function: () {
                          cubit.fetchClientProfile();
                        },
                        color: AppColors.primaryColor,
                        textColor: AppColors.white,
                        fontSize: .04,
                        title: ' Try Again',
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const Text(
            'error',
            style: TextStyle(color: Colors.amber),
          );
        }),
      ),
    );
  }

  Widget customPhoneWidget() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 47,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.secondColor,
              ),
              child: FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(generateCountryFlag(),
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 5),
                    Text('+965',
                        style:
                            TextStyle(color: AppColors.offWhite, fontSize: 13)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextFieldWidget(
                icon: Image.asset('assets/Group.png'),
                keyboard: TextInputType.number,
                controller: phoneController,
                valid: (String? value) {
                  if (value == null) {
                    return 'Not Valid empty value';
                  } else if (value.length < 11) {
                    return 'not valid phone number';
                  } else {
                    return null;
                  }
                },
                hintText: 'Phone Number',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          icon: Image.asset('assets/Group.png'),
          keyboard: TextInputType.number,
          controller: phoneController,
          valid: (String? value) {
            if (value == null) {
              return 'Not Valid empty value';
            } else if (value.length < 11) {
              return 'not valid phone number';
            } else {
              return null;
            }
          },
          hintText: 'Phone Number',
        ),
        const SizedBox(height: 10),
        BlocBuilder<ClientProfileCubit, ClientProfileState>(
          builder: (context, state) => InkWell(
            onTap: () {
              ClientProfileCubit.get(context).changeIsTab();
            },
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                width: 70,
                height: 47,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.secondColor,
                ),
                child: Text('Close',
                    style: TextStyle(color: AppColors.offWhite, fontSize: 13)),
              ),
            ),
          ),
        ),
        // PinCodeTextField(
        //   appContext: context,
        //   controller: TextEditingController(),
        //   length: 6,
        //   textStyle: const TextStyle(color: Colors.white),
        //   pinTheme: PinTheme(
        //     shape: PinCodeFieldShape.box,
        //     borderRadius: BorderRadius.circular(10),
        //     fieldHeight: 50,
        //     fieldWidth: screenSize(context).width * .1,
        //     activeFillColor: AppColors.secondColor,
        //     inactiveColor: AppColors.secondColor,
        //     selectedColor: AppColors.secondColor,
        //     activeColor: AppColors.offWhite,
        //     selectedFillColor: AppColors.secondColor,
        //     inactiveFillColor: AppColors.secondColor,
        //   ),
        //   cursorColor: Colors.white,
        //   animationDuration: const Duration(milliseconds: 300),
        //   enableActiveFill: true,
        //   keyboardType: TextInputType.number,
        //   onChanged: (value) {},
        //   onCompleted: (value) {
        //     if (value.length == 6) {
        //       //PhoneAuthCubit.get(context).submitOTPForLogin(value);
        //     }
        //   },
        // ),
      ],
    );
  }

  Row profileData(
      String label, TextEditingController controller, bool? enable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            enabled: enable ?? true,
            controller: controller,
            cursorColor: AppColors.white,
            style: const TextStyle(color: AppColors.white),
            validator: (String? value) {
              if (value == null) {
                return 'Not Valid Empty Value';
              }
              if (value.isEmpty) {
                return 'Not Valid Empty Value';
              }
              return null;
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              //hintText: controller.text,
              labelText: label,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const Icon(
          Icons.border_color_outlined,
          color: Colors.orange,
          size: 24,
        ),
      ],
    );
  }
}
