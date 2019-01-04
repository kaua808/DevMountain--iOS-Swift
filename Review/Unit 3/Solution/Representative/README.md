# Representatives

### Level 2

Students will build an app to get the representives (law makers) in a user-requested state to practice asyncronous network requests, working with JSON data, closures, and intermediate table views.

Students who complete this project independently are able to:

* use NSURLSession to make aysncronous network calls
* parse JSON data and generate model object from the data
* use closures to execute code when an asyncronous task is complete
* build custom table views

### Search View Controller

##### Set up a scene to allow the user to selected a state and then tap a button that will perform a network call with the requested state, when the network call is complete, segue to the next view controller (RepresentativeTableViewController, discussed below).

1. Place a ```UIPickerView``` and a ```UIButton``` on the view.
2. Wire up an outlet for the ```UIPickerView``` in the ```SearchViewController.swift``` file.
3. Set the delegate and datasource properties of the ```UIPickerView```.
4. Implement the required datasource methods. This ```UIPickerView``` should display all the states. For your convenience, an array of all the state abbreviation is included.
5. Implement the delegate method that will allow you to set the titles of each ```UIPickerView``` row.
6. Wire up an action for the ```UIButton``` on the control event touch up inside.

### Implement Model

##### Create a ```Representative``` model class that will hold the information of a representative to display to the user.

