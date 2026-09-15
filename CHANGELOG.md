# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0-beta.1] - 2026-09-15

First public beta.

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
- `presentCreateFeedback(isPresented:)` — a `View` modifier that presents a standalone
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


[Unreleased]: https://github.com/getfedo/fedo-ios/compare/0.3.0-beta.1...HEAD
[0.3.0-beta.1]: https://github.com/getfedo/fedo-ios/releases/tag/0.3.0-beta.1
