# Command Line Todo List

## Summary
We're going to build a todo list application.  We're going to build our application feature-by-feature.  We'll start by displaying a list of items and proceed step-by-step until we've added all the required functionality. When our application is complete, a user will be able to display items, add items, remove items, and mark items as complete.

As we build our application, our design should follow object-oriented principles.  Think through each decision, keeping the [single responsibility principle][wikipedia srp], [separation of concerns][wikipedia soc], and other design principles in mind.

As we work through each release, pay close attention to how *change* impacts our application.  When a new feature is added, how many files do we have to change?  How frustrating is it to make each change?  Did our previous design decisions make the application easier or more difficult to modify?


## Releases
### Release 0: Display Todo List Items
We have a CSV file that contains descriptions of some todo list items (see `todo_list_data.csv`).  We want to begin our application by displaying a list of items (see Figure 1).

```
$ ruby todo_list_runner.rb
1.  Walk the cat.
2.  Go to the gym.
3.  Buy groceries for the week.
4.  Call Penelope.
```
*Figure 1*.  Example of displaying a todo list.


Before writing any code, think through the process necessary to display the list.  What do we need to do?  For example, we need to read the contents of the data file, represent the todo list in Ruby, represent each list item in Ruby, format the list for display, etc.  What other responsibilities are there?

Once we've identified the responsibilities of our application, then determine what objects we need to fulfill those responsibilities—remembering to apply object-oriented design principles.  Then test and develop those objects and complete the release.


### Release 1: Add New Items to the List
Add a new feature to the application:  users should be able to add new items to the list.  When running the application, users will now need to specify what they want to do; users will pass command line arguments to  display the todo list or add a new item (See Figure 2).

In adding this feature, our application will have additional responsibilities.  We'll need to parse command line arguments and write to a file.  Anything else?  What object should be responsible for these new responsibilities?  Would it be appropriate for our existing objects to handle them?  Do we need new objects?

```
$ ruby todo_list_runner.rb list
1.  Walk the cat.
2.  Go to the gym.

$ ruby todo_list_runner.rb add "Finish code challenge."
Appended "Finish code challenge." to the list.

$ ruby todo_list_runner.rb list
1.  Walk the cat.
2.  Go to the gym.
3.  Finish code challenge.
```
*Figure 2*.  Use command line arguments to display a todo list or add a new item. 




#### Implement the delete command

Requirements:

- A user can delete a specific task from their TODO list

It should work like this

```text
$ ruby todo_list_runner.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out
3. Conquer the world

$ ruby todo_list_runner.rb delete 3
Deleted "Conquer the world" from your TODO list...

$ ruby todo_list_runner.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out

$
```

#### Implement completeness

Requirements:

- A user can complete a specific task from their TODO list
- A completed TODO task will be identified as such when a user uses the `list` command

**Note**: This will require changing the format of `todo_list_data.csv` and the code that parses it.

###Release 2 : Human Readable File

Here's the deal:  Google just LOVES your new command line todo app.  And they're ready to buy you out for millions if only you can change the CSV file to a human readable file, so that it can be printed out easily.  They also want the app to be able to handle commas in the task description - something a CSV file doesn't accommodate very easily.

Here's the way the file should be saved:

```text
1. [ ]  Bake a delicious blueberry-glazed cheesecake
2. [X]  Write up that memo and fax it out
3. [ ]  Conquer the world
```

*(the brackets indicate whether the task has been completed or not)*

What factors do you need to take into account to save this data correctly?  How does this change the parsing (besides not being able to use the CSV class)?

Update your app to accommodate this new feature!


[wikipedia soc]: http://en.wikipedia.org/wiki/Separation_of_concerns
[wikipedia srp]: http://en.wikipedia.org/wiki/Single_responsibility_principle


