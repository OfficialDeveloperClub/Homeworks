// MARK: - Task #1 aka School

let names: Set<String> = ["Tom", "Peter", "Tony", "Stephen", "Steve"]
let surnames: Set<String> = ["Holland", "Parker", "Stark", "Strange", "Rogers"]

struct Student {
    let name: String = names.randomElement()!
    let surname: String = surnames.randomElement()!
    
    func info() -> String {
        "\tStudent: \(name) \(surname)\n"
    }
}

class Class {
    let grade = Int.random(in: 1 ... 11)
    let count = Int.random(in: 3 ... 5)
    var students: [Student]
    
    init() {
        students = []
        for _ in 0 ..< count {
            students.append(Student())
        }
    }
    
    func info() -> String {
        students.reduce("\t\(grade) grade. Total - \(count) students:\n", { partialResult, student in
            partialResult + "\t" + student.info()
        }) + "\n"
    }
}

class School {
    let count = Int.random(in: 1 ... 5)
    let name: String
    var classes: [Class]
    
    init(_ name: String) {
        self.name = name
        classes = []
        for _ in 0 ..< count {
            classes.append(Class())
        }
    }
    
    func info() -> String {
        classes.reduce("School \(name) has total \(count) classes:\n", { partialResult, grade in
            partialResult + grade.info()
        })
    }
}

let school = School("Liceum #82")
print(school.info())

// MARK: - Task #2 aka Fraction

enum Sign: Int {
    case positive = 1
    case negative = -1
}

class Fraction: CustomStringConvertible {
    var numerator, denominator: UInt
    var whole_part: UInt
    var sign: Sign
    
    init(whole: UInt, _ numerator: UInt, by denominator: UInt, sign: Sign = .positive) {
        self.whole_part = whole
        self.numerator = numerator
        self.denominator = denominator
        self.sign = sign
    }
    
    func normalize() {
        func gcd(_ a: UInt, _ b: UInt) -> UInt {
            if a == 0 && b == 0 {
                return 1
            }
            if b == 0 {
                return a
            }
            return gcd(b, a % b)
        }
        
        numerator += whole_part * denominator
        let divisor = gcd(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        
        whole_part = numerator / denominator
        numerator %= denominator
    }
    
    var description: String {
        "\(sign == .positive ? "" : "-")(\(whole_part)+\(numerator)/\(denominator))"
    }
}

let frac = Fraction(whole: 1, 4, by: 3, sign: .negative)
frac.normalize()
print(frac)
