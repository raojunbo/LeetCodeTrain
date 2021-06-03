//
//  File.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/16.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/*
 单调栈的解法
 */
class Solution739 {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 每日温度
        var stack: [Int] = []
        var result: [Int] = Array(repeating: 0, count: T.count)
        for i in 0..<T.count {
            let item = T[i]
            // 不断的出栈
            // item 大于栈内的值
            // 整个的操作是针对于坐标
            while let index = stack.last, item > T[index] {
                stack.removeLast()
                result[index] = i - index
            }
            stack.append(i)
        }
        return result
    }
    static func test(){
        let array = [73, 74, 75, 71, 69, 72, 76, 73]
        let solution = Solution739()
        let result = solution.dailyTemperatures(array)
        print(result)
    }
}
