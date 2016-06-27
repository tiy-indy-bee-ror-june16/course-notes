# The Iron Yard Indianapolis - June 2016 Ruby on Rails Cohort

## Week Zero

### System Setup Day - Sunday, June 12, 2016

- Welcome
	- Go over class policies and schedule
		- Special note on first week combined classes
- Install homebrew
- Install rbenv
- Install ruby
- Install git
- Various and sundry other things

## Week One

### CLI & HTML - Monday, June 13, 2016

- Welcome (again)
- Introduction to the command line
	- Creating a directory to house notes and homework
- HTML with Collin

### HTML & CSS - Tuesday, June 14, 2016

- HTML with Collin
- CSS with Collin

### CSS Positioning - Wednesday, June 15, 2016

- CSS with Collin
	- Floats
	- inline-block
	- flexbox
- Programming note: Chris is out for the morning lecture period

### Bootstrap and HTML/CSS recap - Thursday, June 16, 2016

- Note: Classes split back up at this point.
- Homework review with Chris
- Responsive design
	- Media queries
- Bootstrap
	- A flipped way of thinking
	- Grid system
- Lab prep

## Week Two

### Ruby: Fundamental types - Monday, June 20, 2016

- Lab review
- `pry`
- String
- Integer
	- Maths
- Variables
- Control flow
	- `if/elsif/else/end`
	- `case/when/end`
- Templates and working with HTML
	- `erb`
		- embedded ruby
		- Windows of ruby inside text documents
		- processing erb
	- Files
		- Writing files to disk from Ruby
- Homework: Lorem Ipsum generator in HTML

### Ruby: Blocks, Enumerable, Erb & Files - Tuesday, June 21, 2016

- Homework review
- Methods
	- `def...end`
	- arguments
	- default arguments
	- named arguments
- Challenge: FizzBuzz
- Collections of things
	- Arrays
		- ordering, accessing
	- Hashes
		- ordering, accessing
- Working with collections
	- `each`
	- Blocks
	- `select`
	- `reject`
	- `collect/map`
	- `inject/reduce`
- Homework: HTML reports from collections of things

### Ruby: Objects - Wednesday, June 22, 2016

- Homework review
- Objects
	- Everything is an object
	- Message passing (`send`)
	- Defining your own objects
	- Instance methods
	- Instance variables
	- `attr_reader/attr_writer`
	- `attr_accessor`
	- `initialize`
	- Inheritance
- Homework: Like a Robot

### Ruby: Moar Objects - Thursday, June 23, 2016

- Homework review
- `method_missing`
- `super`
- splat args
- Class methods
	- Singleton methods
- Monkey patching
- CSVs
	- Think of them as arrays of hashes
- Lab: Planet Express Reporting

## Week Three

### Advanced Git - Monday, June 27, 2016

- Homework Review
	- Show & Tell
- Break: 10:15
- Advanced Git (note: combined classes in BEE room)
	- `git revert`
	- `git branch`
	- `git checkout -b <branch_name>`
	- `git pull`
	- `git merge`
		- Merge conflicts?
	- `git log`
	- `git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"`
	- `git diff`
	- `git blame`
- Git Workflow (and contributing to open source)
	- Fork
	- Branch
	- Work
	- Push
	- Pull request
	- merge
	- Pull
- Homework: Git Up

### Intro to Automated Testing - Tuesday, June 28, 2016

- Why we test
- Test-driven development
	- Change to the way we code
- MiniTest
- Challenge: FizzBuzz with tests
- rubocop
	- Ruby _style_
- Homework: Coffee Time

### User input, recursion, mixins and games - Wednesday, June 29, 2016

- Homework review
- Duck typing
	- If it looks like a duck, walks like a duck and quacks like a duck, it's probably a duck
- Recursion
	- recursion
	- recursion
- Loops
	- `while`
	- `until`
- `gets`
- `require` and `require_relative`
	- Working with multiple files
- Homework: War

### Mixins & SOLID - Thursday, June 30, 2016

- Homework review
- Modules
	- What's the difference between a class and a module?
- `include` vs. `extend`
- SOLID
	- S – Single-responsiblity principle
		- A class does one thing only
	- O – Open-closed principle
		- A class should be open to extension but not to modification
	- L – Liskov substitution principle
		- Subclasses should be substitutable
	- I – Interface segregation principle
		- You should require other classes to implement things they do not need
	- D – Dependency Inversion Principle
		- Don't depend directly on low-level, hardcoded interfaces, rely on abstractions instead
- Getting close to SOLID without much thought
	- Make your classes and methods small
		- This is easier to test anyway
	- Lean on readability over cleverness
	- Output is a different function than data preparation
- Lab: Blackjack