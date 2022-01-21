# 📚 Homework

## Task 1 aka myPow()

Create a function `myPow(_ , _)`, that will be identical to system function `pow()` - see docs [here](https://developer.apple.com/documentation/foundation/1779833-pow).

Your function should take 2 whole numbers $a$ and $p$ and return the number $a^p$.

You need to check that this exponent does not ruin math) If so, just return `nil`.

## Task 2 aka casino

Create a ~~absolutele legal~~ casino-simulator)

You need two closures:

1. First gives you the result of the [blackjack](https://en.wikipedia.org/wiki/Blackjack) game - random number from 15 to 25.
2. Second - result for [roulette](https://en.wikipedia.org/wiki/Roulette) - tuple of string (”Red” or “Black”) and number from 1 to 20.

Create a function `casino()`.

Your task it to count how many times you need to play to win both the blackjack and roulette at the same time.

P.S. 

1. You win blackjack if you score exactly **21** points.
2. You win roulette if you get **13 red**.

## Task 3 aka WTF?!🤯

[Prime number](https://en.wikipedia.org/wiki/Prime_number) - is such a number that has exactly two different positive divisors - they are 1 and that number.

Peter really likes prime numbers. He actually bought a book with a hu-u-uge list of primes.

Unfortunately, delivery service “Pochta Ameriki” was not careful enough and lost a few pages of the Peter’s book.

Peter was absolutely angry but he wants to know how many pages did the service lose.

Help Peter.

Find the number of primes in that list, if the numbers in that book were from $2$ to $1000000007$.

P.S.

Prime number sequence starts in that way: $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41 ...$