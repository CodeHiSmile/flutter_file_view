import 'package:flutter/material.dart';

/// @Describe: Localizations
///
/// @Author: LiWeNHuI
/// @Date: 2022/2/15

abstract class ViewerLocalizationsBase {
  const ViewerLocalizationsBase(this.locale);

  final Locale? locale;

  Object? getItem(String key);

  String get fileSize => getItem('fileSize').toString();

  String get fileSizeFail => getItem('fileSizeFail').toString();

  String get fileSizeError => getItem('fileSizeError').toString();

  String get unsupportedPlatformTip =>
      getItem('unsupportedPlatformTip').toString();

  String get nonExistentTip => getItem('nonExistentTip').toString();

  String get unsupportedType => getItem('unsupportedType').toString();

  String get engineFail => getItem('engineFail').toString();

  String get downloadTitle => getItem('downloadTitle').toString();

  String get viewTitle => getItem('viewTitle').toString();
}

/// localizations
class ViewerLocalizations extends ViewerLocalizationsBase {
  const ViewerLocalizations(Locale? locale) : super(locale);

  static const ViewerLocalizations _static = ViewerLocalizations(null);

  @override
  Object? getItem(String key) {
    Map<String, Object>? localData;
    if (locale != null) {
      localData = localizedValues[locale!.languageCode];
    }
    if (localData == null) {
      return localizedValues['zh']![key];
    }
    return localData[key];
  }

  static ViewerLocalizations of(BuildContext context) {
    return Localizations.of<ViewerLocalizations>(
            context, ViewerLocalizations) ??
        _static;
  }

  /// Language Support
  static const List<String> languages = <String>['en', 'zh'];

  /// Language Values
  static const Map<String, Map<String, Object>> localizedValues =
      <String, Map<String, Object>>{
    'en': <String, String>{
      'fileSize': 'File size: ',
      'fileSizeFail': 'File size acquisition failed',
      'fileSizeError': 'File size acquisition exception',
      'unsupportedPlatformTip': 'Currently only supports Android, iOS',
      'nonExistentTip': 'Non-existent file',
      'unsupportedType': 'Does not support opening files of type %s',
      'engineFail': 'The engine failed to load, please restart the app',
      'downloadTitle': 'Download',
      'viewTitle': 'View'
    },
    'zh': <String, String>{
      'fileSize': '???????????????',
      'fileSizeFail': '????????????????????????',
      'fileSizeError': '????????????????????????',
      'unsupportedPlatformTip': '???????????????Android???iOS',
      'nonExistentTip': '???????????????',
      'unsupportedType': '???????????????%s???????????????',
      'engineFail': '??????????????????????????????App',
      'downloadTitle': '????????????',
      'viewTitle': '????????????'
    },
  };
}
