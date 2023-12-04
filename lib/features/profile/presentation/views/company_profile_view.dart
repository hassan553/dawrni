import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/company_profile_bloc/company_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/widgets/company_photo_card.dart';
import 'package:dawrni/features/profile/presentation/widgets/profile_top_widget.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  late final CompanyProfileBloc _bloc;

  
  @override
  void initState() {
    _bloc = context.read<CompanyProfileBloc>();
    _bloc.add(const FetchCompanyProfileEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getProfile() {
    _bloc.add(const FetchCompanyProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyProfileBloc, BaseState<CompanyProfileEntity>>(
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
                    child: ListView(
                      children: [
                        Text(state.data!.name, style: context.f25700?.copyWith(letterSpacing: 1.6), textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.data!.category?.name ?? '', style: context.f20400),
                            const Spacer(),
                            if(state.data!.isCertified)
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

  void _onImageEdit () {}

  void _onImageDelete () {}
}