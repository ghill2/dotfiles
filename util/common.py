def create_cmd_str(cmds, default_sep="&&"):
    s = ""
    for i, data in enumerate(cmds):
        if isinstance(data, str):
            cmd, sep = data, default_sep
        elif isinstance(data, tuple):
            if len(data) == 1:
                cmd, sep = data, default_sep
            elif len(data) == 2:
                cmd, sep = data
            else:
                raise RuntimeError("Check cmds")
        else:
            raise RuntimeError("Check cmd type.")
        if i == len(cmds) - 1:
            sep = ""
        s += f"{cmd} {sep} "
    return s.rstrip()