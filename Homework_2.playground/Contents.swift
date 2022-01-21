// MARK: - Task 1 aka myPow()

func myPow(_ a: Int, exp p: Int) -> Double? {
    // according to the math society agreement
    if p == 0 {
        return 1
    }
    if p < 0 && a == 0 {
        return nil
    }
    var multiplier = Double(a)
    if p < 0 {
        multiplier = 1 / multiplier
    }
    var exponent = abs(p)
    var result = 1.0
    
    while exponent > 0 {
        if (exponent & 1 != 0) {
            result *= multiplier;
        }
        multiplier *= multiplier;
        exponent >>= 1;
    }
    return result;
}

myPow(0, exp: 0)        // 1
myPow(1, exp: 1000)     // 1
myPow(-1, exp: 1000)    // 1
myPow(-1, exp: 1001)    // -1
myPow(2, exp: 5)        // 32
myPow(2, exp: -5)       // 0.03125
myPow(-2, exp: -5)      // -0.03125

// MARK: - Task 2 aka casino

let blackjack = {
    Int.random(in: 15 ... 25)
}

let roulette = {
    (Bool.random() ? "Red" : "Black", Int.random(in: 1 ... 20))
}

var count = 1

while blackjack() != 21 || roulette() != ("Red", 13) {
    count += 1
}

// MARK: - Task 3 aka primes count

func primesCount(from: Int, to: Int) -> Int {
    var count = 0
    for number in from ... to {
        if number % 2 == 0 && number != 2 {
            continue
        }
        var divisor = 3
        while divisor * divisor <= number {
            if number % divisor == 0 {
                break
            }
            divisor += 2
        }
        if divisor * divisor > number {
            count += 1
        }
    }
    return count
}

import Foundation

let startNaive = Double(DispatchTime.now().uptimeNanoseconds)
primesCount(from: 2, to: 100000)
let diffNaive = (Double(DispatchTime.now().uptimeNanoseconds) - startNaive) / 1e6
print("Naive solution took \(diffNaive) ms")
// Naive solution took 3754.766916 ms


// Note: this algorithm is too slow to count the number of primes from 2 to 1e9+7.
// Time complexity is O(n sqrt(n)) - more than 10^13 operations (31 622 776 601 683 to be clear) - that could took your computer up to 316 227 seconds - that is about 3,66 days.

// So, for whose who are interested, welcome to nice and optimized solution
// MARK: - Task 3 aka WTF?!
// And yes, WTF was about this solution

func sieveOfEratosthenes(from: Int, to n: Int) -> Int {
    var isprime = [Bool](repeating: true, count: n + 1)
    let root = Int(sqrt(Double(n))) + 1
    for i in 2 ... root {
        if isprime[i] {
            for k in stride(from: n / i, through: i, by: -1) {
                if isprime[k] {
                    isprime[i*k] = false
                }
            }
        }
    }
    var count = 0
    isprime.enumerated().forEach {
        count += $0.offset >= from && $0.element ? 1 : 0
    }
    return count
}

let startSmart = Double(DispatchTime.now().uptimeNanoseconds)
sieveOfEratosthenes(from: 2, to: 100000)
let diffSmart = (Double(DispatchTime.now().uptimeNanoseconds) - startSmart) / 1e6
print("Smart solution took \(diffSmart) ms")
// from 2 to 100000: Smart solution took 655.375541 ms
