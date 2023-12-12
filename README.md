# chemSolver
A program in MIPS32 assembly to balance an unbalanced (but balance-able) chemical reaction.

This is a program created for the final project of CMPEN 351: Microprocessors at Penn State - World Campus in the summer of 2023. Overall I had a lot of fun with this project, and although it's still kind of buggy I'm pleased with how it turned out. The framework being used here is the basis for the [MathHelper](https://www.github.com/MichaelShires/MathHelper) project.

I think one major lesson this project taught me was that to make a computer do something, you have to know *exactly* how to do it. I spent quite a bit of time trying to figure out how to break down this problem, and I realized I had set up a fairly daunting task - to accomplish this I had to create a library to manage, reduce and solve a system of linear equations of unknown size. But once the steps started to come together, it was really gratifying to watch the project come together.

## Major Steps

1. First, it determines the number of reactants and products, and creates an array of the appropriate size for both.
2. Then, it queries the user for each reactant and product, parsing them for valid chemical symbols.
3. From there it determines the number of unique elements in the reaction, and creates an array modeling a system of linear equations for each unique element.
4. It reduces this array to reduced echelon form.
5. Then co-efficients are assigned back to each term from the original formula, and the balanced reaction is displayed to the user.

Overall I was pleased with how it turned out. I ended up runnign out of time and wasn't able to make it was bug-free as I'd like, pretty much anything wrong would crash it (an unbalanceable equation, typos, non-chemicals, parantheses, an under-defined or over-defined system is inputted, etc.,) however all these issues were identified and I decided it would be more worth my time to fix these when I actually ported it over to C/C++ to make a more robust project, which is going on right now.

Anyways that's pretty much it, feel free to look around or just use it as a reference if you ever find yourself writing in MIPS32, I'd like to think it's mostly commented well. This project is also where I shifted from tabs to spaces so it's an important point in my software maturation.
