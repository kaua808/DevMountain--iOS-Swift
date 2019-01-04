# Flashlight

### Level 0

Students will build a simple Flashlight app to practice working with IBOutlets, IBActions, and UIControlEvents. 

Students who complete this project independently are able to:

* use, understand, and describe different UIControls available in Cocoa Touch
* use, understand, and describe UIControlEvents
* create and use IBOutlets to get access to Storyboard elements in code
* create and use IBActions to run code on a UIControlEvent 

## Guide

### Flashlight View

Build a view with two states. The first state has a black background and an 'On' button with white text. When the user taps 'On' change the background to white, update the button's title to 'Off', and change the button text color to black. The button should toggle the two states.

1. Open the ViewController scene in Main.storyboard
2. Add a UIButton to the view, set the initial title to 'On'
    * note: System buttons animate title changes, which can break the XCTest included in the project. To pass the test, change your UIButton type to Custom, or update the test to adjust for the animation delay.
3. Set the view's background color to black
4. Create ```@IBAction func buttonTapped(sender: AnyObject)``` in your ViewController class

### Flashlight Logic

1. Create a boolean variable isOn to track whether the flashlight is on or off
2. Use the ```buttonTapped``` IBAction to check the current state of the ViewController and toggle the appropriate parameters
    * ex. If isOn is false, set background color, button title text, and button title color

### Black Diamonds

* Add a UISwipeGestureRecognizer to toggle the flashlight
* Create a Unit or UITest that verifies gesture recognizer function

### Tests

* Verifies state of an isOn boolean variable
* Verifies state of background color
* Verifies state of button text
* Verifies correct state change after toggle

## Contributions

Please refer to CONTRIBUTING.md.

## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.