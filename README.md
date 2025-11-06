
# CovidChecker

CovidChecker is a learning project I built with SwiftUI to explore modern iOS development patterns while solving a practical problem: presenting COVID-19 statistics by country in a clean, mobile-first UI.

This README focuses not only on how to run the app, but on what I learned while building it, the decisions I made, and the next steps I plan to take.

## Why I built this
- Practice SwiftUI for real-world UI layout and navigation.
- Learn networking and decoding JSON in Swift (plus handling async updates).
- Reinforce app structure patterns (light MVVM / controller + models + views separation).

## What I learned (high level)
- SwiftUI basics: view composition, navigation, Lists, and custom subviews.
- Data flow: how to use an observable controller/view-model (`Controllers/CovidController.swift`) to drive views.
- Networking: building a small networking layer in `Services/CovidAPI.swift` and decoding JSON into typed models (`Models/CountriesCovidModel.swift`).
- Async patterns: handling asynchronous fetches and updating the UI safely on the main thread.
- App structure: organizing code into `Controllers/`, `Models/`, `Services/`, and `Views/` for better maintainability.

## Technical decisions
- SwiftUI for the entire UI to keep the project modern and concise.
- Simple controller/view-model instead of a full Combine pipeline to keep the code approachable.
- Minimal external dependencies — everything uses Foundation and Swift standard libraries so the project stays small and easy to run.

## Quick start (run locally)
1. Open the project in Xcode:

```zsh
open CovidChecker.xcodeproj
# or the workspace if you use it:
open CovidChecker.xcworkspace
```

2. Pick an iOS simulator or a connected device, then Run (⌘R).

3. The app fetches live data from the remote API configured in `Services/CovidAPI.swift`. If you want to work offline or create deterministic tests, you can stub responses in the service.

## File map and why it matters
- `CovidCheckerApp.swift` — App entry and global environment setup. Good place to add app-wide objects.
- `ContentView.swift` — Root view and high-level layout.
- `Controllers/CovidController.swift` — Responsible for fetching data, error handling, and exposing observable state to views. This was a key learning area: keeping networking logic out of the views.
- `Models/CountriesCovidModel.swift` — Codable models that mirror the API responses; designing these helped me practice safe decoding and optional handling.
- `Services/CovidAPI.swift` — Encapsulates HTTP requests and response parsing. Useful to separate concerns and enable easier testing.
- `Views/CountriesBanner.swift`, `Views/CountriesCovid.swift`, `Views/CountriesDetail.swift` — Composed SwiftUI views. Breaking UI into small components simplified layout and reuse.

## Challenges I faced and how I solved them
- Parsing inconsistencies: Some fields in the API were optional or could be null. I updated the models to use optionals and provided sensible default displays in the UI.
- Keeping UI responsive: I learned to ensure network completions update published properties on the main thread so the UI stays snappy.
- Organizing state: I iterated between putting logic in the view and moving it into `CovidController` to make unit testing easier and keep views declarative.

```zsh
xcodebuild test -project CovidChecker.xcodeproj -scheme CovidChecker -destination 'platform=iOS Simulator,name=iPhone 14'
```

## Personal notes / takeaways
- This project was a compact, practical way to get comfortable with SwiftUI and app architecture.
- The most valuable learning came from simplifying the app until each file had a clear responsibility.
- I now feel more confident wiring async network calls into SwiftUI and organizing app code for future expansion.
---
<img width="342" height="639" alt="Screenshot 2025-11-06 at 12 22 33 p m" src="https://github.com/user-attachments/assets/5324edee-49ca-429a-9df2-91f5e72e443e" />

<img width="315" height="621" alt="Screenshot 2025-11-06 at 12 22 20 p m" src="https://github.com/user-attachments/assets/23b2d71c-52d6-46e9-b031-77e3e07b4b7f" />
