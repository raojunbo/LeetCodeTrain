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
    var result: [[String]] = []
    var path: [Int] = []
    func restoreIpAddresses(_ s: String) -> [String] {
        let array:[Int] = Array(s).map { (char) -> Int in
            // 假如这里转换是成功的
            return (char as? Int ?? 0)
        }
        print(array)
        return []
    }
    
    func backTrace(_ array: [Int], start: Int) {
//        if  {
//            <#code#>
//        }
        // 退出条件
        for i in start..<array.count {
            let subArray = array[start...i]
//            let splitStr = subArray.joined()
            let splitInt = 1
            // 此种分割在ip的限制上满足条件
            if splitInt < 255 {
                
            } else {
                continue
            }
            backTrace(array, start: start + 1)
        }
    }
    
    static func test() {
        let str = "11133"
        let solution = Solution93()
        let result = solution.restoreIpAddresses(str)
        print(result)
    }
}
