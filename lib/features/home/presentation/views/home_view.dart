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
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/companies_bloc/companies_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/edit_favorites_bloc/edit_favorites_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/all_company_route.dart';
import 'package:dawrni/features/home/presentation/routes/search_companies_route.dart';
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
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<CompaniesBloc>()..add(const FetchCompaniesEvent())),
        BlocProvider(
            create: (_) => sl<EditFavoritesBloc>()),
      ],
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
            child: BlocListener<AppConfigBloc, AppConfigState>(
              listenWhen: (prev, curr) => prev.language != curr.language,
              listener: (context, state) {
                getCompanies(context, refresh: true);
              },
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
                        controller: context.read<CompaniesBloc>().refreshController,
                        onRefresh: () => getCompanies(context, refresh: true),
                        onLoading: () => getCompanies(context),
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
        },
      ),
    );
  }

  void getCompanies(BuildContext context,
      {bool refresh = false}) {
    context
        .read<CompaniesBloc>()
        .add(FetchCompaniesEvent(refresh: refresh, searchQuery: ''));
  }

  Widget buildSearch(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(SearchCompaniesRoute.name);
      },
      child: AppTextField(
        hintText: S.of(context).searchServiceHint,
        suffixIcon: Image.asset(ImagesPaths.searchPng),
        enabled: false,
      ),
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
