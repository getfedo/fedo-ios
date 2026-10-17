# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]


## [0.4.0] - 2026-10-17

- bd/fedo-sdk-ios-44c.70-relative-time-android-buckets: Comment timestamps now read "N days ago" until 7 days old like Android, instead of rounding to "last week" or "yesterday" by @mabd-agent
- fix/fedo-sdk-ios-44c.35-session-atomic-token: Store the session as one Keychain item so an app kill mid-write can't pair one user's token with another's id (older installs migrate on first launch), and make the token-refresh wiring thread-safe by @mabd-agent
- bd/fedo-sdk-ios-44c.67-feedback-detail-failed-pull-to-refresh-h: A failed pull-to-refresh on feedback detail now shows an error banner and keeps the loaded comments; the full-screen error only appears when there are no comments by @mabd-agent
- bd/fedo-sdk-ios-44c.68-feedback-detail-pull-to-refresh-doesn-t: Fix pull-to-refresh on feedback detail being cancelled mid-flight by its own state change, and fetch comments even when the feedback fetch fails by @mabd-agent
- bd/fedo-sdk-ios-fa2-keep-loaded-comments-visible-when-a-back: Keep already-loaded comments on screen when a background comment reload fails, instead of replacing them with an error view by @mabd-agent
- bd/fedo-sdk-ios-3od-ios-remove-the-dead-nodata-loadstate: Remove the unused `.noData` load state from the feedback list by @mabd-agent
- bd/fedo-sdk-ios-44c.26-navigation-needs-the-host-s-navigationstack: Document that `FedoFeedbackView` must be pushed onto a `NavigationStack`; `NavigationView` (its "+" and Edit actions do nothing) and `fullScreenCover` (no close button) are not supported by @mabd-agent
- bd/fedo-sdk-ios-2a4-session-tests-replace-fixed-sleeps-with: Route all SDK log output, including misconfiguration errors, through one handler-or-OSLog path with no change in behaviour by @mabd-agent
- bd/fedo-sdk-ios-2a4-session-tests-replace-fixed-sleeps-with: Session tests poll for the expected state with a timeout instead of fixed sleeps, and refresh-race failures assert the specific error by @mabd-agent
- bd/fedo-sdk-ios-rv8-ios-show-a-banner-when-a-pull-to-refresh: Show an error banner when a pull-to-refresh fetch fails while rows are visible, instead of only logging it by @mabd-agent
- bd/fedo-sdk-ios-wh9-apply-the-log-level-only-on-successful: Install the log handler only when `Fedo.initialize` is accepted, so a rejected re-init no longer changes where logs go by @mabd-agent
- bd/fedo-sdk-ios-44c.45-small-ui-parity-nits-with-android: Show "N COMMENTS" in the detail header, switch comment times to dates after 7 days and add the editor review notice, matching Android by @mabd-agent
- bd/fedo-sdk-ios-44c.41-decode-lists-lossily-one-bad-item-fails: Skip and log a malformed feedback or comment instead of failing the whole list by @mabd-agent
- bd/fedo-sdk-ios-44c.42-swipe-to-dismiss-silently-blocked-on-the: Ask to discard when swiping down a sheet with unsaved text, and let edit mode dismiss freely when nothing changed by @mabd-agent
- bd/fedo-sdk-ios-44c.43-watermark-bar-shows-a-grey-strip-below-i: Match the watermark bar to the feedback sheet's white loading, error and thanks states on iOS 17-25 by @mabd-agent
- bd/fedo-sdk-ios-44c.49-audit-public-api-surface-before-stable-f: Make the FedoLogEntry initializer internal so hosts only receive entries, never construct them by @mabd-agent
- bd/fedo-sdk-ios-44c.47-stored-session-isn-t-keyed-by-api-key: Start a fresh anonymous session when the API key changes by storing an API-key fingerprint with the stored session by @mabd-agent
- Compare feedback and comment dates as parsed `Date` values instead of strings; unparseable dates sort as oldest by @mabd in [#53](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/53)
- fix/buildWarnings: fix build warnings by @mabd-agent in [#52](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/52)
- feat/iosMinVersionUpgrade: BREAKING CHANGE - increase min sdk supported version to 17 by @mabd in [#51](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/51)
- bd/fedo-sdk-ios-44c.38-vote-failure-on-the-detail-screen-is-inv: Show a failed vote's error banner on the detail screen itself instead of on the hidden list screen by @mabd-agent
- bd/fedo-sdk-ios-44c.37-empty-board-shows-the-filter-empty-state: Show the board's own empty state with a "Suggest a feature" button instead of the filter-empty message by @mabd-agent
- bd/fedo-sdk-ios-44c.36-feedback-created-before-the-first-succes: Keep feedback posted before the first successful load by creating the list instead of dropping it by @mabd-agent
- bd/fedo-sdk-ios-44c.34-requests-run-in-task-detached-so-nothing: Make requests inherit cancellation from the caller's task so leaving a screen cancels its in-flight requests by @mabd-agent
- bd/fedo-sdk-ios-44c.33-networktimeout-is-an-idle-timeout-and-si: Make FedoConfig.networkTimeout the total per-request limit and remove the hidden 60 s cap by @mabd-agent
- bd/fedo-sdk-ios-44c.32-accessibility-and-copy-nits: Use 44 pt targets for comment menu and dismiss buttons, fix "1 vote"/"1 character" plurals, raise "You" badge contrast, label the feedback menu and announce errors to VoiceOver by @mabd-agent
- bd/fedo-sdk-ios-44c.31-theming-tint-only-half-applies-color-acc: Make the vote glyph, send button, comment highlight and avatar fallback follow the host's .tint() instead of the AccentColor asset by @mabd-agent
- bd/fedo-sdk-ios-44c.48-add-log-handler-to-fedoconfig-android-pa: Add FedoConfig.logHandler to receive SDK log entries (FedoLogEntry) instead of OSLog by @mabd-agent
- bd/fedo-sdk-ios-44c.28-port-android-s-session-tests-logout-refr: Add tests for logout, token-refresh races, 401 retry and Fedo.initialize ported from the Android SDK by @mabd-agent
- bd/fedo-sdk-ios-44c.27-relativetime-fractional-seconds-fallback: Parse comment timestamps with the shared FeedbackDate parser so fractional seconds and offsets like +03:00 always work by @mabd-agent
- bd/fedo-sdk-ios-44c.25-sdk-strings-are-looked-up-in-the-host-ap: Render all SDK text verbatim so it is never looked up in the host app's bundle and stays consistently English by @mabd-agent
- bd/fedo-sdk-ios-44c.24-create-sheet-developer-error-copy-option: Use user-facing error copy in the create sheet, fix the "(options)" typo and show a thank-you state after posting by @mabd-agent
- bd/fedo-sdk-ios-44c.23-length-limits-count-like-the-backend-cap: Count length limits in Unicode scalars like the backend, cap comment edits at 2,000 and validate comments in core by @mabd-agent
- bd/fedo-sdk-ios-44c.22-comments-flash-to-a-spinner-every-time-t: Keep loaded comments visible while the detail screen reloads them instead of flashing a spinner by @mabd-agent
- bd/fedo-sdk-ios-44c.21-feedback-detail-one-failed-refresh-hides: Clear stale refresh and comments errors on any successful load, post or store update by @mabd-agent
- bd/fedo-sdk-ios-44c.20-failed-comment-delete-shows-no-message: Show a "Couldn't delete comment" alert when deleting a comment fails by @mabd-agent
- bd/fedo-sdk-ios-44c.19-comment-count-on-list-rows-doesn-t-updat: Update the comment count on list rows right after posting or deleting a comment by @mabd-agent
- bd/fedo-sdk-ios-44c.18-fedo-not-initialized-placeholder-is-debu: Show a friendly "feedback isn't available" placeholder in Release builds when Fedo isn't initialized, and log the developer hint regardless of log level by @mabd-agent
- bd/fedo-sdk-ios-44c.17-freeze-public-api-make-default-globals-i: Remove the public DEFAULT_NETWORK_TIMEOUT and DEFAULT_LOG_LEVEL globals; FedoConfig defaults (10 s, no logging) are unchanged by @mabd-agent
- bd/fedo-sdk-ios-44c.16-fedo-initialize-blank-key-error-never-lo: Log the blank-apiKey error at the configured level, treat newline-only keys as blank, drop the spurious first-init log, make initialize atomic, and fix the re-init doc by @mabd-agent
- bd/fedo-sdk-ios-44c.15-setuseremail-is-rejected-though-the-docs: Allow a blank email in setUserEmail so the host can clear it, as documented by @mabd-agent
- bd/fedo-sdk-ios-44c.13-keychain-errors-are-swallowed-orphan-ano: Keep the stored session when the Keychain is unreadable (no orphan anonymous user) and keep the session in memory when a write fails by @mabd-agent
- bd/fedo-sdk-ios-umb-decode-unknown-feedback-status-values-wi: Decode unknown feedback status values as "Unknown" instead of failing the response, and list them under Closed by @mabd-agent
- fix/safePrintLogData: don't print user data in logs by @mabd
- bd/fedo-sdk-ios-44c.12-fresh-install-keychain-wipe-races-the-fi: Wipe a reinstalled app's old Keychain before the first session read so the launch no longer uses a stale user by @mabd-agent
- bd/fedo-sdk-ios-44c.11-logout-keeps-the-core-token-cached-feedb: Clear the core token and cached feedback on logout, drop in-flight responses of the previous user, and show the loading state until the new user exists by @mabd-agent
- bd/fedo-sdk-ios-44c.10-late-token-refresh-can-restore-a-logged: Drop a token refresh that finishes after logout or a user change so it no longer restores the old user by @mabd-agent
- bd/fedo-sdk-ios-44c.4-delete-is-offered-for-own-feedback-in-an: Only delete own feedback in in_review or planned; other statuses show a "Can't Delete Feedback" alert instead of a failing request by @mabd-agent
- bd/fedo-sdk-ios-44c.3-pull-to-refresh-and-retry-blank-the-feed: Keep feedback rows visible during pull-to-refresh, await the fetch so the spinner persists, and show a spinner on Retry by @mabd-agent
- bd/fedo-sdk-ios-44c.2-non-409-createuser-failure-leaves-the-se: Show the error state instead of spinning forever when creating a user fails with a non-409 status by @mabd-agent
- bd/fedo-sdk-ios-44c.1-setuserid-gets-replaced-by-a-queued-anon: Create the anonymous user inline on initialize and logout so a queued setUserID is no longer replaced by it by @mabd-agent
- feedback-editor-discard-confirm: Ask before leaving the feedback editor with unsaved title or details. Cancel replaces the back button and shows a "Discard changes?" confirmation by @mabd in [#19](https://git.mabd.dev/fedo/fedo-ios-internal/pulls/19)

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
