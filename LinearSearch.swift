import Foundation

/**
 * Utility for array generation and linear search operations.
 *
 * Created by: Shem
 * Created on: Oct, 27, 2026
 * Generates an array of 10 random integers (0 to 100), sorts them,
 * displays them, and performs a linear search based on user input.
 * Continues looping until the user enters 'q' to quit.
 */

/** Max bound for random number generation (exclusive). */
private let maxBound = 101

/** Array size constant. */
private let arraySize = 10

/**
 *Created by: Shem
 * Created on: Oct, 27, 2026
 * Generates an array of 10 random integers (0 to 100), sorts them with
 * Arrays.sort(), displays them, and performs a linear search based on user
 * input. Continues looping until the user enters 'q' to quit.
 */
func linearSearch(_ numbers: [Int], target: Int) -> Int {
    for (index, number) in numbers.enumerated() {
        if number == target {
            return index
        }
    }
    return -1
}

/**
 * Generates and returns an array of 10 random integers from 0 to 100.
 *
 * - Returns: An array of 10 random integers.
 */
func populateArray() -> [Int] {
    (0..<arraySize).map { _ in Int.random(in: 0..<maxBound) }
}

/**
 * Main entry point of the program.
 */
print("What number are you searching for in the list below? Enter \"q\" to quit.")

while true {
    let numbers = populateArray().sorted()
    print("\(numbers.map(String.init).joined(separator: " "))   Number: ", terminator: "")

    guard let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
        break
    }

    if input.lowercased() == "q" {
        print("Thank you for playing!")
        break
    }

    if let target = Int(input) {
        let index = linearSearch(numbers, target: target)

        if index != -1 {
            print("The number \(target) is found at index \(index).")
        } else {
            print("The number \(target) is not found in the list of numbers.")
        }
    } else {
        print("Invalid input! Please enter a valid integer or 'q' to quit.")
    }
}