import UIKit

class WaitForIt2 {
    
    // Test Cases:
    var shortInput: String {
        let input: String =
        """
        Time:      7  15   30
        Distance:  9  40  200
        """
        return input
    }
    var longInput: String {
        let input: String =
        """
        Time:        51     92     68     90
        Distance:   222   2031   1126   1225
        """
        return input
    }
    
    func amountOfRecords(input: String) -> Int {
        var count: Int = 0
        //
        
        var inputStrings: [String] = input.components(separatedBy: "\n")
        
        var time: Int = 0
        var distance: Int = 0
         
        var numberString: String = ""
        // Time:
        for (charInd, char) in inputStrings[0].enumerated() {
            
            guard charInd != inputStrings[0].count - 1
            else {
                numberString = numberString + String(char)
                time = Int(numberString) ?? 0
                numberString = ""
                continue
            }
            
            if char.isNumber {
                numberString = numberString + String(char)
                continue
            }
        }
        
        
        
        // Distance:
        for (charInd, char) in inputStrings[1].enumerated() {
            
            guard charInd != inputStrings[1].count - 1
            else {
                numberString = numberString + String(char)
                distance = Int(numberString) ?? 0
                numberString = ""
                continue
            }
            
            if char.isNumber {
                numberString = numberString + String(char)
                continue
            }
        }
        
        print(distance)
        
        // Ready to count:
        
        var firstWin: Int = 1
        var lastWin: Int = 1
        
        // from the begining
        for miliseconds in 1...time {
            let speed = miliseconds * 1
            let restTime = time - miliseconds
            let myDistance = restTime * speed
            if myDistance > distance {
                firstWin = miliseconds
                break
            } else {
                continue
            }
        }
        // from the ending
        
        for miliseconds in (1...time).reversed() {
            let speed = miliseconds * 1
            let restTime = time - miliseconds
            let myDistance = restTime * speed
            if myDistance > distance {
                lastWin = miliseconds
                break
            } else {
                continue
            }
        }
        
        // product
        count = lastWin - firstWin + 1
        
        //
        return count
    }
}

//WaitForIt2().amountOfRecords(input: WaitForIt2().shortInput)
WaitForIt2().amountOfRecords(input: WaitForIt2().longInput)

