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
    static func test() {
        let solution = Solution96()
        let result = solution.numTrees(3)
        print(result)
    }
}
