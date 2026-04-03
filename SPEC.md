# SPEC.md — Tsirbunen Pottery App

## Purpose
A public-facing web app where the owner showcases pottery items for people to browse on the internet. Future: purchasing pottery items directly through the app.

## Deployment
- Hosted on **Netlify**, auto-deployed from the `main` branch on GitHub.
- Flutter web app.

## Users
- **Visitors**: Browse pottery items (no login required).
- **Owner** (future): Manage product listings via Firestore directly.
- **Buyers** (future): Purchase pottery items through the app.

## Current Features

### Browse pottery
Visitors can navigate to:
- **Home** — landing page with a hero image fetched from Firestore.
- **Pieces** — list/grid of individual pottery pieces.
- **Categories** — pottery grouped by category.
- **Collections** — pottery grouped by collection.
- **Contact** — how to reach the owner.

### Localization
- Supports **Finnish (fi)** and **English (en)**.
- Language is toggled at runtime via `GeneralStateBloc`.

## Planned Features (future)
- **Purchase flow**: Visitors can buy pottery items. Exact payment provider TBD.
- Additional routes (Designs, Story) are stubbed out but commented off.

## Data Source
All dynamic content (products, home page image) is stored in **Firebase Firestore** and fetched at app startup. No user-generated data at this time.
