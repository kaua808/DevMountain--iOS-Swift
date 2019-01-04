//
//  Instructions.swift
//  ChatStretch
//
//  Created by James Pacheco on 3/7/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

/*

Pull down the project at https://github.com/jamesrp13/chatstretch

1. In TableViewController in viewDidLoad, fetch the data corresponding to the currentUserID that is given and print it out.

2. Using the data that it returns, fetch the data corresponding to the groups that the currentUserID's user belongs to and print it out.

3. Loop through the userID's in each group and fetch the user data so that you can print out the username of each user in each chat group.

4. Then make your print statment nice and print out "\(username) is currently in \(count) chats with \(userChattingWith1) and \(userChattingWith2)" where username is the username of the currentUser, count is the number of chats that user is in, and userChattingWith1 is the first person the user is chatting with and userChattingWith2 is the second person the user is chatting with.

4. Look at what you have done. At one point, you had the keys to each group chat. Using this, fetch all of the messages associated with each group and print them to the console. Hint* read the Firebase documentation for queryOrderedByChild.

5. Once you've done all this, create a UI that will list each group in a tableview, naming each group the usernames of each (i.e. if jamesrp13 is talking to jonathan, the tableview cell will say "jamesrp13, jonathan")

6. Then create a detailViewController that you will get to by tapping on one of the group chat cells. This should display all of the messages associated with that group.

*/