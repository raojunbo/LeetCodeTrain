//
//  17. 电话号码的字母组合(第二遍练习).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/27.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution17_SecondTrain {
    var path: [String] = []
    var result: [String] = []
    
    func letterCombinations(_ digits: String) -> [String] {
        let digitsArray = Array(digits)
        digitsBrower(digitsArray, start: 0)
        return []
    }
    func digitsBrower(_ digitsArray: [Character], start: Int) {
        if start > digitsArray.count - 1 {
            return
        }
        let item = digitsArray[start]
        let itemArray = getLetter(item)
        var isLast = false
        // 当是最后一个字符时，记录结果
        if start == digitsArray.count - 1 {
            isLast = true
        }
        letterBackTrace(itemArray,isLast: isLast)
        // 采用递归遍历字符
        for i in start..<digitsArray.count {
            digitsBrower(digitsArray,start: i + 1)
        }
    }
    func letterBackTrace(_ letters: [String], isLast: Bool) {
        for item in letters {
            path.append(item)
            if isLast {
                result.append(letterString())
              
            }
            else {
                path.removeLast()
            }
           
        }
    }
    func letterString() -> String {
        var str: String = ""
        for i in path {
            str.append(i)
        }
        return str
    }
    func getLetter(_ digit: Character) -> [String] {
        var letters: [String] = []
        if digit == "2" {
            letters = ["a","b","c"]
        } else if digit == "3" {
            letters = ["d","e","f"]
        } else if digit == "4" {
            letters = ["g","h","i"]
        } else if digit == "5" {
            letters = ["j","k","l"]
        } else if digit == "6" {
            letters = ["m","n","o"]
        } else if digit == "7" {
            letters = ["p","q","r","s"]
        } else if digit == "8" {
            letters = ["t","u","v"]
        } else if digit == "9" {
            letters = ["w","x","y","z"]
        }
        return letters
    }
    static func test() {
        let solution = Solution17_SecondTrain()
        let digits = "23"
        let result = solution.letterCombinations(digits)
        print(result)
    }
}
