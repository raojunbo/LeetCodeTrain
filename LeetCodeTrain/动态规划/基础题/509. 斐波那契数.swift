//
//  509. 斐波那契数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/8.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution509 {
    // f(n) = f(n -1) + f(n-2)
    // 采用递归时间复杂度较高
    // f(n)可以采用存起来。及采用动态规划问题
    // 哈哈。非常精妙的解法
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var p = 0 // 初始f(0)
        var q = 1 // 初始f(1)
        for _ in 2...n {
            let tmp = p + q
            p = q
            q = tmp
        }
        return q
    }
    static func test() {
        let solution = Solution509()
        let result = solution.fib(4)
        print(result)
    }
}
