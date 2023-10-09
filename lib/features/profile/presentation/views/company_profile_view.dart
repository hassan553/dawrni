import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/services/location_service.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/core/widgets/snack_bar_widget.dart';
import 'package:dawrni/features/profile/presentation/cubit/company/company_profile_cubit.dart';
import 'package:dawrni/features/profile/presentation/widgets/custom-loading_profile_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../../../core/widgets/show_awesomeDialog.dart';

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final description = TextEditingController();
  final from = TextEditingController();
  final to = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double sliderValue = 50;
  bool isTap = false;
  int currentIndex = 0;
  List<String> days = ['Sun', 'Mon', 'Thu', 'Wed', 'Fri', 'Sat'];
  Set<String> selectedDays = {};
  void toggleDay(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  late Position position;
  Future<void> getMyCurrentLocation() async {
    position = await LocationService().determinePosition().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  void dispose() {
    name.dispose();
    description.dispose();
    phone.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
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
          if (state is UpdateDataSuccessState) {
            showSnackBarWidget(
                context: context,
                message: 'Success Update Data',
                requestStates: RequestStates.success);
          }
          if (state is UpdateDataErrorState) {
            showAwesomeDialog(
              context: context,
              description: "An Error ,Please Try Again",
              buttonText: 'Try Again',
              status: RequestStates.error,
            );
          }
        }, builder: (context, state) {
          var cubit = CompanyProfileCubit.get(context);
          if (cubit.companyModel != null) {
            cubit.images = cubit.companyModel?.images ?? [];
            from.text = cubit.companyModel!.from;
            to.text = cubit.companyModel!.to;
            name.text = cubit.companyModel?.name ?? 'name';
            description.text = cubit.companyModel?.description == ''
                ? ''
                : cubit.companyModel!.description;
            phone.text = cubit.companyModel?.phone == ''
                ? ''
                : cubit.companyModel!.phone;
            address.text = cubit.companyModel?.address == ''
                ? ''
                : cubit.companyModel!.address;
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 220,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        _backgroundTopImage(context),
                        _userCircalImage(cubit),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _displayName(cubit),
                        const SizedBox(height: 40),
                        _ratingWidget(cubit),
                        const SizedBox(height: 40),
                        _sliderBar(),
                        const SizedBox(
                          height: 40,
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
                          height: 20,
                        ),
                        profileData('Name', name, true),
                        const SizedBox(height: 15),
                        profileData('Address', address, true),
                        const SizedBox(height: 15),
                        profileData('Description', description, true),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            cubit.changePassword(cubit.companyModel!.email);
                          },
                          child: profileData(
                            '',
                            TextEditingController(text: 'Change Password'),
                            false,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Portfolio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocListener<CompanyProfileCubit, CompanyProfileState>(
                          listener: (context, state) {},
                          child: Wrap(
                            children: [
                              _selectImagesWidget(cubit),
                              if (cubit.companyModel?.images.isEmpty ??
                                  true) ...[
                                Container()
                              ] else ...[
                                ...List.generate(
                                  state is SelectImagesSuccessState
                                      ? state.images.length
                                      : cubit.companyModel?.images.length ?? 0,
                                  (index) => Container(
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsetsDirectional.all(8),
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            cubit.companyModel!.images[index]),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Wrap(
                          children: List.generate(days.length, (index) {
                            final day = days[index];
                            final isSelected = selectedDays.contains(day);
                            return InkWell(
                                onTap: () => toggleDay(day),
                                child: dayWidget(days[index], isSelected));
                          }),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // Row(
                        //   children: [
                        //     InkWell(
                        //       onTap: () => setState(() {
                        //         isTap = !isTap;
                        //       }),
                        //       child: Container(
                        //         width: 15,
                        //         height: 15,
                        //         decoration: ShapeDecoration(
                        //           color: isTap
                        //               ? AppColors.primaryColor
                        //               : Colors.white
                        //                   .withOpacity(0.10000000149011612),
                        //           shape: const OvalBorder(
                        //             side: BorderSide(
                        //                 width: 1, color: Color(0xFFFF8700)),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 15),
                        //     const Text(
                        //       'We don’t work on this day',
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 15,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 40,
                        // ),
                        _selectTimeWidget(context),
                        const SizedBox(
                          height: 40,
                        ),
                        BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
                          builder: (context, state) {
                            return state is UpdateDataLoadingState
                                ? const CustomLoadingWidget()
                                : CustomButton(
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.updateProfile(
                                            name: name.text,
                                            description: description.text,
                                            address: address.text,
                                            latlong: [
                                              position.latitude,
                                              position.longitude
                                            ],
                                            from: from.text,
                                            to: to.text,
                                            workingDays: selectedDays.toList());
                                      }
                                    },
                                    color: AppColors.primaryColor,
                                    textColor: AppColors.white,
                                    fontSize: .04,
                                    title: ' Save Changes',
                                  );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetCompanyProfileLoadingState) {
            return const CustomLoadingProfile();
          } else if (state is GetCompanyProfileErrorState) {
            return _errorWidget(state, cubit);
          }
          return const Text(
            'error',
            style: TextStyle(color: Colors.amber),
          );
        }),
      ),
    );
  }

  Center _errorWidget(
      GetCompanyProfileErrorState state, CompanyProfileCubit cubit) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.error,
            style: const TextStyle(color: Colors.amber),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 250,
            child: CustomButton(
              function: () {
                cubit.fetchCompanyProfile();
              },
              color: AppColors.primaryColor,
              textColor: AppColors.white,
              fontSize: .04,
              title: ' Try Again',
            ),
          )
        ],
      ),
    );
  }

  Row _selectTimeWidget(context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'From',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: InkWell(
                    onTap: () async {
                      from.text = await CompanyProfileCubit.get(context)
                          .selectTime(context);
                    },
                    child: profileData('From', from, false)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'To',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: InkWell(
                    onTap: () async {
                      to.text = await CompanyProfileCubit.get(context)
                          .selectTime(context);
                    },
                    child: profileData('To', to, false)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell _selectImagesWidget(CompanyProfileCubit cubit) {
    return InkWell(
      onTap: () {
        cubit.seletImages();
      },
      child: DottedBorder(
        color: AppColors.primaryColor,
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        padding: const EdgeInsets.all(4),
        strokeWidth: 1,
        strokeCap: StrokeCap.butt,
        borderPadding: const EdgeInsets.only(top: 10, right: 5),
        child: const SizedBox(
          width: 80,
          height: 80,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF8700),
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Add Feed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF8700),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Column _sliderBar() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 8,
                padding: const EdgeInsets.all(0),
                decoration: const ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 8,
                padding: const EdgeInsets.all(0),
                decoration: const ShapeDecoration(
                  color: AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            '50 %',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Align _ratingWidget(CompanyProfileCubit cubit) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/im.png', width: 16, fit: BoxFit.fill),
                    const SizedBox(width: 8),
                    ResponsiveText(
                      text: 'Apartment repair',
                      scaleFactor: .045,
                      fontWeight: FontWeight.w400,
                      color: AppColors.offWhite,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: cubit.companyModel?.rating == 0
                              ? AppColors.offWhite
                              : Colors.amber,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    ResponsiveText(
                      text: '(${cubit.companyModel?.rating})',
                      scaleFactor: .04,
                      fontWeight: FontWeight.w400,
                      color: AppColors.offWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset('assets/imm.png', width: 60, fit: BoxFit.fill),
        ],
      ),
    );
  }

  Align _displayName(CompanyProfileCubit cubit) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Text(
        cubit.companyModel?.name ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  Positioned _userCircalImage(CompanyProfileCubit cubit) {
    return Positioned(
      bottom: 0,
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            cubit.imageProfile == null
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(cubit.companyModel?.image ??
                        'https://cdn-icons-png.flaticon.com/512/2399/2399925.png'),
                  )
                : CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(cubit.imageProfile!),
                  ),
            Positioned(
              bottom: 2,
              right: 5,
              child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      cubit.updateUserImage();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(
                        Icons.border_color_outlined,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _backgroundTopImage(BuildContext context) {
    return Positioned(
        top: 0,
        child: Image.asset(
          'assets/rectangle-49-ZgK.png',
          height: 150,
          width: 100.w,
          fit: BoxFit.fill,
        ));
  }

  Container dayWidget(String title, bool isSelected) {
    return Container(
      width: 58.81,
      height: 37,
      margin: const EdgeInsetsDirectional.only(end: 15, bottom: 15),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.symmetric(vertical: 2),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.10000000149011612),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Row profileData(
      String label, TextEditingController controller, bool? enable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            validator: (String? value) {
              if (value == null) {
                return 'Not Vaild Empty Value';
              } else if (value.isEmpty) {
                return 'Not Vaild Empty Value';
              }
            },
            controller: controller,
            enabled: enable ?? true,
            cursorColor: AppColors.white,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
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
