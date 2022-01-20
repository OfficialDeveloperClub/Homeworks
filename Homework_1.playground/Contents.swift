// MARK: - Task 1 aka name switcher

var holland: (age: Int, name: String, surname: String?) = (20, "Tom", "Holland")

var parker: (age: Int, name: String, surname: String?) = (23, "Peter", nil)

swap(&holland.name, &parker.name)

print("\(holland.name) \(holland.surname ?? "[no surname]") is \(holland.age) y.o.")

print("\(parker.name) \(parker.surname ?? "[no surname]") is \(parker.age) y.o.")

// MARK: - Task 2 aka tricky xor

let number: Int = 123
for i in 0 ... 1000 {
    if i ^ number == 0 {
        print(i)
    }
}

// MARK: - Task 3 aka operators game

infix operator •••
func •••(lhs: String, rhs: Int) -> String {
    String(repeating: lhs, count: rhs)
}

"ha" ••• 3

prefix operator ®
prefix func ®(string: String) -> String {
    "􀣺\(string)􀣺"
}

®"apple"
