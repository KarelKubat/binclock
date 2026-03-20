import SwiftUI
import AppKit

@main
struct BinClockApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // We'll handle window creation in the AppDelegate for fine-grained control
        // but let's define a dummy scene to keep SwiftUI happy.
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create the window
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 350, height: 200),
            styleMask: [.borderless, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )

        // Window appearance
        window.isOpaque = false
        window.backgroundColor = .clear
        window.level = .floating // Stay on top
        window.isMovableByWindowBackground = true // Allow dragging by background
        window.hasShadow = true
        
        // Ensure it doesn't show a standard title bar
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true

        // Set the SwiftUI view as content
        let contentView = ContentView()
        window.contentView = NSHostingView(rootView: contentView)

        // Center on screen initially
        window.center()
        window.makeKeyAndOrderFront(nil)
        
        // Make the app "accessory" to hide from Dock if desired (optional)
        // NSApp.setActivationPolicy(.accessory) 
    }
}
