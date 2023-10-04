import Foundation
// 1. შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.

func calculateFactorial(number: Int) -> Int {
    if number == 0 {
        return 1
    }
    var finalResult = 1
    for i in 1...number {
        finalResult *= i
    }
    return finalResult
}

print("Task1: The factorial of given number is:", calculateFactorial(number: 8))
print("")

// 2. შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.

func calculateFibonacciSequence(firstNumber: Int = 0, secondNumber: Int = 1, numberOfMembers: Int = 20) -> Array<Int> {
    var resultArray: [Int] = []
    
    resultArray.append(firstNumber)
    resultArray.append(secondNumber)
    
    for i in 2..<numberOfMembers {
        resultArray.append(resultArray[i - 1] + resultArray[i - 2])
    }
    return resultArray
}

print("Task 2: Fibonacci Sequence of these numbers is: \(calculateFibonacciSequence(firstNumber: 3, secondNumber: 5, numberOfMembers: 10))") // როგორც გავიგე ფიბონაჩის რიცხვები მხოლოდ 0-ით და 1-ით იწყება, მაგრამ მაინც დავტოვე ნებისმიერი რიცხვის შეყვანის ვარიანტი
print("Task 2: Fibonacci Sequence by default is: \(calculateFibonacciSequence())")
print("")

// 3. შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.

func palindromeChecker(wordToCheck: String) -> Bool {
    let word1Characters = Array(wordToCheck.lowercased())
    var leftIndex = 0
    var rightIndex = word1Characters.count - 1
    
    while leftIndex < rightIndex {
        if word1Characters[leftIndex] != word1Characters[rightIndex] {
            print("Task 3: Word '\(wordToCheck)' is not a palindrome")
            return false
        }
        leftIndex += 1
        rightIndex -= 1
    }
    print("Task 3: Word '\(wordToCheck)' is a palindrome")
    return true
}

palindromeChecker(wordToCheck: "Racecar")
palindromeChecker(wordToCheck: "Rider")
print("")

// 4. შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

// Method1
func squareCalculator(arrayOfNumbers: Array<Int>) {
    var resultArray: [Int] = []
    var squaredNumber = 0
    
    for number in arrayOfNumbers {
        squaredNumber = number * number
        resultArray.append(squaredNumber)
    }
    return print("Task 4: The squares of given numbers are: \(resultArray)")
}

squareCalculator(arrayOfNumbers: [23, 12, 36, 43, 52, 98])

// Method2
var numbersArray = [23, 12, 36, 43, 52, 98]

let squareCalculator2 = numbersArray.map { $0 * $0 }

print("Task 4: The squares of given numbers are:", squareCalculator2)
print("")

// 5. შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]

func wordCounter(inputString: String) -> [String: Int] {
    let lowercasedString = inputString.lowercased()
    let words = lowercasedString.split { !$0.isLetter }.map { String($0) }
    var resultDictionary = [String: Int]()
    
    for word in words {
        if resultDictionary.keys.contains(word) {
            resultDictionary[word]! += 1
        } else {
            resultDictionary[word] = 1
        }
    }
    return resultDictionary
}

print("Task 5: Words used in this string are: \(wordCounter(inputString: "TBC x USAID, tbc it academy, we are in TBC academy."))")
print("")

// 6. შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.

let convertToBinary = { (number: Int) in
    var binaryString = String(number, radix: 2)
    print("Task 6: Number '\(number)' converted to binary is: \(binaryString)")
}

convertToBinary(111)
print("")

// 7. შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.

let arrayFilter = { (arrayOfNumbers: [Int]) in
    var resultArray = arrayOfNumbers
    resultArray.removeAll() { !$0.isMultiple(of: 2) }
    print("Task 7: The filtered array is: \(resultArray)")
}

arrayFilter([3, 24, 37, 455, 834, 3958, 3786587, 232, 4387498])
print("")

// 8. შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.

var arrayOfIntegers = [8, 234, 869, 453, 574575, 76, 9283798, 34]

let multiplier = arrayOfIntegers.map { arrayOfIntegers -> Int in
    return arrayOfIntegers * 10
}

print("Task 8: The numbers multiplied by 10 are: ", multiplier)
print("")

// 9. გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
let sumCalculatorClosure = { (numbers: [Double]) in
    numbers.reduce(0) { $0 + $1 }
}

func calculateSum(numbers: [Double], closure: @escaping ([Double]) -> (Double)) {
    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
        print("Task 9 result --- Sum of the numbers in array is: \(closure(numbers))")
    }
    print("Task 9: 🔴 Wait for 3 seconds!!!")
}

calculateSum(numbers: [1.4, 2.78, 86.5, 98.1, 5, 0.001], closure: sumCalculatorClosure)
print("")

// 10. function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
func onlyOddNumbersWillSurvive(randomArray: [String]) {
    var onlyNumbers = randomArray.compactMap { Int($0) }.filter { ($0 % 2) != 0 }
    print("Task 10: Odd numbers in this array are: \(onlyNumbers)")
}

onlyOddNumbersWillSurvive(randomArray: ["Banana", "!", "2", "3", "Apple", "<", "985", "22"])
print("")
