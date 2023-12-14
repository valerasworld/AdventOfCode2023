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
                
        // Ready to count:
        
        var firstWin: Int = 1
        var lastWin: Int = 1

        let range = 1...time
        var left = range.lowerBound
        var right = range.upperBound
        
        while left <= right {
            let mid = left + (right - left) / 2
            let nextToMid = mid + 1
            let speed = mid * 1
            let failRestTime = time - mid
            let winRestTime = time - nextToMid
            let failDistance = failRestTime * speed
            let winDistance = winRestTime * (speed + 1)
            
            
            if failDistance <= distance {
                if distance < winDistance {
                    firstWin = mid + 1 // !
                    left = range.lowerBound
                    right = range.upperBound
                    break
                } else {
                    left = mid + 1
                }
            } else if failDistance > distance {
                right = mid - 1
            }
        }
                
        left = range.lowerBound
        right = range.upperBound
        
        while left <= right {
            let mid = left + (right - left) / 2
            let nextToMid = mid + 1
            let speed = mid * 1
            let winRestTime = time - mid
            let failRestTime = time - nextToMid
            let winDistance = winRestTime * speed
            let failDistance = failRestTime * (speed + 1)

            
            if winDistance > distance {
                if distance >= failDistance {
                    lastWin = mid // !
                    break
                } else {
                    left = mid + 1
                }
            } else if winDistance <= distance {
               right = mid - 1
            }
        }
                
        // count
        count = lastWin - firstWin + 1
        
        return count
    }
}

//WaitForIt2().amountOfRecords(input: WaitForIt2().shortInput)
WaitForIt2().amountOfRecords(input: WaitForIt2().longInput)

