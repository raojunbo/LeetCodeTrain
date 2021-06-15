//
//  剑指 Offer 14- I. 剪绳子.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord14 {
    
    func cuttingRope(_ n: Int) -> Int {
        // 用一个一维数组去存临时的值
        var product: [Int] = Array(repeating: 0, count: n + 1)
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 1
        }
        if n == 3 {
            return 2
        }
        product[0] = 0
        product[1] = 1
        product[2] = 2
        product[3] = 3
        // 从下到上求解
        // 实际上是一个动态规划的过程
        // 所谓的动态规划，无非是用到了子问题的解
        for i in 4...n {
            var max: Int = 0
            for j in 1...i/2 {
                let tmp = product[i - j] * product[j]
                if tmp > max {
                    max = tmp
                }
                product[i] = max
            }
        }
        return product[n]
    }
    
    static func test(){
        let solution = SolutionSord14()
        let result = solution.cuttingRope(10)
        print(result)
    }
}
