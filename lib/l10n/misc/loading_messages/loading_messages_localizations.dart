import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'loading_messages_localizations_en.dart';
import 'loading_messages_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of LoadingMessagesLocalizations
/// returned by `LoadingMessagesLocalizations.of(context)`.
///
/// Applications need to include `LoadingMessagesLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'loading_messages/loading_messages_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LoadingMessagesLocalizations.localizationsDelegates,
///   supportedLocales: LoadingMessagesLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the LoadingMessagesLocalizations.supportedLocales
/// property.
abstract class LoadingMessagesLocalizations {
  LoadingMessagesLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LoadingMessagesLocalizations? of(BuildContext context) {
    return Localizations.of<LoadingMessagesLocalizations>(context, LoadingMessagesLocalizations);
  }

  static const LocalizationsDelegate<LoadingMessagesLocalizations> delegate = _LoadingMessagesLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @loading_message_1.
  ///
  /// In en, this message translates to:
  /// **'Cueing up the intro music...'**
  String get loading_message_1;

  /// No description provided for @loading_message_2.
  ///
  /// In en, this message translates to:
  /// **'Editing out the awkward pauses...'**
  String get loading_message_2;

  /// No description provided for @loading_message_3.
  ///
  /// In en, this message translates to:
  /// **'Loading the guest\'s hot takes...'**
  String get loading_message_3;

  /// No description provided for @loading_message_4.
  ///
  /// In en, this message translates to:
  /// **'Buffering the juicy anecdotes...'**
  String get loading_message_4;

  /// No description provided for @loading_message_5.
  ///
  /// In en, this message translates to:
  /// **'Syncing the perfect sound effects...'**
  String get loading_message_5;

  /// No description provided for @loading_message_6.
  ///
  /// In en, this message translates to:
  /// **'Prepping the host\'s coffee...'**
  String get loading_message_6;

  /// No description provided for @loading_message_7.
  ///
  /// In en, this message translates to:
  /// **'Finding the lost episode archives...'**
  String get loading_message_7;

  /// No description provided for @loading_message_8.
  ///
  /// In en, this message translates to:
  /// **'Compressing the audio for crispness...'**
  String get loading_message_8;

  /// No description provided for @loading_message_9.
  ///
  /// In en, this message translates to:
  /// **'Writing the show notes...'**
  String get loading_message_9;

  /// No description provided for @loading_message_10.
  ///
  /// In en, this message translates to:
  /// **'Setting up the virtual studio...'**
  String get loading_message_10;

  /// No description provided for @loading_message_11.
  ///
  /// In en, this message translates to:
  /// **'Dialing in the guest\'s connection...'**
  String get loading_message_11;

  /// No description provided for @loading_message_12.
  ///
  /// In en, this message translates to:
  /// **'Trimming the long tangents...'**
  String get loading_message_12;

  /// No description provided for @loading_message_13.
  ///
  /// In en, this message translates to:
  /// **'Adding the sponsor messages...'**
  String get loading_message_13;

  /// No description provided for @loading_message_14.
  ///
  /// In en, this message translates to:
  /// **'Testing the mic levels...'**
  String get loading_message_14;

  /// No description provided for @loading_message_15.
  ///
  /// In en, this message translates to:
  /// **'Queueing up the listener questions...'**
  String get loading_message_15;

  /// No description provided for @loading_message_16.
  ///
  /// In en, this message translates to:
  /// **'Polishing the episode title...'**
  String get loading_message_16;

  /// No description provided for @loading_message_17.
  ///
  /// In en, this message translates to:
  /// **'Loading the dramatic cliffhangers...'**
  String get loading_message_17;

  /// No description provided for @loading_message_18.
  ///
  /// In en, this message translates to:
  /// **'Syncing the cross-promo ads...'**
  String get loading_message_18;

  /// No description provided for @loading_message_19.
  ///
  /// In en, this message translates to:
  /// **'Prepping the host\'s witty banter...'**
  String get loading_message_19;

  /// No description provided for @loading_message_20.
  ///
  /// In en, this message translates to:
  /// **'Rolling the outro music...'**
  String get loading_message_20;
}

class _LoadingMessagesLocalizationsDelegate extends LocalizationsDelegate<LoadingMessagesLocalizations> {
  const _LoadingMessagesLocalizationsDelegate();

  @override
  Future<LoadingMessagesLocalizations> load(Locale locale) {
    return SynchronousFuture<LoadingMessagesLocalizations>(lookupLoadingMessagesLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_LoadingMessagesLocalizationsDelegate old) => false;
}

LoadingMessagesLocalizations lookupLoadingMessagesLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LoadingMessagesLocalizationsEn();
    case 'es': return LoadingMessagesLocalizationsEs();
  }

  throw FlutterError(
    'LoadingMessagesLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
