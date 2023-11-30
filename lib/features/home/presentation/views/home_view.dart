import 'package:carousel_slider/carousel_slider.dart';
import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/companies_bloc/companies_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/edit_favorites_bloc/edit_favorites_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/all_company_route.dart';
import 'package:dawrni/features/home/presentation/widgets/category_card.dart';
import 'package:dawrni/features/home/presentation/widgets/company_card.dart';
import 'package:dawrni/features/home/presentation/widgets/company_widget.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _searchController = TextEditingController();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<CompaniesBloc>()..add(const FetchCompaniesEvent())),
        BlocProvider(
            create: (_) => sl<EditFavoritesBloc>()),
      ],
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
        child: BlocListener<EditFavoritesBloc, BaseState<void>>(
          listener: (context, state) {
            if (state.isLoading) {
              LoadingComponent.showProgressModal(context);
            } else if (state.isError) {
              FailureComponent.handleFailure(
                  context: context, failure: state.failure);
              context.pop();
            } else if (state.isSuccess) {
              showToast(message: S.of(context).success);
              getCompanies(context, refresh: true);
              context.pop();
            }
          },
          child: BlocBuilder<CompaniesBloc, BaseState<CompaniesEntity>>(
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingComponent();
              } else if (state.isError) {
                return FailureComponent(
                  failure: state.failure,
                  retry: () => getCompanies(context),
                );
              } else if (state.isSuccess) {
                return SmartRefresher(
                  controller: refreshController,
                  onRefresh: () => getCompanies(context, refresh: true),
                  // onLoading: () => getCompanies(context),
                  enablePullUp: false,
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      Text(S.of(context).homeMessage, style: context.f28800),
                      const SizedBox(height: 40),
                      buildSearch(context),
                      buildCategories(),
                      const SizedBox(height: 20),
                      buildIndicator(context),
                      const SizedBox(height: 20),
                      Text(S.of(context).ourBestServices, style: context.f20700),
                      const SizedBox(height: 20),
                      ...state.data?.companies
                              .map((e) => CompanyCard(company: e))
                              .toList() ??
                          [],
                      if (false)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ResponsiveText(
                              text: 'Our Best Services',
                              color: AppColors.white,
                              scaleFactor: .04,
                              fontWeight: FontWeight.bold,
                            ),
                            InkWell(
                              onTap: () => context.push(AllCompanyRoute.name),
                              child: ResponsiveText(
                                text: 'View All >>',
                                color: AppColors.offWhite,
                                scaleFactor: .03,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 30),
                      if (false)
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              10,
                              (index) => const CompanyWidget(),
                            ),
                          ),
                        )
                            // child: ListView.separated(
                            //   itemBuilder: (context, index) => const CompanyWidget(),
                            //   separatorBuilder: (context, index) => const SizedBox(height: 8),
                            //   itemCount: 5,
                            // ),
                            ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void getCompanies(BuildContext context,
      {bool refresh = false, String searchQuery = ''}) {
    context
        .read<CompaniesBloc>()
        .add(FetchCompaniesEvent(refresh: refresh, searchQuery: searchQuery));
  }

  AppTextField buildSearch(BuildContext context) {
    return AppTextField(
      controller: _searchController,
      hintText: S.of(context).searchServiceHint,
      suffixIcon: Image.asset(ImagesPaths.searchPng),
    );
  }

  Row buildIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: AppConstants.categories.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }

  SizedBox buildCategories() {
    return SizedBox(
      height: 200.w,
      child: CarouselSlider(
        items: AppConstants.categories
            .map((e) => CategoryCard(category: e))
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            height: 200.w,
            aspectRatio: 3.0,
            viewportFraction: 1,
            disableCenter: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }
}
