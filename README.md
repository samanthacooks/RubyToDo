# Command Line Todo List

## Summary
We're going to build a todo list application.  We're going to build our application feature-by-feature.  We'll start by displaying a list of items and proceed step-by-step until we've added all the required functionality. When our application is complete, a user will be able to display items, add items, remove items, and mark items as complete.

As we build our application, our design should follow object-oriented principles.  Think through each decision, keeping the [single responsibility principle](http://en.wikipedia.org/wiki/Single_responsibility_principle), [separation of concerns](http://en.wikipedia.org/wiki/Separation_of_concerns), and other design principles in mind.

As we work through each release, pay close attention to how *change* impacts our application.  When a new feature is added, how many files do we have to change?  How frustrating is it to make each change?  Did our previous design decisions make the application easier or more difficult to modify?


##Releases

###Release 0 : Enumerate the responsibilities

Start by enumerating the responsibilities of your TODO application.  These aren't just the user-facing commands like "add", "delete", etc.  They're also back-end responsibilities like reading and writing from the `todo_list_data.csv` file, parsing command-line arguments, and printing the "interface" to the console.

Each responsibility should map to a concrete unit of Ruby code.  For example,

Responsibility                                                                     | Code World
-----------------------------------------------------------------------------------|------------------------------------
Initialize an empty TODO list                                                      | `list = List.new`
Add a task to a TODO list                                                          | `list.add(Task.new("walk the dog"))`
Get all the tasks on a TODO list                                                   | ` tasks = list.tasks`
Delete a particular task from a TODO list                                          | `???`
Complete a particular task on a TODO list                                          | `???`
Parse the command-line arguments and take the appropriate action                   | `???`
Parse the `todo_list_data.csv` file and wrap each entry in easier-to-manipulate Ruby objects | `???`


There are other responsibilities.  What are they?

###Release 1 : Translate to Code

Once you have a solid list of responsibilities you can start translating each into code.  Be sure to write comprehensive tests.

####Implement the list command

When you run

```text
$ ruby todo_list_runner.rb list
```

your application should print out a list of all the TODOs. For example:

```text
$ ruby todo_list_runner.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out
3. Conquer the world
```

You'll have to design and build basic controller and model code to make this work.  For example, how does your program know the user wants to "add" a task to their list?

#### Implement the add command

Requirements:

- A user can add (append) a task to their TODO list

It should work like this

```text
$ ruby todo_list_runner.rb add Walk the dog
Appended "Walk the dog" to your TODO list...
$
```

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
