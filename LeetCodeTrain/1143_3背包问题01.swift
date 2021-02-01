//
//  1143_3.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/1/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution1143_3 {
    func bagMaxValue(capacity:Int,w:[Int],v:[Int]) ->Int {
        // 定义dp:dp[i][j] 最大承重为j,有前i见物品可以选择的最大价值
        // 限制承重，限制容量，i就是当前物品的重量，j当前可以承重
        // 在定义dp时，通过思考从小规模推到大规模问题时的变量有哪些。
        // 通过控制变量，实现由小规模推到大规模
        let dprow = Array(repeating: 0, count: capacity + 1)
        var dp = Array(repeating: dprow, count: w.count + 1)
        for i in 1...w.count {
            for j in 1...capacity {
                //最大承重小于最后一个物品
                if j < w[i - 1] {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    //最后一个物品选择，（本次总承重 - 本次重量）的值 + 当前物品的价值
                    dp[i][j] = max( dp[i - 1][j],  dp[i - 1][j - w[i - 1]] + v[i - 1])
                }
            }
        }
        return dp[w.count][capacity]
    }
    
    static func test() {
        let v = [6,3,5,4,6]
        let w = [2,2,6,5,4]
        
        let result = Solution1143_3().bagMaxValue(capacity: 10, w: w, v: v)
        print(result)
    }
}
