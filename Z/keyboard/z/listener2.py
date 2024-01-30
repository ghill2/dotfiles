import Quartz
import time


class KeyboardEventTap(object):
    def __init__(self):
        self.event_mask = (
            1 << Quartz.kCGEventKeyDown |
            1 << Quartz.kCGEventKeyUp |
            1 << Quartz.kCGEventFlagsChanged
        )
        self.event_tap = None

    def start(self):
        self.event_tap = Quartz.CGEventTapCreate(
            Quartz.kCGSessionEventTap,
            Quartz.kCGHeadInsertEventTap,
            Quartz.kCGEventTapOptionListenOnly,
            self.event_mask,
            self.handle_event,
            None
        )

        loop_source = Quartz.CFMachPortCreateRunLoopSource(
            None, self.event_tap, 0
        )

        Quartz.CFRunLoopAddSource(
            Quartz.CFRunLoopGetCurrent(),
            loop_source,
            Quartz.kCFRunLoopDefaultMode
        )

        Quartz.CGEventTapEnable(self.event_tap, True)

    def stop(self):
        Quartz.CGEventTapEnable(self.event_tap, False)

    def handle_event(self, proxy, event_type, event, refcon):
        if event_type == Quartz.kCGEventKeyDown:
            print(f"Key Down: {event.get_integer_value(Quartz.kCGKeyboardEventKeycode)}")
        elif event_type == Quartz.kCGEventKeyUp:
            print(f"Key Up: {event.get_integer_value(Quartz.kCGKeyboardEventKeycode)}")
        elif event_type == Quartz.kCGEventFlagsChanged:
            print("Flags Changed")
        return event

if __name__ == "__main__":
    import easygui

    # Show an information dialog
    easygui.msgbox("This is an information dialog.", "Information")
    exit()
    event_tap = KeyboardEventTap()
    event_tap.start()

    try:
        while True:
            # Keep the main thread alive
            time.sleep(1)
    except KeyboardInterrupt:
        event_tap.stop()