//
//  96. 不同的二叉搜索树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution96 {
    // 不同的二叉搜索树
    // 将其想象成以某个为根接节点。左子树的情况 * 右子树的情况
    // 所以整个的动态规划过程就是找到递归表达式
    // 利用前面已经计算过的额结果，算出新的值
    func numTrees(_ n: Int) -> Int {
        var g = Array(repeating: 0, count: n + 1)
        g[0] = 1
        g[1] = 1
        if n <= 1 {
            return g[n]
        }
        // 针对不同的i进行计算
        for i in 2...n {
            // 针对不同的为为根节点，最终的种树相乘
            for j in 1...i {
                g[i] += g[j - 1] * g[i - j]
            }
        }
        return g[n]
    }
    // 第二遍练习(没有很快的写出来)
    // 不同的二叉搜索树种数目
    // 这个的确不好想；
    // dp[i] 表示最大值是i的二叉搜索树的总和
    // 递推公式：dp[i] 就是从dp[1] 开始的左边 与 右边的子数的种数总和
    func numTrees2(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        // 初始值
        dp[0] = 1
        dp[1] = 1
        if n < 2 {
            return dp[n]
        }
        for i in 2...n {
            // 在i的条件下，左子树的以其为根的种数 与 右子数以其为根的种数 的乘积
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        return dp[n]
    }
    
    static func test() {
        let solution = Solution96()
        let result = solution.numTrees2(1)
        print(result)
    }
}
