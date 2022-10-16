# RbCronParser

This repo is learning project designed to help Rubyists learn TDD. In this project, you'll implement a cron expression parser program that uses the standard syntax. You will not have to implement special rules like '@yearly' The parser will have the following usage:

```bash
ruby main.rb */15 3 5 1-12 * /usr/local/bin/program
```
To break down the command arguments:
- argument 1 is the minutes
- argument 2 is the hour
- argument 3 is the day of the month the cron job will run
- argument 4 is the month
- argument 5 is the day of the week the cron job will run
- argument 6 is the filepath to the script or file to be executed

The program will print to STDOUT a table that should look something like this:

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
At this stage, the code works. Your test is passing and all looks good. Many programmers stop here. This is wrong. The code at this point may work fine and be performant. But, Ruby has many tools that can make code much more idiomatic and simple. We should move onto the next stage once things are working...

### Refactor
At this stage, we look at the code and the functionality we have implemented and do our best to understand if there is a better way to approach it. Is the implementation we've come up with perfect? (*spoiler* probably not)

We should understand the exact flow we are following in our code and look to ensure that it is clear and concise. A common misconception here is that you cannot change the test, again, this is wrong. If while we are refactoring we come across a need to change direction, we should. We can even add more tests! Which... puts us right back in **Red** to start the workflow again.




## Setup

## Tasks


