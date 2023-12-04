import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/companies_bloc/companies_bloc.dart';
import 'package:dawrni/features/home/presentation/widgets/company_card.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchCompaniesView extends StatefulWidget {
  final CategoryEntity? category;
  const SearchCompaniesView({Key? key, this.category}) : super(key: key);

  @override
  State<SearchCompaniesView> createState() => _SearchCompaniesViewState();
}

class _SearchCompaniesViewState extends State<SearchCompaniesView> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    getCompanies(context, refresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category == null ? S.of(context).allCompanies : widget.category!.name)),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),
            buildSearch(context),
            Expanded(
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
                          const SizedBox(height: 20),
                          ...state.data?.companies
                              .map((e) => CompanyCard(company: e))
                              .toList() ??
                              [],
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getCompanies(BuildContext context,
      {bool refresh = false}) {
    context
        .read<CompaniesBloc>()
        .add(FetchCompaniesEvent(refresh: refresh, searchQuery: _searchController.text, category: widget.category?.id.toString() ?? ''));
  }

  AppTextField buildSearch(BuildContext context) {
    return AppTextField(
      controller: _searchController,
      hintText: S.of(context).searchServiceHint,
      suffixIcon: Image.asset(ImagesPaths.searchPng),
      onChanged: (query) => getCompanies(context),
    );
  }
}
