

import 'dart:developer';

import 'package:nepali_date_picker/nepali_date_picker.dart';

class DateConverter {
  static nepaliToEnglish(
      {required int year, required int month, required int day}) {
    DateTime englishDate = NepaliDateTime(year, month, day).toDateTime();
    log('In AD = $englishDate');
    return englishDate;
  }

  static englishToNepali(
      {required int year, required int month, required int day}) {
    NepaliDateTime nepaliDate = DateTime(year, month, day).toNepaliDateTime();
    log('In BS = $nepaliDate');
    return nepaliDate;
  }
}
