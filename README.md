# Fedo iOS SDK

In-app feedback board for iOS — users post feedback, vote, and comment. [getfedo.com](https://getfedo.com)

## Install

Xcode → File → Add Package Dependencies → `https://github.com/getfedo/fedo-ios`

Fedo is in beta: set the dependency rule to **Exact Version** `0.3.0-beta.1` (SwiftPM skips pre-releases for "Up to Next Major").

Or in `Package.swift`:

```swift
.package(url: "https://github.com/getfedo/fedo-ios", exact: "0.3.0-beta.1")
```

Requires iOS 16+, Xcode 26+.

## Usage

```swift
import FedoKit

@main
struct MyApp: App {
    init() { Fedo.initialize(apiKey: "<api-key>") }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NavigationLink("Feedback") { FeedbacksView() }
            }
        }
    }
}
```

See [docs.getfedo.com](https://docs.getfedo.com/guide/getting-started/) for documentation and walk through

See [CHANGELOG.md](CHANGELOG.md) for release notes.
