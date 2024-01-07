import 'package:fizjoaktive/features/home_screen/domain/enums/drawer_item.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../theme/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkBlue,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.gapSizes.size64,
          horizontal: Sizes.gapSizes.size16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(Sizes.gapSizes.size16),
            _titleSection(),
            Divider(color: AppColors.offWhite),
            Gap(Sizes.gapSizes.size16),
            ...DrawerItem.drawerItems.map((e) => _drawerButton(e)).toList(),
            const Spacer(),
            _drawerButton(DrawerItem.logout),
          ],
        ),
      ),
    );
  }

  Widget _titleSection() {
    return Text(
      "FizjoAktive",
      style: CustomTextTheme.titleTextStyle.copyWith(
        color: AppColors.offWhite,
      ),
    );
  }

  Widget _drawerButton(DrawerItem drawerItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              drawerItem.icon,
              color: AppColors.offWhite,
            ),
            Gap(Sizes.gapSizes.size16),
            Text(
              drawerItem.name,
              style: CustomTextTheme.buttonTextStyle.copyWith(
                color: AppColors.offWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
