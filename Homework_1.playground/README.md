# 📚 Homework

## Task 1 aka name switcher

1. Check out more about tuples [here](https://www.tutorialspoint.com/swift/swift_tuples.htm).
2. Create 2 objects of tuple type for person - with age, name and surname properties. Surname should be optional - not everyone has it.
3. Swap names for this two people. E.g. it was Peter Parker and Tom Holland and became Tom Parker and Peter Holland.
4. Print age, name and surname for every person. If he/she does not have surname - print `“no surname found”`.
    
    Show how you can unwrap optionals)
    

## Task 2 aka tricky xor

1. You have a number in variable:
    
    ```swift
    let number: Int = 123
    ```
    
    Create a loop (`for i in 0 ... 1000 {}`) and find all the numbers that will have XOR with number equals to 0.
    
    So, you need to print all `i`,  that `i ^ number == 0`.
    

## Task 3 aka operators game

1. Create your custom infix operator `•••`. It should take 2 arguments - `String` and `Int`.
2. Your operator returns given string, repeated given number of times.
    
    ```swift
    "ha" ••• 3 = "hahaha"
    ```
    
3. Create prefix operator ``. It should take string and return that string, embedded in apple-logo symbols.
    
    ```swift
    "apple" = "apple"
    ```
