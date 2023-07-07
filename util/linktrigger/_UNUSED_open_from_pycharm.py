from open import open_text
from open import asrun
from open import show_dialog
from open import from_clipboard
import pyautogui

def main():
    with pyautogui.hold('command'):
        pyautogui.press(['c'])
    pyautogui.press(['esc'])
    from_clipboard()

if __name__ == "__main__":
    main()
