# Script used to customize & archive your
# key configurations across mac and windows
#

import datetime
import json
import jinja2

BASE = "./templates/keys/keys-base.json"
CURRENT = "./templates/keys/keys-current.json"

# update base key json
def changeBase(basePath, template):
    try:
        with open(basePath, "w") as f:
            f.write(json.dumps(template))
    except FileNotFoundError:
        print(f"INVALID PATH ({basePath}) NOT FOUND. ")


# creates keys-current json in the event it doesnt exist already
def createCurrentKeys(
    path="./templates/keys/", baseName="keys-base.json", currentName="keys-current.json"
):
    try:
        with open(str(path + baseName), "r") as f:
            with open(str(path + currentName), "w") as g:
                g.write((f.read()))

                print(f" KEY CONFIG FILE {path + currentName} CREATED !")
    except FileNotFoundError:
        print(f"BASE FILE {path + baseName} NOT FOUND. ABORTING ...")
        exit()

    return 1


def updateTemplate(template, ver, keymap, date=datetime.datetime.now()):

    name = f"MathBoardMACv{ver}.keylayout"
    out = template.render(
        ver=ver,
        id=-5555 + ver,
        date=date,
        mods=keymap[0],
        keymap=keymap[1],
    )

    with open("./mac/" + name, "w") as f:
        f.write(out)


def build(templatePath="./templates"):

    map = ""
    # check to see if keys-current exists
    try:
        with open("./templates/keys/keys-current.json", "r") as f:
            map = json.loads(f.read())

    except FileNotFoundError:
        print("KEY CONFIG REFERENCE NOT CREATED, CREATING ...")

        createCurrentKeys()

    # render templates using KEYMAP

    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(templatePath),
        autoescape=True,
    )

    updateTemplate(
        template=env.get_template("Tmac.xml.j2"),
        ver=1,
        keymap=map,
    )


def main():

    build()


if __name__ == "__main__":
    main()
