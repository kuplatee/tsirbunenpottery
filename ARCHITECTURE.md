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

  bootstrap/
    app/app.dart                   # Root widget: MultiBlocProvider + MaterialApp.router
    router/
      route_enum.dart              # RouteEnum with path() and pageName() extensions
      routes.dart / routes.g.dart  # go_router type-safe route definitions (generated)
      route_controller.dart        # Builds the GoRouter instance
    service_locator/
      service_locator.dart         # GetIt setup — registers all singletons (blocs + caches)

  core/
    scroll_position_cache/
      scroll_position_cache.dart   # Plain class: key→offset cache for scroll restoration (no BLoC)
    state/
      language/                    # App-wide UI state: runtime language toggle
      navigation/                  # Back-navigation history stack (drives AppBar back arrow)

  data/
    cloud_service.dart             # Abstract interface: fetchOne, fetchMany (returns Map<String, dynamic>)
    firestore_cloud_service.dart   # FirestoreCloudService — implements CloudService via Firebase
    products_repository.dart       # Shared cache: fetches all Firestore collections once, holds AllProductsData record

  features/
    {feature}/
      presentation/
        pages/                     # Required: thin route-connected page widgets (one per route)
        {feature}_view/            # Add when presentation has >1 non-trivial sub-component
      domain/                      # Add when feature has local state management
        bloc/                      # BLoC (events, state, bloc)
        models/                    # Freezed domain models
      repository/                  # Add when feature fetches its own data
        {feature}_repository.dart  # Extracts and shapes feature data from ProductsRepository or CloudService

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
    items_grid/                    # ItemsGrid, PieceCard, ViewMode, GridParams, ScrollPositionMixin
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

## Singletons (registered in service_locator.dart)
| Type | Kind | Responsibility |
|---|---|---|
| `LanguageBloc` | BLoC | Runtime language toggle (pure UI state) |
| `NavigationBloc` | BLoC | Back-navigation history stack — drives AppBar back arrow |
| `HomeBloc` | BLoC | Fetch home page image filename from Firestore |
| `PiecesBloc` | BLoC | Hold shaped pieces + designs data for the Pieces route |
| `DesignsBloc` | BLoC | Hold shaped designs data (future Designs route) |
| `CategoriesBloc` | BLoC | Hold shaped categories + designs data for the Categories route |
| `CollectionsBloc` | BLoC | Hold shaped collections + designs data for the Collections route |
| `ScrollPositionCache` | plain class | Key→offset map for scroll restoration; never drives rebuilds |

BLoCs are seeded with initial events in `service_locator.dart` and exposed to the widget tree via `MultiBlocProvider` in `App`.

## Data flow
```
Firestore → CloudService → ProductsRepository (shared cache) → FeatureRepository → FeatureBloc → Widget
```

`ProductsRepository` fetches all Firestore collections once and caches the result as an `AllProductsData` record. Feature repositories receive it, extract and shape their slice of the data, and return it to their bloc.

`HomeRepository` fetches independently from `CloudService` (home page data is unrelated to product data).

## Localization
- All user-visible strings are keyed by `Translation` enum.
- Add a new string: add to enum, then add to `en.dart` and `fi.dart`.
- `validate_translations.dart` catches missing keys at test time.

## Code generation
Run after changing freezed models or go_router routes:
```
dart run build_runner build --delete-conflicting-outputs
```
