//
//  Train. 完全背包问题.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/15.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 完全背包问题
// 一个物品可以被使用很多次
// 定义dp[i]容量为i时的最大
class SolutionAllBagTrain {
    func bagMaxValue(capacity:Int, weight:[Int], value:[Int]) ->Int {
        var dp = Array(repeating: 0, count: capacity + 1)
        // 整个的思想：就是在物品一定条件下，背包容量发生变化时，dp[i][j]的变化
        // 因为从数据的使用上看。0-1背包问题只使用上一行的历史数据
        // 完全背包问题因为使因为同一个物品可以使用多次。所以只需从左向右遍历就能保证比较选育不选时，选出最大值就可以了
        // 因为完全背包问题都是从左到右，所以里外的顺序可以变化（但其思考方式是不一样的）
        for i in 0..<weight.count {
            for j in 0...capacity {
                let v = value[i]
                let w = weight[i]
                if j < w {
                    continue
                }
                dp[j] = max(dp[j - w] + v, dp[j])
            }
        }
        return dp[capacity]
    }
    
    static func test (){
        let weight = [1,3,4]
        let value = [15, 20, 30]
        let size = 4
        let solution = SolutionAllBagTrain()
        let result = solution.bagMaxValue(capacity: size, weight: weight, value: value)
        print(result)
    }
}
