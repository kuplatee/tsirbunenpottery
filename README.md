# TSIRBUNEN POTTERY WEBPAGES

The **[TSIRBUNEN POTTERY webpages](https://tsirbunen-pottery.netlify.app)** are hosted by the **[Netlify platform](https://www.netlify.com)**.

[![Netlify Status](https://api.netlify.com/api/v1/badges/cec72aa2-df39-4f31-b430-60965f13946f/deploy-status?branch=main)](https://app.netlify.com/sites/tsirbunen-pottery/deploys)

### Code generation

To build the generated parts of immutable Freezed model classes, the go router routes, and test mocks, use the build_runner command (where "--delete-conflicting-outputs" prevents the prompt asking what to do with conflicting pre-existing files):

`dart run build_runner build --delete-conflicting-outputs`

(You might need to run `flutter pub global activate build_runner` prior to the file generation.)

### Run app locally
`export PATH="$PATH:/Users/fisukala/develop/flutter/bin" && flutter run -d chrome`

### Running tests

#### Unit and widget tests

To run unit and widget tests

`flutter test -r expanded`
or
`flutter test -r compact`
or
`flutter test -r expanded | sed 's#.*test/##'`
or `flutter test -r expanded | sed 's#.*/##'`
or `FORCE_COLOR=1 flutter test --color -r expanded | perl -pe 's{.+(_test\.dart: )(.+)}{\e[38;5;75m$2\e[0m}'`

where the "-r expanded" results in a more verbose output and "-r compact" in a minimal output. 

#### Integration tests

Before starting integration tests, start ChromeDriver with
`chromedriver --port=4444`
Note: you might need to install ChromeDriver into the directory of your choice
`npx @puppeteer/browsers install chromedriver@stable`
and add the path to ChromeDriver to your $PATH environment variable.

To run all integration tests
`flutter drive --driver=test_driver/integration_test.dart --target=integration_test/test.dart -d chrome`

To run a specific integration test file (for example language_change_test.dart)
`flutter drive --driver=test_driver/integration_test.dart --target=integration_test/language/language_change_test.dart -d chrome`

### Packages and technologies

- **IMMUTABLE MODELS:** For the immutable domain entity models the **[freezed](https://pub.dev/packages/freezed)** package was chosen. Freezed classes are annotated with **[freezed_annotation](https://pub.dev/packages/freezed_annotation)** and generated files built with the **[build_runner](https://pub.dev/packages/build_runner)** to produce \*.freezed.dart-files in the same folder as the original annotated class file. When a fromJson factory constructor is defined in a class with the @freezed-annotation, then code for (de)serialization of the freezed model class is generated (\*.g.dart). For this, also the **[json_serializable](https://pub.dev/packages/json_serializable)** with **[json_annotation](https://pub.dev/packages/json_annotation)** is needed.
- **ROUTING:** **[go_router](https://pub.dev/packages/go_router)** with **[type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)** and **[go_router_builder file generation](https://pub.dev/packages/go_router_builder)**
- **STATE MANAGEMENT:** The Bloc based approach with the **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** package was selected.
- **OBJECT COMPARISON:** To help in comparing bloc state changes the **[equatable](https://pub.dev/packages/equatable/example)** package was selected.
- **DEPENDENCY INJECTION:** **[get_it](https://pub.dev/packages/get_it)**
- **TEST MOCKING:** For test mocking, the **[mockito](https://pub.dev/packages/mockito)** package was selected.
- **BLOC TESTING:** To help in testing bloc functionality, the **[bloc_test](https://pub.dev/packages/bloc_test)** package was used.
- **ICONS:** **[Material Symbols Icons for Flutter](https://pub.dev/packages/material_symbols_icons)** were selected for icons because their weight can be easily modified (to be lighter than the usual Material icons)

### Conventions

- **File imports and exports**: To keep import statements clean and maintainable, we use barrel files (files named **barrel.dart** that re-export other files in a folder) throughout the project.

### Deployment

Build the app with

`flutter build web`
or
`flutter build web --release --web-renderer html` (not working aymore?)
`flutter build web --release`

No need to drag the directory **/build/web/** to Netlify anymore as Netlify deployment happens automatically on pushing to GitHub main. You can run the web build locally with
`flutter run -d chrome`
