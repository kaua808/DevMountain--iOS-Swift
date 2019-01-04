# LocalizationDemo

In the project file, go to the info tab and select PROJECT. To add localizations to your storyboard, click the plus button under the localizations section and select your language (for this demo, we choose Spanish (es)).

In your storyboard drop-down folder, select Main.strings (Spanish).

Translate the value section of the string (ex: "objectID" = "value").

Change the settings on your testing device/simulator and set the language to Spanish (es).

Go through the project finding the strings you want to translate and replace them with NSLocalizedString.

In the Terminal, change diriectories to the folder that holds all of your files for this project.

Enter genstrings *swift in terminal to create a localizable strings file, and drag that file into your project.

In Xcode, select the Localizable.strings file, and in the File Inspector select Localize, and select the language(s).

Go through each of the newly created Localizable.strings files and translate the value section to the desired translation (ex: "objectID" = "valor").