1. Create a ```Representative.swift``` class file and define a new ```Representative``` class.
2. Go to a sample endpoint of the [Who is my Representative](http://whoismyrepresentative.com) API and see what JSON (information) you will get back.
3. Using this information, add properties on ```Representative```.
	* ```name: String?```
	* ```party: String?```
	* ```state: String?```
	* ```district: String?```
	* ```phone: String?```
	* ```office: String?```
	* ```link: String?```
4. Create an init method with a parameter of a dictionary. This is the method you will call and pass your json dictionary to initialize your ```Representative``` model objects. Remember to use a sample endpoint to inspect the JSON you will get back and the keys you will use to get each piece of data.

### Network Controller

##### Create a ```NetworkController``` class. This will have methods to build the different URLs you might want and it should have a method to return NSData from a URL.

1. The ```NetworkController``` should have some static constant that represents your ```baseURL```.
2. Write a function that will take in a search term (the solution code uses a state abbreviation) and return an ```NSURL``` endpoint.
3. Write a function that will take an ```NSURL``` and a completion closure (```dataAtURL:completion:```). The parameter of the completion closure should be of type ```NSData?``` and the closure should return ```Void```. This method will make the network call and if successful will call the completion closure with the ```NSData``` from the network call as it's parameter. If it is unsuccessful, the completion closure should still be called, but ```nil``` should be the parameter.
4. At this point you should be testing your network controller method ```dataAtURL:completion:``` to see if you are getting data returned.

As of iOS 9, Apple is boosting security and trying to require developers to use https. For this API, you must have a paid API account to use https. For the sake of this app and learning, we will turn off this security feature. The error message should describe the issue about App Transport Security blocking a cleartext HTTP. A workaround to Apple's requirements is to add a key-value pair to your Info.plist. This key-value pair should be: App Transport Security Settings : [Allow Arbitrary Loads : YES].

### Representative Controller

##### Create a ```RepresentativeController``` class. This will have methods that are called by the view controller to get ```[Representatives]``` through completion closures.

1. The ```RepresentativeController``` should have a method on it that allows the developer to pass in the search parameter and, through a completion closure, provide a an array of ```Representative``` objects.
    * This method should use the NetworkController to get the NSURL.
    * This method should call the NetworkController's dataAtURL method to get the NSData at the URL created in the previous bullet point.
    * In the closure of the dataAtURL check to make sure you actually get NSData back, not a nil value. If nil, call this methods completion with an empty array as the value for the ```[Representative]``` parameter, else continue.
    * ```try``` (<- *Hint, Hint) to serialize the NSData to JSON objects. If we ```catch``` an exeception, call the completion closure with an empty array as the ```[Representative]``` parameter. If the NSData can be serialized, create a ```Representative``` objects and call the completion closure with the populated array.

### Code for ```SearchViewController```

##### Implement the ```SearchViewController``` class. Implement the IBAction of the button to perform the search, once the search is complete, perform the segue to the ```ResultsTableViewController```

1. Add an additional scene to the Storyboard. Use a ```UITableViewController```. Create a class file ```ResultsTableViewController.swift```. Set the class of the ```UITableViewController``` scene to ```ResultsTableViewController```.
2. Add a show segue from the ```SearchViewController``` (not from the ```UIButton```) to the ```ResultsTableViewController```. Give the segue an identifier.
3. In the ```ResultsTableViewController```, add a property of type ```[Representative]```.
4. In the ```SearchViewController```, add a property of type ```[Representative]```.
5. In the IBAction of the ```SearchViewController```'s ```UIButton```, use your ```RepresentativeController``` to perform the search based on the ```UIPickerView```'s selected state. Once the search is complete, set the ```SearchViewController```'s ```[Representative]``` property to the results you recieve in the closure. Call the ```performSegueWithIdentifier:sender:``` method.
6. Implement the ```prepareForSegue:sender:``` method. Check to make sure the identifer is the correct one, get the ```destinationViewController```, set it's ```[Representative]``` property to results you recieved from the search.

### Storyboard - ```ResultsTableViewController``` and ```RepresentativeDetailViewController```

##### Add a prototype cell to the ```ResultsTableViewController```. Add a detail view with a representatives details that will show when the user taps a representative from the ```ResultsTableViewController```. Use custom table view cells to display the representatives details.

1. Add a prototype cell to the ```ResultsTableViewController```'s ```UITableView```. Give it an identifier.
2. Add an additional scene to the Storyboard. Use a ```UITableViewController```. Create a class file ```RepresentativeDetailTableViewController.swift```. Set the class of the ```UITableViewController``` scene to ```ResultsDetailTableViewController```. 
3. Add a show segue from the prototype cell on ```ResultsTableViewController``` to the ```RepresentativeDetailTableViewController``` scene. Give the segue an identifier.
4. Add two prototype cells, both of style subtitle. On one cell, we will display the representative's name, state, district, and state image. Make the ```textLabel``` large font and set the minimum font size (in case a representative has a long name). Set the ```detailTextLabel``` to a smaller font than the ```textLabel```. Give this cell an identifier. One the second cell, we will display the representative's details (phone, office, website, party) with a header label describing the information in that cell. The ```textLabel``` will be smaller than the ```detailTextLabel```. Make changes to the cell to reflect this. Give this cell an identifier.

### Code for ```ResultsTableViewController```

##### Implement the required ```UITableViewDataSource``` methods and prepare for the segue to the detail view.

1. Implement the required ```UITableViewDataSource``` methods.
2. Add a property of type Representative to the ```RepresentativeDetailTableViewController```.
3. In the ```prepareForSegue:sender:``` method, check if the segue's identifer match the one set in Storyboard, get the destination view controller, and set the Representative property on the ```RepresentativeDetailTableViewController```.

### Code for ```RepresentativeDetailTableViewController```.

##### Implement the required ```UITableViewDataSource``` methods. In the ```tableView:cellForRowAtIndexPath:``` method, ```switch``` on the ```indexPath.row``` to make sure you dequeue and return the right cell based on the row.

1. Implement ```tableView:numberOfRowsInSection:``` method. Since we know exactly how many cells we want to display and it doesn't change, hard code the number of rows.
2. Implement ```tableView:cellForRowAtIndexPath:``` method. Since we need to customize each cell will data pulled from different properties, we are going to ```switch``` on the ```indexPath.row``` and dequeue the cell with the identifier we want at that row and set the data to the correct ```Representative``` property.
3. Also when the view appears, set the title of the view controller to the representative's name.

### Black Diamonds

* Notice how after tapping the search button, the app hangs and doesn't do anything while the network call is being performed. Give visual feedback to the user that the search is being conducted.
* Implement another way for users to find their Congressman/Congresswoman.
* If no Represenatives were "found", notify the user that a search failed.
* Make the phone, office, and website labels links that would call, open a map view, and open a web view.

## Contributions

Please refer to CONTRIBUTING.md.


## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.