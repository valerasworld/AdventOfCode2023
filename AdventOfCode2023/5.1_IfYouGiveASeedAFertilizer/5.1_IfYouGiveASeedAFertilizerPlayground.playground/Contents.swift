import UIKit

class IfYouGiveASeedAFertilizer {
    
    // Test cases:
    var shortInput: String {
        let input =
            """
            seeds: 79 14 55 13

            seed-to-soil map:
            50 98 2
            52 50 48

            soil-to-fertilizer map:
            0 15 37
            37 52 2
            39 0 15

            fertilizer-to-water map:
            49 53 8
            0 11 42
            42 0 7
            57 7 4

            water-to-light map:
            88 18 7
            18 25 70

            light-to-temperature map:
            45 77 23
            81 45 19
            68 64 13

            temperature-to-humidity map:
            0 69 1
            1 0 69

            humidity-to-location map:
            60 56 37
            56 93 4
            """
        return input
    }
    
    func findMinLocation(input: String) -> Int {
        
        var separatedBlocks: [String] = input.components(separatedBy: "\n\nseed-to-soil map:\n")
        
        
        var seeds: [Int] = []
        var seedsString = separatedBlocks[0]
        
        // MARK: - Array of Seed (Int)
        
        var numberString: String = ""
        for (charIndex, char) in seedsString.enumerated() {
            
            // edge case: char is the last digit in the seeds string
            if char.isNumber && (charIndex == seedsString.count - 1) {
                numberString = "\(numberString)" + "\(char)"
                seeds.append(Int(numberString) ?? 0)
                continue
            }
            
            // add digit to a numberString
            if char.isNumber {
                numberString = "\(numberString)" + "\(char)"
                continue
            }
            
            // space after the number
            if (char == " ") && (numberString != "") {
                seeds.append(Int(numberString) ?? 0)
                numberString = ""
                continue
            }
        }
        
        // MARK: - Blocks data -> [[[Int]]]
        
        var allMapsStrings: [String] = separatedBlocks[1].components(separatedBy:  " map:\n")
        var allMapsOnlyNumbersStrings: [String] = []
        
        for mixedString in allMapsStrings {
            let numbersSeparatedFromText: [String] = mixedString.components(separatedBy: "\n\n")
            allMapsOnlyNumbersStrings.append(numbersSeparatedFromText[0])
        }
        var printAllMapsOnlyNumbersStrings: [String] = allMapsOnlyNumbersStrings
        var allMaps: [[Int:Int]] = []
        for mapForLevel in allMapsOnlyNumbersStrings {
            var mapNumbersString: [String] = mapForLevel.components(separatedBy: "\n")
            
            print("HERE IS THE NEW BLOCK")
            var rangesArray: [[Int]] = []
            
            for lineOfNumbersString in mapNumbersString {
                var rangeStrings: [String] = lineOfNumbersString.components(separatedBy: " ")
                var rangeNumbers: [Int] = []
                
                for numberString in rangeStrings {
                    rangeNumbers.append(Int(numberString) ?? 0)
                }
                rangesArray.append(rangeNumbers)
                
            }
            print(rangesArray)
            
            var levelDictionary: [Int: Int] = [:]

            for rangeArray in rangesArray {
                
                let sourceRange: Int = rangeArray[1]
                let rangeLength: Int = rangeArray[2]
                let destinationRange: Int = rangeArray[0]
                let sourceBounds: Int = sourceRange + rangeLength - 1
                
                for i in sourceRange...sourceBounds {
                    levelDictionary[i] = destinationRange + i - sourceRange
                }
                
            }
            
            
            
            allMaps.append(levelDictionary)
            
            
            
        }
        
        // MARK: - Ready to iterate seed through allMaps
        var minLocation: Int = 0
        
        for seed in seeds {
            var currentValue: Int = seed
            for level in allMaps {
                // ??
                for (key, value) in level {
                    if currentValue == key {
                        currentValue = value
                        break
                    }
                }
                // ??
            }
            
        }
        
        
        
        
        return minLocation
    }
     
}

IfYouGiveASeedAFertilizer().findMinLocation(input: IfYouGiveASeedAFertilizer().shortInput)
