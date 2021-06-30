//
//  42. 接雨水.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/16.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution42 {
    // 采用的是单调栈
    // 这是一种很好的方法
    func trap(_ height: [Int]) -> Int {
        if height.count == 0 {return 0}
        if height.count < 3 {return 0}
        var stack = [Int]()
        var totalCount = 0
        for i in 0..<height.count {
            // 当前比栈的顶部大
            while stack.count != 0 && height[i] > height[stack.last!]   {
                let last = stack.removeLast()
                if stack.count != 0 {
                    let minH = min(height[stack.last!], height[i])
                    totalCount += ((minH - height[last]) * (i - stack.last! - 1))
                }
            }
            stack.append(i)
        }
        return totalCount
    }
    // 动态规划 + 暴力 组合解法
    func trap2(_ height: [Int]) -> Int {
        return 0
    }
    
    static func test(){
        let solution = Solution42()
        let height = [0,1,0,2,1,0,1,3,2,1,2,1]
        let result = solution.trap(height)
        print(result)
    }
}
