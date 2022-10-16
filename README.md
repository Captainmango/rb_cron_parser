# RbCronParser

This repo is learning project designed to help Rubyists learn TDD. In this project, you'll implement a cron expression parser program that uses the standard syntax. You will not have to implement special rules like '@yearly' The parser will have the following usage:

```bash
$ ruby main.rb */15 3 5 1-12 * /usr/local/bin/program
```
To break down the command arguments:
- argument 1 is the minutes
- argument 2 is the hour
- argument 3 is the day of the month the cron job will run
- argument 4 is the month
- argument 5 is the day of the week the cron job will run
- argument 6 is the filepath to the script or file to be executed

The program will print to STDOUT a table that should look something like this (don't worry if the formatting isn't perfect, as long as each interval is on a new line that's a pass):

```bash
minute        0,15,30,45
hour          3
day_of_month  5
month         1,2,3,4,5,6,7,8,9,10,11,12
day_of_week   1,2,3,4,5,6,7
file          /usr/local/bin/program
```

### What is a cron expression?
Crons are a command-line utility available on Unix-like operating systems. Users who set up and maintain software environments use cron expressions to schedule tasks (commands or scripts), also known as cron jobs, to run periodically at fixed times, dates, or intervals. It typically automates system maintenance or administration, although its general purpose nature makes it useful for things like downloading files from the Internet or archiving emails at regular intervals.

Cron jobs are most suitable for scheduled, repetitive tasks that require no user input.

## Goal
The goal of this project is to become more comfortable with following correct TDD practises by working with the following workflow:

![image](https://miro.medium.com/max/1024/1*749GtQGqamkOqfOe40o_Tg.png)

### Red 
At this stage, we want to create a test that is failing. We should think about the flow we want our progam to have and how we expect things to work. There is a common misconception that any test you write cannot change. This is wrong and does not reflect the reality that programmers face when working on real code. But, the test should be written first and contain your best guess at the functionality you are trying to implement.

### Green
At this stage, the code works. Your test is passing and all looks good. Many programmers stop here. This is wrong. The code at this point may work fine and be performant. But, Ruby has many tools that can make code much more idiomatic and simple. We should move onto the next stage once things are working to make things better...

### Refactor
At this stage, we look at the code and the functionality we have implemented and do our best to understand if there is a better way to approach it. Is the implementation we've come up with perfect? (*spoiler* probably not)

We should understand the exact flow we are following in our code and look to ensure that it is clear and concise. A common misconception here is that you cannot change the test, again, this is wrong. If while we are refactoring we come across a need to change direction, we should. We can even add more tests! Which... puts us right back in **Red** to start the workflow again.

## Setup
Running bundle install will install all the gems needed to complete the project
```bash
$ bundle install
```
We can run the tests with
```bash
$ rake test
```
We can check linting with
```bash
$ rake rubocop
```
We can run the project with
```bash
$ ruby main.rb [ARGUMENTS HERE]
```
If you'd like to debug something, Pry is installed already. Please insert `binding.pry` where you would like to set a breakpoint and run the project or a test to halt there.

## Tasks
The test dir structure matches what is in the lib dir for ease of use. When adding or editing tests, please add these to the respective files.

### Add tests for the Cron class

The Cron class is designed to take in the input from the terminal and make it simple for us to pass to our working code. It currently works fine, but the fact it is a Struct means we have a bigger public interface than is really needed. We should pin down the functionality we actually need in tests, then refactor the class so we know *exactly* what methods Cron has.
- Write tests to confirm we have the ability to read the properties: 
    - minute
    - hour
    - day_of_month
    - month
    - day_of_week
    - file

- Write a test to confirm we can pass an array into the constructor
    - The constructor should take each item from the array and assign to each of the variables in the following order:
        - minute
        - hour
        - day_of_month
        - month
        - day_of_week
        - file

- Refactor Cron so that only the functionality we have tests for is present
    - Add a constructor (initialize)
    - Add getters for all of the properties

### Implement Formatter#format
The Formatter module is what is going to handle printing out the parsed cron expression. It's going to take in a hash and print out the key value pairs on new lines. As such, we should make sure our hash has the correct keys before we try to print things out.

Because we have a class for our Cron Expression, that we intend to convert into a hash, that *will* ensure the respective properties always exist, there shouldn't be a problem. But, what if somehow something else we don't expect is passed to format? That would be a pretty bad bug. Tests don't prove that bugs aren't there, actually quite the opposite. We should test that if we try to format something we don't want that our program errors out

- Write tests for the formatter
    - It should accept a hash and print each key and value pair on a new line
    - It should raise an ArgumentError if anything other than a hash is given
- Implement the Formatter#format functionality
- Refactor Formatter#format
    - Is what you've got the easiest to read?
        - What could make it simpler, is there a method that simply returns the keys and their related values? (Formatting isn't a major concern)


