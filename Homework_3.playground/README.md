# 📚 Homework

## Task 1 aka School

That is simple, but long task)

You need to create class `School`. In school there are some classes (there sturents learn). In every `Class` there are some students. Every `Student` (that should be a **structure**) have name and surname.

Create one instance of `School` class and print it as beautiful as you can.

P.S.

Create set of possible names and surnames.

Use random to get random name and surname.

While printing school `info` (that is method in `School` class) try to separate classes.

## Task 2 aka  Fraction

Create a class `Fraction`.

It should have properties `numerator`, `denominator`, `whole_part` and `sign` (only two options: -1 or 1, so it can be done as `enum` with raw values -1 and 1).

Note, that numerator and denominator should be nonnegative whole numbers (think about correct data type🙃).

The value of fraction can be computed in that way:

$$
value=
\mathrm{sign}\cdot
\left(
\mathrm{whole\_part}+\frac{\mathrm{numerator}}{\mathrm{denominator}}
\right)
$$

Add method `normalize()`. It should normalize your fraction. Look for examples:

$$
-\frac{22}7=-\frac{7\cdot3+1}7=-3\frac17\\
1\frac{4}3=1+\frac{4}3=1+\frac{4}3=\frac{3+4}3=\frac{7}3=2\frac13\\
\frac{25}{15}=\frac{5\cdot5}{5\cdot3}=\frac53=1\frac23
$$
