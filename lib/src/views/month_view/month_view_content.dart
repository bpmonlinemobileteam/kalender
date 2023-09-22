import 'package:flutter/material.dart';
import 'package:kalender/src/models/calendar/calendar_controller.dart';
import 'package:kalender/src/models/view_configurations/view_configuration_export.dart';
import 'package:kalender/src/providers/calendar_scope.dart';
import 'package:kalender/src/views/month_view/month_view_page_content.dart';

class MonthViewContent<T> extends StatelessWidget {
  const MonthViewContent({
    super.key,
    required this.viewConfiguration,
    required this.controller,
  });

  final MonthViewConfiguration viewConfiguration;
  final CalendarController<T> controller;

  @override
  Widget build(BuildContext context) {
    final scope = CalendarScope.of<T>(context);

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final horizontalStep = constraints.maxWidth / 7;
          final verticalStep = constraints.maxHeight / 5;

          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: PageView.builder(
              key: Key(viewConfiguration.hashCode.toString()),
              controller: scope.state.pageController,
              itemCount: scope.state.numberOfPages,
              onPageChanged: (index) {
                final newVisibleDateTimeRange =
                    viewConfiguration.calculateVisibleDateRangeForIndex(
                  index: index,
                  calendarStart: scope.state.adjustedDateTimeRange.start,
                );

                // Update the visible date range.
                scope.state.visibleDateTimeRange = newVisibleDateTimeRange;

                // Update the selected date.
                controller.selectedDate = newVisibleDateTimeRange.start;

                // Call the onPageChanged function.
                scope.functions.onPageChanged?.call(
                  newVisibleDateTimeRange,
                );
              },
              itemBuilder: (context, index) {
                final visibleDateRange =
                    viewConfiguration.calculateVisibleDateRangeForIndex(
                  index: index,
                  calendarStart: scope.state.adjustedDateTimeRange.start,
                );

                return MonthViewPageContent<T>(
                  viewConfiguration: viewConfiguration,
                  visibleDateRange: visibleDateRange,
                  horizontalStep: horizontalStep,
                  verticalStep: verticalStep,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
