import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/client_profile_bloc/client_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/company_profile_bloc/company_profile_bloc.dart';
import 'package:dawrni/features/settings/presentation/routes/about_us_route.dart';
import 'package:dawrni/features/settings/presentation/routes/contact_us_route.dart';
import 'package:dawrni/features/settings/presentation/routes/privacy_policy_route.dart';
import 'package:dawrni/features/settings/presentation/routes/setting_route.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///TODO: change navigations here
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            buildProfileInfo(),
            const CustomSizedBox(value: .1),
            customListTile(
                S.of(context).home,
                Icon(
                  Icons.home,
                  color: AppColors.offWhite,
                  size: 30,
                ),
                () => context.go(MainRoute.name)),
            customListTile(
                S.of(context).aboutUs,
                Image.asset(
                  'assets/clarity_info-standard-line.png',
                  fit: BoxFit.fill,
                ),
                () => context.push(AboutUsRoute.name)),
            customListTile(
                S.of(context).privacyPolicy,
                Image.asset(
                  'assets/Group 34140.png',
                  fit: BoxFit.fill,
                ),
               () => context.push(PrivacyPolicyRoute.name)),
            customListTile(
                S.of(context).contactUs,
                Image.asset(
                  'assets/iconoir_headset-help.png',
                  fit: BoxFit.fill,
                ),
             () => context.push(ContactUsRoute.name)),
            customListTile(
                S.of(context).settings,
                Icon(
                  Icons.settings,
                  color: AppColors.offWhite,
                  size: 30,
                ),
               () => context.push(SettingsRoute.name)),
            const Spacer(flex: 1),
            customListTile(
                S.of(context).logout,
                Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColors.offWhite,
                ),
                () {
                  context.read<AppConfigBloc>().add(const LogOutEvent());
                  context.go(LoginRoute.name);
                }),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfo() {
    if(CacheStorageServices().isCompany) {
      return BlocBuilder<CompanyProfileBloc, BaseState<CompanyProfileEntity>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingComponent();
            } else if (state.isError) {
              return FailureComponent(
                  failure: state.failure,
                  refresh: true,
                  retry: () {
                    context
                        .read<CompanyProfileBloc>()
                        .add(const FetchCompanyProfileEvent());
                  });
            }
            if (state.isSuccess) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(state.data?.imageUrl?.isNotEmpty ?? false)
                      SizedBox(
                          width: 90,
                          height: 90,
                          child: AppNetworkImage(url: state.data!.imageUrl!, borderRadius: BorderRadius.circular(50))),
                    const SizedBox(height: 15),
                    Text("${S.of(context).hey} 👋 ", style: context.f20400),
                    Text(state.data?.nameEn ?? '', style: context.f20700),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          });
    } else {
      return BlocBuilder<ClientProfileBloc, BaseState<ClientProfileEntity>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingComponent();
            } else if (state.isError) {
              return FailureComponent(
                  failure: state.failure,
                  refresh: true,
                  retry: () {
                    context
                        .read<ClientProfileBloc>()
                        .add(const FetchClientProfileEvent());
                  });
            }
            if (state.isSuccess) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(state.data?.imageUrl?.isNotEmpty ?? false)
                      SizedBox(
                          width: 90,
                          height: 90,
                          child: AppNetworkImage(url: state.data!.imageUrl!, borderRadius: BorderRadius.circular(50))),
                    const SizedBox(height: 15),
                    Text("${S.of(context).hey} 👋 ", style: context.f20400),
                    Text(state.data?.nameEn ?? '', style: context.f20700),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          });
    }
  }

  ListTile customListTile(String title, Widget icon, Function function) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: icon,
      title: Text(title),
    );
  }
}
