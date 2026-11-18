import SwiftUI

@main
struct ShooterLoaderApp: App {
    var body: some Scene {
        WindowGroup {
            LoaderView()
                .preferredColorScheme(.dark)
        }
    }
}
