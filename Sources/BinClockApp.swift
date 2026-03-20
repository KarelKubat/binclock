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
        let windowWidth: CGFloat = 350
        let windowHeight: CGFloat = 200
        
        // Get the screen frame (excluding menu bar and dock)
        let screenFrame = NSScreen.main?.visibleFrame ?? NSRect(x: 0, y: 0, width: 800, height: 600)
        
        // Calculate the upper right position
        let xPos = screenFrame.maxX - windowWidth - 20 // 20pt padding from the right edge
        let yPos = screenFrame.maxY - windowHeight - 20 // 20pt padding from the top edge
        
        // Create the window
        window = NSWindow(
            contentRect: NSRect(x: xPos, y: yPos, width: windowWidth, height: windowHeight),
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

        // Make visible on all spaces/desktops
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]

        window.makeKeyAndOrderFront(nil)
        
        // Make the app "accessory" to hide from Dock if desired (optional)
        // NSApp.setActivationPolicy(.accessory) 
    }
}
