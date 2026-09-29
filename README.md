# Fedo iOS SDK

In-app feedback board for iOS — users post feedback, vote, and comment. [getfedo.com](https://getfedo.com)

## Install

Xcode → File → Add Package Dependencies → `https://github.com/getfedo/fedo-ios`

Fedo is in beta: set the dependency rule to **Exact Version** `0.4.0-beta.1` (SwiftPM skips pre-releases for "Up to Next Major").

Or in `Package.swift`:

```swift
.package(url: "https://github.com/getfedo/fedo-ios", exact: "0.4.0-beta.1")
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
                NavigationLink("Feedback") { FedoFeedbackView() }
            }
        }
    }
}
```

## Links

- Website: https://getfedo.com
- Docs: https://docs.getfedo.com/sdk/getting-started/
- Data the SDK collects: https://docs.getfedo.com/sdk/user-management/ and https://getfedo.com/privacy
- Pricing: https://getfedo.com/pricing (free on one app)
- Example app: https://github.com/getfedo/fedo-ios-example
- [CHANGELOG.md](CHANGELOG.md) for release notes.

