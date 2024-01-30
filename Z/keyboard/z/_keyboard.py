

    
# from listener import KeyEventListener
# def callback():
#     print("test")
# listener = KeyEventListener(callback=callback, blocking=True)
# listener.run()

# from pynput import keyboard
# with keyboard.Listener(on_press=on_key_press, on_release=on_key_release) as listener:
#     listener.join()

# Block forever, like `while True`.
# keyboard.wait()
# keyboard.add_hotkey('space',
#     lambda: applescript.run(
#         'tell application "VLC" to set the clipboard to (path of current item) & " " & (current time)'
#     )
# )

# while True:
#     keyboard.wait('space')
#     print('space was pressed! Waiting on it again...')

# or this


# Use this instead
# keyboard.wait()



# keyboard.add_hotkey(
#     'ctrl+alt+d',
#     lambda: asrun(
#         'tell application "VLC" to set the clipboard to (path of current item) & " " & (current time)'
#     )
# )
# keyboard.add_hotkey('alt+down', corsearch_down)