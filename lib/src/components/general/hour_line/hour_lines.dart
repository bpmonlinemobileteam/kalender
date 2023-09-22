import 'package:flutter/material.dart';
import 'package:kalender/src/constants.dart';
import 'package:kalender/src/providers/calendar_style.dart';

/// A widget that displays the hour lines.
class HourLines extends StatelessWidget {
  const HourLines({
    super.key,
    required this.hourHeight,
  });

  /// The spacing between the hour lines.
  final double hourHeight;

  @override
  Widget build(BuildContext context) {
    final hourLineStyle = CalendarStyleProvider.of(context).style.hourLineStyle;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: hourHeight / 2),
      child: Column(
        children: <Widget>[
          for (int i = 1; i < hoursADay; i++)
            SizedBox(
              height: hourHeight,
              child: Center(
                child: Container(
                  height: hourLineStyle?.thickness ?? 1,
                  color: hourLineStyle?.color ??
                      Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
