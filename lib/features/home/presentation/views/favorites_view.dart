import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/edit_favorites_bloc/edit_favorites_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:dawrni/features/home/presentation/widgets/company_card.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    if (CacheStorageServices().isCompany) {
      return Center(
        child: Text("No Favorites for Companies"),
      );
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<FavoritesBloc>()
              ..add(const FetchFavoritesEvent(refresh: true))),
        BlocProvider(create: (context) => sl<EditFavoritesBloc>())
      ],
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
          child: BlocListener<AppConfigBloc, AppConfigState>(
            listenWhen: (prev, curr) => prev.language != curr.language,
            listener: (context, state) {
              getFavorites(context, refresh: true);
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
                  getFavorites(context, refresh: true);
                  context.pop();
                }
              },
              child: BlocBuilder<FavoritesBloc, BaseState<CompaniesEntity>>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingComponent();
                  } else if (state.isError) {
                    return FailureComponent(
                        failure: state.failure,
                        retry: () => getFavorites(context));
                  } else if (state.isSuccess) {
                    return Expanded(
                      child: SmartRefresher(
                        controller:
                            context.read<FavoritesBloc>().refreshController,
                        onRefresh: () => getFavorites(context, refresh: true),
                        onLoading: () => getFavorites(context),
                        enablePullUp: state.enablePullUp,
                        child: ListView(
                          children: [
                            const SizedBox(height: 40),
                            Text(S.of(context).favoritesMessage,
                                style: context.f28800),
                            const SizedBox(height: 20),
                            ...state.data?.companies
                                    .map((e) => CompanyCard(company: e))
                                    .toList() ??
                                [],
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  void getFavorites(BuildContext context, {bool refresh = false}) {
    context.read<FavoritesBloc>().add(FetchFavoritesEvent(refresh: refresh));
  }
}
