# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]


## [0.5.0] - 2026-10-25

### Breaking
- `FedoConfig(networkTimeout:logLevel:)` (deprecated in 0.4.0) and `FedoLogLevel.none` removed. Pass a `logHandler` that filters on `entry.level`; omit it to log nothing

### Added
- **Comment replies** — reply to any comment. Threads nest with thread lines; the composer shows "Replying to @name" and ⓧ cancels the reply but keeps the draft. Hidden on boards where replies aren't enabled
- Comments load 20 at a time as you scroll; long threads collapse behind "Show n more replies"
- Deleting a comment that has replies leaves a "Comment deleted" placeholder and keeps the replies
- Toasts for posting, deleting, copying and failures; a failed reply keeps your text
- Stable `fedo.*` accessibility identifiers on comment rows, composer, header and delete confirmation for UI tests (same as Android)

### Fixed
- Keyboard on the feedback detail screen now dismisses when you scroll or tap outside the composer, keeping the draft

## [0.4.0] - 2026-10-17

### Breaking
- Min iOS bumped 16 → 17
- Public globals DEFAULT_NETWORK_TIMEOUT / DEFAULT_LOG_LEVEL removed. FedoConfig defaults unchanged
- FedoLogEntry initializer now internal. Hosts only receive entries

### Added
- **FedoConfig.logHandler** — receive SDK logs as FedoLogEntry instead of OSLog
- **Discard confirmation** — when leaving feedback editor with unsaved title/details 

### Changed
- **FedoConfig.networkTimeout** now total per-request limit (hidden 60 s cap removed)
- Character limits counted in Unicode scalars like backend
- SDK strings rendered verbatim, never looked up in host bundle (always English) 
- Blank setUserEmail("") now accepted so hosts can clear email
- FedoFeedbackView must be on NavigationStack; NavigationView / fullScreenCover unsupported

### Fixed — user-visible
- **Comment timestamps** — "N days ago" up to 7 days (Android parity)
- Failed pull-to-refresh on detail shows error banner, keeps comments
- **Feedback details screen** — Pull-to-refresh no longer cancelled mid-flight
- Loaded comments stay visible when background reload fails
- **Feedbacks screen** — Pull-to-refresh failure with rows visible shows banner, not silent log
- Comments no longer flash spinner on every detail reload
- Stale refresh/comments errors cleared on successful load/post
- Comment count on list rows updates after post/delete
- Failed comment delete shows "Couldn't delete comment"
- Vote failure banner shows on detail screen, not hidden list
- Empty board shows board empty state + "Suggest a feature", not filter-empty
- Feedback posted before first successful load no longer dropped
- Delete only offered for own feedback in in_review/planned. Else "Can't Delete Feedback"
- Swipe-to-dismiss sheet with unsaved text asks to discard. Edit mode dismisses freely when unchanged
- Watermark bar matches white loading/error/thanks states on iOS
- Friendly "feedback isn't available" placeholder in Release when SDK not initialized
- .tint() now drives vote glyph, send button, comment highlight, avatar fallback
- Malformed feedback/comment item skipped + logged instead of failing whole list
- Unknown feedback status decodes as "Unknown", listed under Closed

### Fixed — session / identity
- **Session** — app kill mid-write can't mix users' token+id
- Fresh anonymous session when API key changes
- Logout clears core token + cached feedback; drops previous user's in-flight responses
- Late token refresh after logout/user change no longer restores old user
- setUserID no longer replaced by queued anonymous-user creation
- User data no longer printed in logs

## [0.4.0-beta.3] - 2026-10-11

- fix/vote-main-thread-publish: Deliver feedback and comment updates on the main thread, fixing the "Publishing changes from background threads" warning when voting from the feedback detail screen by @mabd in [#6](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/6)
- fix/buildWarnings: fix build warning - due to macos + xcode updates by @mabd in [#5](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/5)
- watermark-bar-all-screens: Pin the "Powered by Fedo" watermark as a bottom bar on every screen, with the iOS 26 scroll-edge fade by @mabd in [#4](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/4)

## [0.4.0-beta.2] - 2026-10-06

- feedback-filter-toolbar-menu: Move the feedback status filter into a toolbar menu by @mabd in [#3](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/3)
- Disallow Fedo re-initialization
- Rename `FeedbacksView` to `FedoFeedbackView`

## [0.4.0-beta.1] - 2026-09-17

First public beta.

### Added

**Setup**

- `Fedo.initialize(apiKey:config:)` — one call at launch starts the SDK. A blank API key
  is logged and ignored rather than crashing the host app.
- `FedoConfig` with `networkTimeout` (seconds, default 10) and `logLevel` (default
  silent).
- `FedoLogLevel` — severity threshold for SDK logging, routed to the unified logging
  system under the `fedo.sdk` subsystem.

**Feedback UI**

- `FeedbacksView` — the feedback board: list, detail, comments, and composer. Pushes
  onto the enclosing `NavigationStack`.
- `presentFedoCreateFeedback(isPresented:)` — a `View` modifier that presents a standalone
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


[Unreleased]: https://github.com/getfedo/fedo-ios/compare/0.4.0-beta.1...HEAD
[0.4.0-beta.1]: https://github.com/getfedo/fedo-ios/releases/tag/0.4.0-beta.1
