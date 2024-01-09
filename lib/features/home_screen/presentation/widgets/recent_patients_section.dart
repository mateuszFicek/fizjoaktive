import 'package:fizjoaktive/core/utils/date_utils.dart';
import 'package:fizjoaktive/theme/app_colors.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecentPatientsSection extends StatelessWidget {
  const RecentPatientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.gapSizes.size16),
      child: LayoutBuilder(builder: (context, constraints) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            title(),
            Gap(Sizes.gapSizes.size16),
            patientsListView(constraints)
          ],
        );
      }),
    );
  }

  Padding title() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.gapSizes.size16),
      child: Text(
        "Ostatni pacjenci",
        style: CustomTextTheme.header1BoldTextStyle,
      ),
    );
  }

  SizedBox patientsListView(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight - 40,
      child: ListView.separated(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return patientItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gap(Sizes.gapSizes.size8);
        },
      ),
    );
  }

  Widget patientItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.gapSizes.size16),
      child: Material(
        shadowColor: AppColors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        color: AppColors.primaryColor,
        child: InkWell(
          onTap: () {},
          splashColor: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: Sizes.gapSizes.size16),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(Sizes.gapSizes.size16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameAndVisitDate(),
                Gap(Sizes.gapSizes.size4),
                clientInformation(),
                Gap(Sizes.gapSizes.size4),
                description()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row nameAndVisitDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "Milan",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextTheme.header1BoldTextStyle.copyWith(
              color: AppColors.offWhite,
            ),
          ),
        ),
        Text(
          DateTime.now().fullDateAndHour,
          style: CustomTextTheme.header3TextStyle.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Text clientInformation() {
    return Text(
      "Opiekun: Agnieszka Majewska",
      style: CustomTextTheme.header2TextStyle.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Text description() {
    return Text(
      "Opis: Wykonano zabieg na plecy oraz szyję.",
      style: CustomTextTheme.header2TextStyle.copyWith(
        color: AppColors.white,
      ),
    );
  }
}
