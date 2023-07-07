from AppKit import NSWorkspace
import subprocess
import re
# active_app = NSWorkspace.sharedWorkspace().activeApplication()
def mac_list():
    """
    List all Mac id's and store as list
    """
    output = subprocess.check_output("getmac").decode('utf-8')
    regex = r"([0-9A-F]{2}[:-]){5}([0-9A-F]{2})"
    matches = re.finditer(regex, output)
    listoutputmac = []
    for matchnum, match in enumerate(matches):
        matchnum = matchnum + 1
        listoutputmac.append("{match}".format(matchnum=matchnum, start=match.start(),
                                                end=match.end(), match=match.group()))
    return listoutputmac
print(mac_list())
print(NSWorkspace.sharedWorkspace())
exit()
# print(type(active_app))
# apps =  NSWorkspace.sharedWorkspace().runningApplications()
# for app in apps:
#     print(app.windows())