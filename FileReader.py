import os
import shutil
import sys


# Give Action Prompt
def giveaction():
    action = input("What action would you like to perform? \nType help for options\n")

    # Remove white space and convert input to lower
    # Converting to lower reduces change of case-sensitive errors when giving a command
    actionInput = action.strip()
    checkaction(actionInput.lower())


# Create New Files
def creating():
    fileTypeStrip = ""

    option = input("Would like to create a file or folder?")
    option.strip()
    option.lower()
    # Check to see if the file type is valid
    valid = False
    while not valid:
        fileType = input("What type of file are you looking to create? \n")
        # if the file detects a type error then the value is correct
        try:
            type = int(fileType)
            print("Please input a file name instead of a number")
        except ValueError:
            fileTypeStrip = fileType.strip()
            valid = True

    names = input("Please name all the file/folder(s) you wish to create.\nPlease list all the files before "
                  "accepting.\n")
    fileNames = names.split()
    # DEBUG: print(fileNames)

    # Check to see if the file already exists
    try:
        for name in fileNames:
            with open(name + fileTypeStrip, "x") as newFile:
                newFile.flush()
                print("File " + name + " Successfully Created!")
    except FileExistsError:
        print("That file already exists!")

    # Return back to the beginning
    giveaction()


# Read Selected Files
def readfile():
    # Creates a list of all the files the user wishes to read
    fileName = input("Please name all the files you wish to read.\nPlease list all the files before accepting.\n")
    fileNames = fileName.split()
    print(fileNames)

    content = ""
    # check to see if the file exists
    for name in fileNames:
        if os.path.isfile(name):
            # For each file that is opened, append contents and dividing them off with a line.
            # TODO: Display file name after each line.
            with open(name, "r") as file:
                content += "\n---------------------------\n" + sys.argv[
                    0] + "\n---------------------------\n" + file.read()
        else:
            print("The file " + name + " does not exist!")
    print(content)
    giveaction()


def editfile():
    fileName = input("What files do you want to edit?\nPlease list all the files before accepting.\n")
    fileNames = fileName.split()
    print(fileNames)

    # Check which access mode the user wants
    accessMode = ""
    valid = False
    while not valid:
        editType = input("Would you like to append or overwrite these files?\n")
        # ensure input it exact if user has typed with a capital or with extra white space
        editType.strip()
        editType.lower()
        if editType == "append":
            accessMode = "a"
            valid = True
        elif editType == "overwrite":
            accessMode = "w"
            valid = True
        else:
            print("Please write 'append' or 'overwrite'")

    message = input("To add to the selected files, please type here:\n")
    for name in fileNames:
        with open(name, accessMode) as file:
            file.write(message)
    print("File(s) have successfully edited!")
    giveaction()


# Deleting Files
def deletefile():
    fileName = input("What files do you want to delete?\nPlease list all the files before accepting.\n")
    fileNames = fileName.split()
    print(fileNames)

    # Check to see if the file exists
    for name in fileNames:
        if os.path.isfile(name):
            os.remove(name)
        else:
            print("The file " + name + " does not exist!")
    print("File(s) have successfully been deleted!")
    giveaction()


# Copy selected files to an absolute directory path
def copyfile():
    fileName = input("What files do you want to copy?\nPlease list all the files before accepting.\n")
    fileNames = fileName.split()
    print(fileNames)

    dir = input("Which directory would you like to copy the files to?\nPlease insert an absolute directory path.")

    # Check to see if the file exists
    for name in fileNames:
        if os.path.isfile(name):
            shutil.copy(name, dir)
        else:
            print("The file " + name + " does not exist!")
    print("File(s) have successfully been copied to: " + dir)
    giveaction()


# Get Current Working Directory
def getdirectory():
    print("This is the current working directory: " + os.getcwd())
    giveaction()


def getsubfolders():
    print("These are the sub-folders in the current working directory:\n")
    for folder in os.walk(os.getcwd()):
        print(folder)
    giveaction()


# Check to see if the user's input matches with any logged action
def checkaction(input):
    match input:
        case "create":
            return creating()
        case "read":
            return readfile()
        case "edit":
            return editfile()
        case "delete":
            return deletefile()
        case "copy":
            return copyfile()
        case "directory":
            return getdirectory()
        case "help":
            print("Here is the list of options to choose:")
            print("Create\nRead\nEdit\nDelete\nCopy\nDirectory\n")
            return giveaction()
        case "exit":
            sys.exit()
        case _:
            print("That doesn't seem to be an option. If you are unsure about the options, type help at the action "
                  "screen.")
            return giveaction()


# Run This First
# ----------------------------------------------------------------------------------------------------------------------
giveaction()
