//
//  17. 电话号码的字母组合.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution17 {
    // 电话号码的字母组合
    // 所有组合，可以进行深度优先遍历
    // 凡是要找到所有的组合。都是采用这种深度或者广度优先遍历
    func letterCombinations(_ digits: String) -> [String] {
        let array = Array(digits)
        let result = subCombinations(array)
        return result
    }
    func subCombinations(_ sub: [Character]) -> [String] {
        var sub = sub
        if sub.count <= 0 {
            return []
        }
        let first = sub.removeFirst()
        
        var result = subCombinations(sub)
        
        let leters = getLetter(first)
        // 当前digit对应的字符
        var isFirst = false
        if result.count == 0 {
            isFirst = true
        }
        var tmpArray: [String] = []
        for leter in leters {
            // 遍历子问题的解,在前面添加字符串
            if isFirst {
                tmpArray.append(leter)
                continue
            }
            for index in 0..<result.count {
                let item = result[index]
                let newItem = leter.appending(item)
                tmpArray.append(newItem)
            }
        }
        result.removeAll()
        result.append(contentsOf: tmpArray)
        return result
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
    static func test(){
        let array = "23"
        let solution = Solution17()
        let result = solution.letterCombinations(array)
        print(result)
    }
}
