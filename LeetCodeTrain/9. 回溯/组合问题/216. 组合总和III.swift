//
//  216. 组合总和III.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/27.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution216 {
    // 在1--9 中的数字
    // 相加之和为n
    // k个数
    // k 个数要用k个循环，可以采用递归的方式
    
    var sum: Int = 0
    var path: [Int] = []
    var result: [[Int]] = []
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        combinationSum(k, n, start: 1)
        return result
    }
    func combinationSum(_ k: Int, _ n: Int, start: Int) {
        // 退出条件
        // 既要满足和为n ,又要满足
        if sum == n && path.count == k {
            result.append(path)
            return
        }
        if start > 9 {
            return
        }
        // 循环遍历
        
        for i in start...9 - (k - path.count) + 1 {
            // 剪枝: 如果当前i + sum 已经大于n 直接不用继续了
            if i + sum > n {
                break
            }
            path.append(i)
            sum += i
            combinationSum(k, n,start: i + 1)
            path.removeLast()
            sum -= i
        }
    }
    
    static func test() {
        let solution = Solution216()
//        [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
        let k = 3, n = 9
        let result = solution.combinationSum3(k, n)
        print(result)
    }
}
