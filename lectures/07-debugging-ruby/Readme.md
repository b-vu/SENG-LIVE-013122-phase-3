# Debugging in Ruby
## SWBAT
- [ ] Read and understand common error messages
- [ ] Avoid common Ruby programming mishaps
- [ ] Develop an efficient debugging process
- [ ] Utilize `binding.pry`

## The Project 
The Veterinary clinic that hired us has grown and has a bigger budget to put towards their patient data management. Happy with the CLI we built for them, they will like us to create a database and API with GUI that's easy for their vets and vet techs to use. 
- React Front end (week 3)
- Database (SQL)
- ORM (ruby/active record/sinatra(week-3))
>Note: Database vs API
- Database holds data
- API is the interface that is the communicates between the server and client

## Introduction

We'll cover Pry, a type of REPL, and discuss how to install and use it to debug
a program.

## What Is a REPL?

You've already been introduced to REPLs through using IRB (Interactive Ruby).
REPL stands for _Read, Evaluate, Print, Loop_. It is an interactive programming
environment that takes a user's input, evaluates it and returns the result to
the user.

Ruby installs with its own REPL, which is IRB, that you've already been using.
Every time you type `irb` into your terminal, you're entering into a REPL.

## What Is Pry?

Pry is another Ruby REPL with some added functionality. When you enter IRB, you
are entering a brand new interactive environment. Any code you want to play with
in IRB, you have to write in IRB or copy and paste into IRB. Pry, on the other
hand, is like a REPL that you can inject into your program.

Pry is far more flexible than IRB. Once you install the Pry library (via the Pry
gem—we'll walk through installation in a bit), you can use a `binding.pry`
anywhere in your code.

## Wait... What's 'binding'?

Binding is a built-in Ruby class whose objects can encapsulate the context of
your current scope (variables, methods etc.), and retain them for use outside of
that context.

Calling `binding.pry` is essentially 'prying' into the current binding or
context of the code from outside your file.

`binding.pry` gives you similar functionality to using `debugger` in a
JavaScript application, in that it lets you set a **breakpoint** in your code
that will pause the execution of your program at a certain point so you can
inspect the variables, methods, and other context available at a specific place
in your code.

So when you place the line `binding.pry` in your code, that line will get
interpreted at runtime (as your program is executed). When the interpreter hits
that line, your program will actually _freeze_ and your terminal will turn into
a REPL that exists right in the middle of your program, wherever you added the
`binding.pry` line.

## Resources

- [Pry documentation](http://pry.github.io/)
- [Debugging with Pry: A Beginner's Guide](https://dev.to/elimerrell/debugging-with-pry-a-beginners-guide-3p99)
