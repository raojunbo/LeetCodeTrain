//
//  17. 电话号码的字母组合(回溯).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/28.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 回溯法的效率。确实没有深度优先遍历的效率高
 */
class Solution17_BackTrace {
    var result: [String] = []
    var path: [String] = []
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return result
        }
        let digitC = Array(digits)
        backTrace(digitC, 0)
        return result
    }
    func backTrace(_ digitC: [Character], _ start: Int) {
        // 退出条件
        if digitC.count == start {
            result.append(path.joined())
            return
        }
        // 递归回溯
        let digit = digitC[start]
        let array = getLetter(digit)
        for letter in array {
            path.append(letter)
            backTrace(digitC, start + 1)
            path.removeLast()
        }
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
        let solution = Solution17_BackTrace()
        let digits = "23"
        let result = solution.letterCombinations(digits)
        print(result)
    }
}
