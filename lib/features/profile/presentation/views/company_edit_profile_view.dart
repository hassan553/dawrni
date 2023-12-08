import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/company_profile_bloc/company_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CompanyEditProfileView extends StatefulWidget {
  final CompanyProfileEntity company;
  const CompanyEditProfileView({super.key, required this.company});

  @override
  State<CompanyEditProfileView> createState() => _CompanyEditProfileViewState();
}

class _CompanyEditProfileViewState extends State<CompanyEditProfileView> {
  late final UpdateProfileBloc _updateBloc;

  final GlobalKey<FormState> _formKey = GlobalKey();
  
  final TextEditingController _nameEnController = TextEditingController();
  final TextEditingController _nameArController = TextEditingController();
  final TextEditingController _addressEnController = TextEditingController();
  final TextEditingController _addressArController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutArController = TextEditingController();
  CategoryEntity? category;

  
  @override
  void initState() {
    _updateBloc = context.read<UpdateProfileBloc>();
    _nameEnController.text = widget.company.nameEn ?? '';
    _nameArController.text = widget.company.nameAr ?? '';
    _addressEnController.text = widget.company.addressEn ?? '';
    _addressArController.text = widget.company.addressAr ?? '';
    _aboutEnController.text = widget.company.aboutEn ?? '';
    _aboutArController.text = widget.company.aboutAr ?? '';
    category = widget.company.category;
    super.initState();
  }

  @override
  void dispose() {
    _nameEnController.dispose();
    _nameArController.dispose();
    _addressEnController.dispose();
    _addressArController.dispose();
    _aboutEnController.dispose();
    _aboutArController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).editProfile)),
      body: BlocListener<UpdateProfileBloc, BaseState<void>>(
        listener: (context, state) {
          if (state.isError) {
            FailureComponent.handleFailure(context: context, failure: state.failure);
          } else if (state.isSuccess) {
            showToast(message: S.of(context).success);
            WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    context.read<CompanyProfileBloc>().add(const FetchCompanyProfileEvent());
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
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(S.of(context).category, style: context.f16500),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: DropdownButtonFormField<CategoryEntity>(
                      value: category,
                      validator: (val) => val == null ? S.current.requiredField : null,
                      items: AppConstants.categories.map<DropdownMenuItem<CategoryEntity>>(
                            (CategoryEntity val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val.name ?? '', style: context.f16500,
                            ),
                          );
                        },
                      ).toList(),
                      decoration: InputDecoration(
                        errorStyle: context.f14400?.copyWith(color: Colors.redAccent),
                        fillColor: Colors.white.withOpacity(0.1),
                        filled: true,
                        isDense: false,
                        counter: const SizedBox(),
                        labelStyle: context.f16700?.copyWith(color: Colors.black.withOpacity(0.25)),
                        floatingLabelStyle: context.f18600?.copyWith(color: Colors.black, letterSpacing: 1.2),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.w),
                        // floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: S.of(context).category,
                        hintStyle: context.f14400?.copyWith(color: AppColors.lightGrey),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(16.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(16.0)
                            ),
                        focusedBorder:
                            OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(16.0)
                            ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          category = val;
                        });
                      },
                    ),
                  ),
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
                  AppTextField(
                    labelText: S.of(context).addressEn,
                    hintText: S.of(context).addressEnHint,
                    controller: _addressEnController,
                  ),
                  AppTextField(
                    labelText: S.of(context).addressAr,
                    hintText: S.of(context).addressArHint,
                    controller: _addressArController,
                  ),
                  AppTextField(
                    labelText: S.of(context).aboutEn,
                    hintText: S.of(context).aboutEnHint,
                    controller: _aboutEnController,
                  ),
                  AppTextField(
                    labelText: S.of(context).aboutAr,
                    hintText: S.of(context).aboutArHint,
                    controller: _aboutArController,
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
      )
    );
  }

  void _onConfirm () {
    if (_formKey.currentState?.validate() ?? false) {
      _updateBloc.add(UpdateCompanyProfileEvent(
        nameEn: _nameEnController.text,
        nameAr: _nameArController.text,
        addressEn: _addressEnController.text,
        addressAr: _addressArController.text,
        aboutEn: _aboutEnController.text,
        aboutAr: _aboutArController.text,
        categoryId: category?.id
      ));
    }
  }
}