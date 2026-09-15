# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- fedo-sdk-ios-tns.5
  - Cut the `0.1.0` section from the initial feature set; `fedoSDKVersion` already `0.1.0`.
- fedo-sdk-ios-tns.3
  - Public `LICENSE` in `getfedo/fedo-ios` reviewed and approved.
- fedo-sdk-ios-tns.4
  - Pushed the binary-only package skeleton (`Package.swift`, README, LICENSE, CHANGELOG) to public `github.com/getfedo/fedo-ios`.
- fedo-sdk-ios-tns.2
  - `scripts/release.sh`: code signing is now optional; `FEDO_SIGN_IDENTITY` unset ships an unsigned XCFramework (no Apple Developer account yet).
  - `scripts/release.sh`: release tag is pushed to every git remote, not only `origin`.
  - Release docs in `CLAUDE.md` / `AGENTS.md` updated to match.

## [0.1.0] - 2026-09-14

Initial release.

### Added

**Setup**

- `Fedo.initialize(apiKey:config:)` — one call at launch starts the SDK. A blank API key
  is logged and ignored rather than crashing the host app.
- `FedoConfig` with `networkTimeout` (seconds, default 30) and `logLevel` (default
  silent). Defaults live in `DEFAULT_NETWORK_TIMEOUT` and `DEFAULT_LOG_LEVEL`.
- `FedoLogLevel` — severity threshold for SDK logging, routed to the unified logging
  system under the `fedo.sdk` subsystem.

**Feedback UI**

- `FeedbacksView` — the feedback board: list, detail, comments, and composer. Pushes
  onto the enclosing `NavigationStack`.
- `presentFeedbacks(isPresented:)` — a `View` modifier that presents a standalone
  feedback composer as a sheet, for lightweight "Suggest a feature" entry points.
- Feedback list with status filters, sorting by status then votes then recency, and
  swipe-to-refresh.
- Create, edit, and delete your own feedback; vote on anyone's.
- Comments on a feedback item: create, edit, and delete, with inline animations.
- Character limits with live counters — 200 for titles, 5,000 for details, 2,000 for
  comments.
- Empty, loading, and error states throughout, each with retry where a retry makes sense.
- A placeholder screen when the SDK is presented before `initialize` was called (DEBUG
  builds only).

**User identity**

- `setUserID(_:)` — identifies the current user. Optional: until it's called, an
  anonymous user is created automatically, and identifying later merges that anonymous
  user's feedback, votes, and comments into the identified one.
- `setUserDisplayName(_:)`, `setUserEmail(_:)`, and `setUserProperty(_:value:)` for
  profile metadata.
- `logout()` — clears the session and starts a fresh anonymous user.
- Device metadata (platform, model, OS version, locale, time zone, app version, SDK
  version) is attached to the user profile to give feedback context on the dashboard.

**Session handling**

- Session tokens are stored in the Keychain, scoped to the device, and cleared on a
  fresh install so a reinstall doesn't inherit the previous install's session.
- Expired tokens are refreshed automatically on a `401` and the original request is
  retried once. Concurrent refreshes are collapsed into a single in-flight call.

**Distribution**

- `PrivacyInfo.xcprivacy` declaring collected data types and the `UserDefaults`
  required-reason API. The SDK does no tracking and touches no advertising identifiers.
- DocC documentation on the full public API.
- Swift 6 language mode, iOS 16+.

### Changed

- fedo-sdk-ios-tns.9
  - Documented the release process (version bump, changelog, `scripts/release.sh`, env vars) in `CLAUDE.md` and `AGENTS.md`.
  - Noted why the module is `FedoKit` and the library product is dynamic.

[Unreleased]: https://github.com/getfedo/fedo-ios/compare/0.1.0...HEAD
[0.1.0]: https://github.com/getfedo/fedo-ios/releases/tag/0.1.0
