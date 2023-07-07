import objc
from AppKit import *

class AppDelegate(NSObject):

    def applicationDidFinishLaunching_(self, notification):
        statusbar = NSStatusBar.systemStatusBar()
        self.statusitem = statusbar.statusItemWithLength_(NSVariableStatusItemLength)
        self.statusitem.setTitle_("Menu Bar App")
        self.statusitem.setHighlightMode_(1)

        self.menu = NSMenu.alloc().init()

        # Create a submenu
        submenu = NSMenu.alloc().init()
        submenu_item = NSMenuItem.alloc().initWithTitle_action_keyEquivalent_("Submenu", None, "")
        submenu_item.setSubmenu_(submenu)

        # Add items to the submenu
        submenu.addItemWithTitle_action_keyEquivalent_("Item 1", None, "")
        submenu.addItemWithTitle_action_keyEquivalent_("Item 2", None, "")
        submenu.addItemWithTitle_action_keyEquivalent_("Item 3", None, "")

        # Add the submenu to the main menu
        self.menu.addItem_(submenu_item)

        # Add a separator to the main menu
        self.menu.addItem_(NSMenuItem.separatorItem())

        # Add a simple action to the main menu
        simple_action = NSMenuItem.alloc().initWithTitle_action_keyEquivalent_("Simple Action", objc.selector(self.simpleAction, signature=b'v@:@'))
        self.menu.addItem_(simple_action)

        # Add a quit action to the main menu
        quit_action = NSMenuItem.alloc().initWithTitle_action_keyEquivalent_("Quit", objc.selector(self.quit, signature=b'v@:@'))
        self.menu.addItem_(quit_action)

        self.statusitem.setMenu_(self.menu)

    def simpleAction(self):
        print("Simple action triggered")

    def quit(self):
        NSApplication.sharedApplication().terminate_(self)

if __name__ == "__main__":
    app = NSApplication.sharedApplication()
    delegate = AppDelegate.alloc().init()
    app.setDelegate_(delegate)
    app.run()