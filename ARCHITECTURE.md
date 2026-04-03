# ARCHITECTURE.md

## Package name
`madmudmobile` (Flutter package name; app display name is "Tsirbunen Pottery")

## Stack
| Concern | Library |
|---|---|
| State management | `flutter_bloc` |
| Dependency injection | `get_it` (service locator) |
| Routing | `go_router` + `go_router_builder` (type-safe) |
| Backend | Firebase Firestore via `FirestoreCloudService` (`CloudService` interface) |
| Models | `freezed` + `json_serializable` (code-gen) |
| Localization | Custom (see below) |

## Folder structure

```
lib/
  main.dart                        # Entry point: init Firebase, prepareBlocs(), runApp()
  firebase_options.dart            # Auto-generated Firebase config

  app/
    blocs/blocs.dart               # GetIt setup — registers all singleton blocs
    language_bloc/                 # App-wide UI state: runtime language toggle
    scroll_and_route_bloc/         # Scroll positions keyed by route
    router/
      route_enum.dart              # RouteEnum with path() and pageName() extensions
      routes.dart / routes.g.dart  # go_router type-safe route definitions (generated)
      route_controller.dart        # Builds the GoRouter instance
    tsirbunen_pottery_app/         # Root widget: MultiBlocProvider + MaterialApp.router

  common_cloud_service/
    cloud_service.dart             # Abstract interface: fetchOne, fetchMany (returns Map<String, dynamic>)
    common_cloud_service.dart      # FirestoreCloudService — implements CloudService via Firebase

  features/
    {feature}/
      presentation/
        pages/                     # Required: thin route-connected page widgets (one per route)
        {feature}_view/            # Add when presentation has >1 non-trivial sub-component
      domain/                      # Add when feature has local state management
        bloc/                      # BLoC (events, state, bloc, utils)
        models/                    # Freezed domain models
      repository/                  # Add when feature fetches its own data
        {feature}_repository.dart  # Firestore queries + maps documents to domain models

  localization/
    translation.dart               # Translation enum (all string keys)
    en.dart / fi.dart              # Key → string maps per language
    languages.dart                 # Language enum
    app_locale.dart                # Locale helpers
    utils.dart                     # Locale resolution helpers
    translations.dart              # Runtime lookup
    validate_translations.dart     # Asserts all keys have translations

  theme/
    app_theme.dart                 # ThemeData
    colors.dart                    # Color constants
    app_status_bar_color.dart      # Platform status bar color setup

  utils/
    constants.dart                 # App-wide constants (e.g. Firestore doc IDs)
    current_page_name_from_settings.dart

  widgets/                         # Shared, reusable widgets (no business logic)
    action_button/ app_bar/ company/ drawer/ footer/
    horizontal_navigation/ hover_detector/ page_base/
    photo_with_fallback/ progress_indicator/
```

## Feature architectural contract

All features must follow this structure:

- `pages/` is **always required** — even for static features
- `{feature}_view/` is added when there are reusable sub-widgets beyond the page itself
- `domain/bloc/` and `repository/` are added only when the feature has its own state or data layer
- Features that read from global blocs (e.g. `LanguageBloc`) do **not** need their own domain layer

## Routes (current)
| RouteEnum | Path | Notes |
|---|---|---|
| home | / | Hero image from Firestore |
| pieces | /pieces | Individual pottery items |
| categories | /categories | Products by category |
| collections | /collections | Products by collection |
| contact | /contact | Contact info |

Commented-out (not active): `designs`, `story`

## Blocs
| Bloc | Registered in | Responsibility |
|---|---|---|
| `LanguageBloc` | getIt singleton | Runtime language toggle (pure UI state) |
| `HomeBloc` | getIt singleton | Fetch home page image filename from Firestore |
| `ProductsBloc` | getIt singleton | Fetch and hold all product data |
| `ScrollAndRouteBloc` | getIt singleton | Persist scroll positions per route |

All blocs are created in `blocs.dart`, seeded with initial events, and exposed to the widget tree via `MultiBlocProvider` in `TsirbunenPotteryApp`.

## Data flow
```
Firestore → CommonCloudService → Repository → Bloc → Widget
```

## Localization
- All user-visible strings are keyed by `Translation` enum.
- Add a new string: add to enum, then add to `en.dart` and `fi.dart`.
- `validate_translations.dart` catches missing keys at test time.

## Code generation
Run after changing freezed models or go_router routes:
```
dart run build_runner build --delete-conflicting-outputs
```
