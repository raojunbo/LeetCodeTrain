//
//  93. 复原IP地址.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/28.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 复原IP地址
 这个问题其实还是一个字符串分割的问题
 例如：25525511135;
 只要四个分割同时满足条件就就可以了。
 */
class Solution93 {
    var result: [String] = []
    var path: [String] = []
    func restoreIpAddresses(_ s: String) -> [String] {
        let array: [String] = Array(s).map(String.init)
        backTrace(array, start: 0)
        return result
    }
    
    func backTrace(_ array: [String], start: Int) {
        // 最终的path正好是4，且正好拼完
        if path.count == 4 && start == array.count {
            result.append(path.joined(separator: "."))
            return
        }
        if start == array.count {
            return
        }
        for i in start..<array.count {
            // i表示分割字符串的结束点
            let subArray = array[start...i]
            let splitStr = subArray.joined()
            // 如果满足ip的条件
            if isValid(s: array, start: start, end: i)  {
                path.append(splitStr)
            } else {
                // 如果不满足条件，后面的就没有意义了
                break
            }
            backTrace(array, start: i + 1)
            path.removeLast()
        }
    }
    func isValid( s: [String], start: Int, end: Int) -> Bool {
        if (start > end) {
            return false;
        }
        if (s[start] == "0" && start != end) { // 0开头的数字不合法
            return false;
        }
        var num = 0;
        for i in start...end {
            if (s[i] > "9"  || s[i] < "0" ) { // 遇到⾮数字字符不合法
                return false;
            }
            // 字符的相差值 有点问题
//            Character(s[i]) - Character("0")
//            num = num * 10 + (s[i] - "0" );
            if (num > 255) { // 如果⼤于255了不合法
                return false;
            }
        }
        return true;
    }
    
    static func test() {
        //        let str = "25525511135"
        let str = "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        let solution = Solution93()
        let result = solution.restoreIpAddresses(str)
        print(result)
    }
}
