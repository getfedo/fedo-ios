# Fedo iOS SDK

In-app feedback board for iOS — users post feedback, vote, and comment. [getfedo.com](https://getfedo.com)

## Install

Xcode → File → Add Package Dependencies → `https://github.com/getfedo/fedo-ios`

Or in `Package.swift`:

```swift
.package(url: "https://github.com/getfedo/fedo-ios", from: "0.1.0")
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

See [CHANGELOG.md](CHANGELOG.md) for release notes.
