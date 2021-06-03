//
//  78. 子集.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 子集
// 这实际上是一种动态规划的思想
class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        for i in 0..<nums.count {
            let newResult = createNew(nums, result: &result, i)
            result.append(contentsOf: newResult)
        }
        result.insert([], at: 0)
        return result
    }
    func createNew(_ numss: [Int], result: inout [[Int]],_ index: Int) -> [[Int]] {
        var newArray:[[Int]] = []
        newArray.append([numss[index]])
        // 在原有数组基础上添加新的元素
        for i in 0..<result.count {
            var item = result[i]
            item.append(numss[index])
            newArray.append(item)
        }
        return newArray
    }
    
    static func test(){
        let solution = Solution78()
        let nums = [1,2,3,4]
        let result = solution.subsets(nums)
        print(result)
    }
}
