if __name__ == "__main__":
    import sys
    import re

    vimrc_path = "../.vimrc"
    with open(vimrc_path) as f:
        vimrc_content = f.read()

    runtimepath_pattern = re.compile(":?set runtimepath.*")
    vundle_pattern = re.compile(".*(V|v)undle.*")
    plugin_pattern = re.compile("\s*Plugin.*")

    patterns = [runtimepath_pattern, vundle_pattern, plugin_pattern]
    for pattern in patterns:
        vimrc_content = pattern.sub("", vimrc_content)

    def include_colorscheme(match):
        colorscheme_name = match.group(2)
        with open("../vim/runtime/colors/{}.vim".format(colorscheme_name)) as f:
            colorscheme_data = f.read()
        return "\n\n{}\n\n".format(colorscheme_data)

    colorscheme_pattern = re.compile("colo(rscheme)? (\S+).*")
    vimrc_content = colorscheme_pattern.sub(include_colorscheme, vimrc_content)

    with open("../portable_vimrc", "w") as f:
        f.write(vimrc_content)

