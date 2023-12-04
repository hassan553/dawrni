import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/utils/app_validator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/book_bloc/book_bloc.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CompanyDetailsView extends StatelessWidget {
  final CompanyEntity company;

  CompanyDetailsView({Key? key, required this.company})
      : super(key: key); // Fix the constructor
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  late final BookBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<BookBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: BlocListener<BookBloc, BaseState<void>>(
        listener: (context, state) {
          if (state.isSuccess) {
            showToast(message: S.of(context).success);
          }
          else if (state.isError) {
            FailureComponent.handleFailure(
                context: context, failure: state.failure);
          }
        },
        child: Stack(
          children: [
            buildTopImage(),
            Stack(
              children: [
                buildProfileData(context),
                buildProfileImage(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileData(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.offBlack,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      ),
      child: ListView(
        children: [
          const SizedBox(height: 90),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(company.name, style: context.f25700),
                  const SizedBox(height: 20),
                  Text(company.category.name, style: context.f20400),
                ],
              ),
              if(company.isCertified)
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
          Text(S.of(context).about, style: context.f20700),
          const SizedBox(height: 20),
          Text(
              company.about,
              style: context.f15300),
          const SizedBox(height: 20),
          GalleryImage(
            imageUrls: company.photos.map((e) => e.imageUrl).toList(),
            numOfShowImages: company.photos.length,
            titleGallery: "Title",
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: AppButton(
                    onPressed: () {
                      showBookDialog(context);
                    },
                    type: AppButtonType.gradientPrimary,
                    text: S.of(context).bookNow),
              ),
              const SizedBox(width: 20),
              Container(
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(ImagesPaths.chatPng),
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 120),
          decoration: const BoxDecoration(
              color: AppColors.offBlack, shape: BoxShape.circle),
          height: 160,
          width: 160,
          child: AppNetworkImage(
            url:
                company.image,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }

  Widget buildTopImage() {
    return Column(
      children: [
        SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              ImagesPaths.backgroundImagePng,
              fit: BoxFit.cover,
            )),
      ],
    );
  }

  Future<void> showBookDialog(BuildContext context) async {

    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return buildBookDialog();
        });
  }

  Widget buildBookDialog() {
    return BlocConsumer<BookBloc, BaseState<void>>(
      bloc: _bloc,
        listener: (context, state) {
          if (state.isSuccess) {
            context.pop();
          }
        },
        builder: (context, state) {
      return Dialog(
        backgroundColor: AppColors.offBlack,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Text", style: context.f20700),
                const SizedBox(height: 20),
               AppTextField(
                 controller: _dateController,
                 hintText: S.of(context).selectDate,
                 readOnly: true,
                 validator: AppValidator(validators: [
                   InputValidator.requiredField,
                 ]).validate,
                 onTap: () async {
                   var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                     lastDate: DateTime.now().add(const Duration(days: 9000))
                    );
                   if(date != null) {
                     pickedDate = date;
                     _dateController.text = DateFormat.yMMMd().format(pickedDate!);
                   }
                  },
               ),
               AppTextField(
                 controller: _timeController,
                 hintText: S.of(context).selectTime,
                 validator: AppValidator(validators: [
                   InputValidator.requiredField,
                 ]).validate,
                 readOnly: true,
                 onTap: () async {
                   var time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if(time != null) {
                      pickedTime = time;
                     _timeController.text = pickedTime!.format(context);
                   }
                 },
               ),
                const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                            text: S.of(context).cancel,
                            onPressed: () {
                              context.pop();
                            }),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AppButton(
                            text: S.of(context).confirm,
                            loading: state.isLoading,
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                var selectedDate = DateTime(
                                  pickedDate!.year,
                                  pickedDate!.month,
                                  pickedDate!.day,
                                  pickedTime!.hour,
                                  pickedTime!.minute,
                                );
                                _bloc.add(BookButtonPressedEvent(companyId: company.id, dateTime: selectedDate));
                              }
                            }),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }

}
