//
//  47. 全排列问题II.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution47 {
    var path: [Int] = []
    var result: [[Int]] = []
    var used: [Bool] = [] // 记录的是递归被使用过
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        used = Array(repeating: false, count: nums.count)
        backTrace2(nums, start: 0)
        return result
    }
    
    func backTrace2(_ nums: [Int], start: Int) {
        if nums.count == path.count {
            result.append(path)
            return
        }
        // set 处理树层是否访问过(这里处理树层的取重)
        var set = Set<Int>()
        for i in start..<nums.count {
            if used[i] == true {
                continue
            }
            if set.contains(nums[i]) {
                continue
            }
            set.insert(nums[i])
            path.append(nums[i])
            // 处理树枝是否访问过
            used[i] = true
            backTrace2(nums, start: start)
            used[i] = false
            path.removeLast()
        }
    }
    
    static func test(){
        let solution = Solution47()
        let nums = [1,1,2]
        let result = solution.permuteUnique(nums)
        print(result)
    }
}
