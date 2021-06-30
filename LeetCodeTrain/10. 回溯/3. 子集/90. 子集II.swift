//
//  90. 子集II.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution90 {
    var result: [[Int]] = [[]]
    var path: [Int] = []
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        // 在求子集合时，一定要进行排序。因为后面的取重是依赖这个排序的
        let nums = nums.sorted()
        backTrace(nums, start: 0)
        return result
    }
    // 要注意树层去重
    // 记住这种取重的巧妙的表达形式
    func backTrace(_ nums: [Int], start: Int) {
        if start >= nums.count {
            return
        }
        for i in start..<nums.count {
            // 一种巧妙的取重逻辑(其实也可以采用本层用集合的去重的逻辑)
            if i > start && nums[i] == nums[i - 1] {
                continue
            }
            path.append(nums[i])
            result.append(path)
            backTrace(nums, start: i + 1)
            path.removeLast()
        }
    }
    static func test(){
        let solution = Solution90()
        let nums = [4,4,4,1,4]
        let result = solution.subsetsWithDup(nums)
        print(result)
    }
}
