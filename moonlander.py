
import glob
import os
# Find newest keyboard file in downloads folder
files = glob.glob(f"{os.expanderuser()}/Downloads/**") # , recursive=True
print(files)
# Open the file with wally-cli