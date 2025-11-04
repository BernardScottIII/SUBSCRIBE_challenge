# Submission
Here is my submission.

## Run Instructions
1. Download the files [on my GitHub page](https://github.com/BernardScottIII), or at https://github.com/BernardScottIII.

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
Since the problem statement explicitly asks me to print out the receipt details, they are printed to the console.
I took some time to explore Ruby and play around with the various features of the language.
Why did I name the primary file `index.rb`? Because I know Ruby is frequently used for web development, and the main entry point for most websites is named index.
Since everything in Ruby is an object, let's make everything in this project an object!
I put the basic sales tax and import duty in the basket class because if either of those changed, they wouldn't necessarily impact the items themselves. It would only impact your total at checkout (the total price of the basket).
I tried my best at documenting my Ruby code.

## Assumptions
- All data provided to the program is in the format: (quantity) (name) at (price per unit). Additionally, that all fields are always in the same order and separated by spaces.
- UNIX (macOS) newline characters are used in the sample input files.
- All books are referred to as "book". That is, a title of a book would not be exempt from sales tax.
- All food items contain the string "chocolate". That is, an item with the name of "Pretzel" would not be exempt from sales tax.
- All medical products contain the string "headache pills". That is, an item with the name of "Bandage" would not be exempt from sales tax.
- All imported goods contain the string "imported". The string "imported" may appear at any point within the item name.

## Resources Consulted
I learned quite a bit about Ruby in the four hours. And here are the places I learned everything from.
- Fireship.io