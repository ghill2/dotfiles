from pathlib import Path
import shutil
import subprocess
menu_items = [
    "ExtractDMG"
]

def replace_line(file_path, line_number, new_line):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    if line_number <= len(lines):
        lines[line_number - 1] = new_line + '\n'  # Adjust the line number to zero-based index

        with open(file_path, 'w') as file:
            file.writelines(lines)
        print("Line replacement successful.")
    else:
        print("Invalid line number.")


def add_workflow_to_finder_menu(workflow_path):
    script = f"""
    tell application "Finder"
        set workflows_folder to POSIX file "/Library/Services" as alias
        make new alias file at workflows_folder to POSIX file "{workflow_path}"
    end tell
    """
    subprocess.run(['osascript', '-e', script])

def add_workflow_to_finder_menu(workflow_path):
    import os
    workflows_folders = (
        '/Library/Services',
        '/Users/g1/Library/Services'
    )
    
    for workflows_folder in workflows_folders:
        symlink_path = Path(workflows_folder) / Path(workflow_path).name
        if symlink_path.exists():
            symlink_path.unlink()
        # shutil.copytree(workflow_path, symlink_path, dirs_exist_ok=True)
        # shutil.copytree(workflow_path, symlink_path, dirs_exist_ok=True)


        os.symlink(workflow_path, symlink_path)
        subprocess.run(['SetFile', '-a', 'S', symlink_path])

# def add_workflow_to_finder_menu(workflow_path):
#     script = f"""
#     tell application "Finder"
#         set workflow_file to POSIX file "{workflow_path}"
#         set workflow_name to name of workflow_file
#         set workflow_path to POSIX path of (container of workflow_file as alias)
#         set workflow_alias to make new alias file at folder "Applications" to workflow_file
#         set workflow_menu_path to (POSIX path of (container of folder "Applications" as alias)) & "SendToMenu"
#         do shell script "/System/Library/CoreServices/pbs -newitem '{workflow_menu_path}' -label '" & workflow_name & "' -path " & quoted form of (POSIX path of workflow_alias) & " -sendProc sendmenu"
#         delete workflow_alias
#     end tell
#     """
#     subprocess.run(['osascript', '-e', script])

if __name__ == "__main__":
    # for name in menu_items:

    template = Path(__file__).parent / f'template.workflow'

    # if template.exists(): shutil.rmtree(template)
    # copy and relaunch finder
    # filename can be different than name in plist, it just shows the name in plist
    # when the plist name is change the service does not show up anymore    
    shutil.copytree(
        Path(__file__).parent / 'template.workflow',
        template,
        dirs_exist_ok=True
        )
    
    # replace service name
    # replace_line(
    #     template / 'Contents/Info.plist',
    #     15,
    #     f"				<string>template</string>"
    # )
    
    
    # # line 64 template.workflow
    # cmd = '/Users/g1/BU/projects/dotfiles/menu_items/main.sh "$@"'
    # replace_line(
    #     template / 'Contents/document.wflow',
    #     64,
    #     cmd
    # )
    
    import os
    symlink_path = Path('/Library/Services') / template.name

    if symlink_path.exists():
        symlink_path.unlink()
    os.symlink(template, symlink_path)
    subprocess.run(['SetFile', '-a', 'S', symlink_path])

    
    # relaunch finder
    subprocess.run(['killall', 'Finder'])

    """
    Extensions > Finder > Enable
    Use the defaults command to add the workflow file to the Finder's Services menu. Run the following command:

    # defaults write "pboard" "NSServicesStatus" -dict-add "template" '{ "key_equivalent" = "@~$m"; "NSMenuItem" = { "default" = "template"; }; "NSMessage" = "openFile:"; "NSMenuItemIcon" = ""; "NSUsesItemFromMenu" = 1; }'
    

    The activated finder services preferences are stored as a list of dictionaries in preferences.
    To read them use "defaults read pbs NSServicesStatus"

    What are the default values of the dict when the service is activated in system preferences?

    "(null) - template - runWorkflowAsService" =     {
        "presentation_modes" =         {
            ContextMenu = 1;
            FinderPreview = 1;
            ServicesMenu = 1;
            TouchBar = 0;
        };
    };

    defaults write pbs NSServicesStatus -dict-add '\(null\) - template - runWorkflowAsService' '{ "enabled_services" = (1); }'
    """
    
    # os.system(
    #     """
    #     defaults write pbs NSServicesStatus -dict-add "(null) - template - runWorkflowAsService" '{}'
    #     """
    # )

    # os.system(
    #     """
    #     defaults write pbs NSServicesStatus -dict-add "template" '{ "enabled_services" = (1); }'
    #     """
    # )
    # os.system(
    #     "defaults delete pbs NSServicesStatus"
    # )
    # os.system(
    #     "defaults read pbs NSServicesStatus"
    # )
    # os.system(
    #     """
    #     qlmanage -e -s template
    #     """
    # )
    # os.system(
    #     f'automator -i enabled "{template}"'
    # )
    # defaults write com.apple.systempreferences QuickActionsEnabledServices -array-add "(null) - template - runWorkflowAsService"
    # os.system(
    #     'defaults write pbs NSServicesStatus -dict-add "template" -bool true'
    # )
    # subprocess.run(['open', f'x-apple.systempreferences:com.apple.preference.Keyboard'])
    

        

        # add_workflow_to_finder_menu(template)