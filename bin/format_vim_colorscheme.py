from colortrans import rgb2short
import re
import sys


HI_PATTERN = re.compile("hi\s+(\S*)\s+(.*)")


if __name__ == "__main__":
    try:
        filename = sys.argv[1]
        with open(filename) as f:
            contents = f.read()

        def format_attributes(match):
            style_name, attr_string = match.groups()

            attrs = {}
            for attr in attr_string.split():
                name, value = attr.strip().split("=")
                attrs[name] = value

            if "guifg" in attrs:
                value = attrs["guifg"]
                attrs["ctermfg"] = "None" if value == "NONE" else rgb2short(value)[0]
            if "guibg" in attrs:
                value = attrs["guibg"]
                attrs["ctermbg"] = "None" if value == "NONE" else rgb2short(value)[0]
            if "gui" in attrs:
                value = attrs["gui"]
                attrs["cterm"] = value[0] + value[1:].lower()

            format_attr = lambda name: "{}={}".format(name, attrs.get(name)) if name in attrs else ""

            attrs_formatted = "{: <13} {: <13} {: <13} {: <13} {: <13} {: <13}".format(
                    format_attr("guifg"),
                    format_attr("guibg"),
                    format_attr("gui"),
                    format_attr("ctermfg"),
                    format_attr("ctermbg"),
                    format_attr("cterm")).strip()

            return "hi {: <15} {}".format(style_name, attrs_formatted)

        formatted = HI_PATTERN.sub(format_attributes, contents)
        print(formatted)

    except IndexError:
        print("error: Expected a vim colorscheme file as first argument")
    except KeyError:
        print("error: Invalid color value in source")
    except:
        print("error: Something else went wrong")
