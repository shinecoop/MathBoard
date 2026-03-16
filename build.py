# Script used to customize your
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


# updates template based on current key configuration
def updateTemplate(template, system, ver, keymap, date=datetime.datetime.now()):

    if system=="mac":
        name = f"MathBoard{system}v{ver}.keylayout"
    else:
        name = f"MathBoard{system}v{ver}.ahk"

    out = template.render(
        ver=ver,
        id=-5555 + ver,
        date=date,
        mods=keymap[0],
        keymap=keymap[1],
    )

    with open(f"./{system}/{name}", "w") as f:
        f.write(out)

    print(f"UPDATED LAYOUT AT {system}/{name}.")


def build(templatePath="./templates", ver=1):

    map = ""
    # check to see if keys-current exists
    try:
        with open("./templates/keys/keys-current.json", "r") as f:
            map = json.loads(f.read())

    except FileNotFoundError:
        print("KEY CONFIG REFERENCE NOT CREATED, CREATING ...")

        createCurrentKeys()

        with open("./templates/keys/keys-current.json", "r") as f:
            map = json.loads(f.read())

    # render templates using KEYMAP

    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(templatePath),
        autoescape=True,
    )

    # update mac template

    updateTemplate(
        template=env.get_template("Tmac.xml.j2"),
        system="mac",
        ver=ver,
        keymap=map,
    )


    # update windows template
    updateTemplate(
        template=env.get_template("Twin.xml.j2"),
        system="windows",
        ver=ver,
        keymap=map,
    )


def main():

    build()


if __name__ == "__main__":
    main()
