import UIKit

class WaitForIt {
    
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
    
    func productOfRecords(input: String) -> Int {
        var product: Int = 1
        //
        
        var inputStrings: [String] = input.components(separatedBy: "\n")
        
        var timesArray: [Int] = []
        var distancesArray: [Int] = []
         
        var numberString: String = ""
        // TimesArray:
        for (charInd, char) in inputStrings[0].enumerated() {
            
            guard charInd != inputStrings[0].count - 1
            else {
                numberString = numberString + String(char)
                timesArray.append(Int(numberString) ?? 0)
                numberString = ""
                continue
            }
            
            if char.isNumber {
                numberString = numberString + String(char)
                continue
            }
            
            if char == " " && numberString != "" {
                timesArray.append(Int(numberString) ?? 0)
                numberString = ""
                continue
            }
        }
        
        print(timesArray)
        
        // DistancesArray:
        for (charInd, char) in inputStrings[1].enumerated() {
            
            guard charInd != inputStrings[1].count - 1
            else {
                numberString = numberString + String(char)
                distancesArray.append(Int(numberString) ?? 0)
                continue
            }
            
            if char.isNumber {
                numberString = numberString + String(char)
                continue
            }
            
            if char == " " && numberString != "" {
                distancesArray.append(Int(numberString) ?? 0)
                numberString = ""
                continue
            }
        }
        
        print(distancesArray)
        
        var racesData: [[Int]] = []
        for i in 0..<timesArray.count {
            var raceData: [Int] = []
            raceData.append(timesArray[i])
            raceData.append(distancesArray[i])
            racesData.append(raceData)
        }
        
        print(racesData)
        
        // Ready to count:
        
        for raceData in racesData {
            var firstWin: Int = 1
            var lastWin: Int = 1
            
            let time = raceData[0]
            let distance = raceData[1]
            
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
            product *= (lastWin - firstWin + 1)
        }
        
        //
        return product
    }
}

WaitForIt().productOfRecords(input: WaitForIt().shortInput)
WaitForIt().productOfRecords(input: WaitForIt().longInput)

