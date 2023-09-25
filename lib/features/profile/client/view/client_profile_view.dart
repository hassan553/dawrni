import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/features/profile/client/cubit/client/client_profile_cubit.dart';
import 'package:dawrni/features/profile/client/data/model/client_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class ClientProfileView extends StatefulWidget {
  const ClientProfileView({super.key});

  @override
  State<ClientProfileView> createState() => _ClientProfileViewState();
}

class _ClientProfileViewState extends State<ClientProfileView> {
  var formKey = GlobalKey<FormState>();
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: BlocBuilder<ClientProfileCubit, ClientProfileState>(
            builder: (context, state) {
          var cubit = ClientProfileCubit.get(context);
          if (cubit.clientModel != null) {
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
                            width: screenSize(context).width,
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
                                    } else if (state
                                        is UpdateClientProfileImageErrorState) {}
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
                        profileData(
                          cubit.clientModel!.name,
                        ),
                        const SizedBox(height: 15),
                        profileData(
                          cubit.clientModel!.phone,
                        ),
                        const SizedBox(height: 15),
                        profileData('Password'),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          function: () {
                            cubit.updateName(name);
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
            return const Center(child: CustomLoadingWidget());
          } else if (state is GetClientProfileErrorState) {
            return Text(
              state.error,
              style: TextStyle(color: Colors.amber),
            );
          }
          return Text(
            'error',
            style: TextStyle(color: Colors.amber),
          );
        }),
      ),
    );
  }

  Row profileData(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            cursorColor: AppColors.white,
            style: const TextStyle(color: AppColors.white),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * .5, h + 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
