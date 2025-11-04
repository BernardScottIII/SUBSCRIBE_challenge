# Submission
This is my submission for the challenge problem. I used Ruby to complete this challenge. I successfully completed it within the provided time frame.

## Run Instructions
1. Download the files [from the repository](https://github.com/BernardScottIII/SUBSCRIBE_challenge), or at https://github.com/BernardScottIII/SUBSCRIBE_challenge.

2. Ensure Ruby version 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin24] is installed.

3. Once downloaded, ensure that `index.rb`, `basket.rb`, and `item.rb` are all located in the same directory.
```
    directory
    ├──index.rb
    ├──basket.rb
    └──item.rb
```

4. Create input files in a `.txt` format.
- Each file should have a unique name. 
- Every item in a given file needs to be in the format "(quantity) (name) at (price per unit)", where (quantity) is the count of a specific item, (name) is the name of that item, and (price per unit) is the price of one item.
- Every item in a given file should be on its own line.
- Each file should have a trailing newline character.

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

```

4. Pipe the desired input file into the `index.rb` program using the `<` operator.
```bash
# Example:
ruby index.rb < input1.txt
```

## Discussion
This was a fun exercise which introduced me to the basics of programming in Ruby. I spent most of the challenge time learning about the various apects of the Ruby programming language, from the language's syntax and style guide to it's object-oriented core. 

To embrace the object-oriented nature of Ruby, I decided to create two objects for this solution, `Item` and `Basket`. An `Item` represents a single entry in the provided input file, and records the quantity, name, and price per unit of that entry. Multiple `Item`s are collected together into a single shopping `Basket`. When an item is added to a `Basket` using the `add()` function, the sales taxes and total cost amounts are updated upon each addition. The `Basket` class provides `print_recipt()`, a function to retrieve the subtotal for each item, as well as the applied taxes for the entire `Basket`. 

I decided to store the variables corresponding to sales tax and import duty in the `Basket`. This was motivated by the fact that the taxes applied to each  item are different, and it would not be sensible for each item to know every single tax/duty in existence.

One minor choice I made was to name the main entry point `index.rb`. I made this decision because I know that Ruby is frequently used to build web applications, and the main entry point for most of them is named `index`.

While functionality was prioritized over documentation, I still gave an effort to document the classes I created.

## Assumptions
- All data provided to the program is in the format: (quantity) (name) at (price per unit). Additionally, that all fields are always in the same order and separated by spaces.
- UNIX (macOS) newline characters are used in the sample input files.
- All books are referred to as "book". That is, a title of a book would not be exempt from sales tax.
- All food items contain the string "chocolate". That is, an item with the name of "Pretzel" would not be exempt from sales tax.
- All medical products contain the string "headache pills". That is, an item with the name of "Bandage" would not be exempt from sales tax.
- All imported goods contain the string "imported". The string "imported" may appear at any point within the item name.
- The `Item` class assumes that the provided initialization parameters are the correct data type (integer, string, float).

## Future Improvements
One opprotunity for improvement of this program is to make the exemption process more reusable by creating an `Exemption` object. Within that object, I could programatically apply exemptions, instead of relying on hard-coded comparisions.