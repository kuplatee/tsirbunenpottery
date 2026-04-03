# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

We are building the app described in @SPEC.md and you should read that file only when specifically asked.
The codebase structure and patterns are documented in @ARCHITECTURE.md — read it before exploring the repo.
Always update @ARCHITECTURE.md when making structural changes (new features, blocs, routes, patterns).

Treat every decision as if this app will scale into a large, complex, production-grade system. Apply proper architecture, clean boundaries, and no shortcuts — even when a simpler approach would work for the current scope.

To save on tokens:
ALWAYS READ ONLY FILES NEEDED!
Always avoid scanning the whole repo unless necessary!

## Engineering expectations

Prefer solutions that reflect strong senior-engineering judgment, not just the fastest local fix.
Optimize for excellent production code and for teaching the user to think like a senior engineer.

Use the `senior-engineering-coach` skill and log that you use it.

## Git Commits

Always use the `git-committer` skill — never commit directly via Bash.
Do not suggest to commit on your own. I will ask you to commit when needed.

## Security

**NEVER** read or write `.env` files. Do not access, display, or modify any `.env*` file contents.

## Commands
- Run tests: `flutter test`
- Run app (web, dev): `flutter run -d chrome`
- Analyze: `flutter analyze`
- Code generation (freezed, go_router): `dart run build_runner build --delete-conflicting-outputs`
- Deploy: automatic via GitHub push to `main` → Netlify

## Communication Style

Keep answers extremely concise. Focus on key information only — no unnecessary fluff.


