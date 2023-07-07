import subprocess
from .open import asrun
def main():
    asrun("""tell application "VLC" to set the clipboard to "video://" & (name of current item) & " " & (current time)""")

if __name__ == "__main__":
    main()
