# DiceMaster

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

A dice game.

---

## Getting Started 🚀

## Assets 🎨

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware images][resolution_aware_assets_link].

### Generating assets 🖼

We use [flutter_gen][flutter_gen_link] to generate asset classes like `Assets` and `FontFamily`. This helps us avoid commiting typos when writing an asset file name and to access additional properities like height of images.

The configuration for this tool is already on your pubspec. Also the `flutter_gen_runner` is packed, so your asset classes are generated when you run:

```sh
dart run build_runner build --delete-conflicting-outputs
```

Then, to reference the asset you can call:

```dart
Assets.images.noScopeLogo.image(height: 42),
```

_\*Note: Remember to add your asset directories to your pubspec too._

## Localization 🌎

This project relies on GetX localizations.


### Adding Translations 🔄

To support additional languages, please visit the tutorial on [Internationalizing Flutter apps][internationalizing_flutter_apps_link].

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── lib
│   ├── translations
│   │   ├── pre_translations.dart
│   │   └── translations.dart
```

2. Add the translated strings to each `Translations` file:


```dart
{
    'en_US': {
        'invalid_user': 'Invalid User',
        'description': "Hello message"
    }
}
```


[flutter_docs_link]: https://flutter.dev/docs
[flutter_gen_link]: https://pub.dev/packages/flutter_gen
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[internationalizing_flutter_apps_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[mason_link]: https://github.com/felangel/mason
[resolution_aware_assets_link]: https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_core_link]: https://github.com/VeryGoodOpenSource/very_good_cli/blob/main/doc/very_good_core.md
[very_good_ventures_link]: https://github.com/vGVentures/
