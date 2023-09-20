import 'package:flutter/material.dart';

import 'leading_date.dart';
import 'page_sliders.dart';

/// The header that will be shown above the calendar grid.
///
///
/// See also:
///
///  * [LeadingDate], which shows indication about what year/month are opened.
///
/// * [PageSliders], which controlls the next & previous page.
///
class Header extends StatelessWidget {
  final String displayedDate;
  final VoidCallback onDateTap;
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;
  final Color slidersColor;
  final double slidersSize;
  final TextStyle leadingDateTextStyle;

  /// The header that will be shown above the calendar grid.
  const Header({
    super.key,
    required this.displayedDate,
    required this.onDateTap,
    required this.onNextPage,
    required this.onPreviousPage,
    required this.slidersColor,
    required this.slidersSize,
    required this.leadingDateTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PageSliders(
      onBackward: onPreviousPage,
      onForward: onNextPage,
      slidersSized: slidersSize,
      slidersColor: slidersColor,
      displayedDate: displayedDate,
      leadingDateTextStyle: leadingDateTextStyle,
      onDateTap: onDateTap,
    );
  }
}
