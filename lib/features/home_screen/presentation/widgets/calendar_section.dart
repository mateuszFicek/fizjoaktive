import 'package:fizjoaktive/core/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/size_utils.dart';
import '../../../../theme/text_theme.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.offWhite),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 2 - 36,
      padding: EdgeInsets.all(Sizes.gapSizes.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kalendarz",
            style: CustomTextTheme.subtitleTextStyle.copyWith(
              color: AppColors.greyFont,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateTime.now().monthAndYear,
                style: CustomTextTheme.titleTextStyle.copyWith(
                  color: AppColors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          Gap(Sizes.gapSizes.size16),
          const Divider(),
          Gap(Sizes.gapSizes.size8),
          Flexible(child: _calendarDates()),
          _calendarEvents(),
          Gap(Sizes.gapSizes.size16),
        ],
      ),
    );
  }

  Widget _calendarDates() {
    DateTime monday = DateTime.now().getLastMonday;
    return ListView.builder(
      itemCount: 7,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final date = monday.add(Duration(days: index));
        final itemWidth =
            (MediaQuery.of(context).size.width - Sizes.gapSizes.size16 * 2) / 7;
        final selected = 2 == index;
        return SizedBox(
          width: itemWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(date.dayName),
              Gap(Sizes.gapSizes.size8),
              Container(
                width: itemWidth - 8,
                height: itemWidth - 8,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selected ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _calendarEvents() {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Material(
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: Container(
                width: 240,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(Sizes.gapSizes.size8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameAndDate(),
                    Gap(Sizes.gapSizes.size4),
                    clientsInformation(),
                    Gap(Sizes.gapSizes.size4),
                    description()
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gap(Sizes.gapSizes.size16);
        },
      ),
    );
  }

  Row nameAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "Milan",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextTheme.header1BoldTextStyle,
          ),
        ),
        Text(DateTime.now().fullDateAndHour,
            style: CustomTextTheme.header3TextStyle),
      ],
    );
  }

  Text clientsInformation() {
    return Text("Opiekun: Agnieszka Majewska",
        style: CustomTextTheme.header2TextStyle);
  }

  Text description() {
    return Text("Opis: Wykonano zabieg na plecy oraz szyję.",
        style: CustomTextTheme.header2TextStyle);
  }
}
