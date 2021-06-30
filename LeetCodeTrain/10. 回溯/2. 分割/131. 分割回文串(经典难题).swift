//
//  131. 分割回文串.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/28.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 将字符串进行分割，是生成的字符串是回文串
 字符串的分割。当一个进行某种分割，其他的就在此基础上进行其他的某种分割；
 所以可以采用回溯的方法；
 */
class Solution131 {
    var result: [[String]] = []
    var path: [String] = []
    func partition(_ s: String) -> [[String]] {
        let array: [String] = Array(s).map(String.init)
        backTrace(array, start: 0)
        return result
    }
    
    func backTrace(_ array: [String], start: Int) {
        // i 进行分割点
        // i = start 是进行
        // i == start +  xx 是进行几个字符的分割
        // 例如 aab
        // a 然后查看后面的组合是找到回文串
        // aa
        // aab
        
        // 结束点
        if start >= array.count {
            result.append(path)
            return
        }
        for i in start..<array.count {
            // i表示分割字符串的结束点
            let subArray = array[start...i]
            let splitStr = subArray.joined()
            // 如果是回文
            if isHuiWen(splitStr) {
                path.append(splitStr)
            } else {
                // 如果不是回文，既然已经不是回文串了。那么后面的分割就已经没有意义了。
                continue
            }
            backTrace(array, start: i + 1)
            path.removeLast()
        }
    }
    
    // 判定是否是回文串
    func isHuiWen(_ str: String) -> Bool {
        let array: [Character] = Array(str)
        var i = 0
        var j = array.count - 1
        var result = true
        while i < j {
            if array[i] != array[j] {
                result = false
            }
            i += 1
            j -= 1
        }
        return result
    }
    
    static func test() {
        let str = "aab"
        let solution = Solution131()
        let result = solution.partition(str)
        print(result)
    }
}
