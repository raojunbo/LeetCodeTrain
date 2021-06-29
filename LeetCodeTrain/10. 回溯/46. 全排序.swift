//
//  46. 全排序.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 全排序问题
 所有数字重新排列
 */
class Solution46 {
    var path: [Int] = []
    var result: [[Int]] = []
    // 这是一种写法。
    // 但每次都创建个子数组，其实很费性能的
    // 当从实际测试情况来看
    func permute(_ nums: [Int]) -> [[Int]] {
        backTrace(nums, start: 0)
        return result
    }
    func backTrace(_ nums: [Int], start: Int) {
        if nums.count == 0 {
            result.append(path)
            return
        }
        for i in start..<nums.count {
            path.append(nums[i])
            // 向下递归的剩余
            var remainArray = nums
            remainArray.remove(at: i)
            backTrace(remainArray, start: start)
            path.removeLast()
        }
    }
    
    // 第二种写法
    // 标记是否使用过
    var used: [Bool] = []
    func permute2(_ nums: [Int]) -> [[Int]] {
        used = Array(repeating: false, count: nums.count)
        backTrace2(nums, start: 0)
        return result
    }
    func backTrace2(_ nums: [Int], start: Int) {
        if nums.count == path.count {
            result.append(path)
            return
        }
        for i in start..<nums.count {
            if used[i] == true {
                continue
            }
            path.append(nums[i])
            used[i] = true
            backTrace2(nums, start: start)
            used[i] = false
            path.removeLast()
        }
    }
    
    static func test(){
        let solution = Solution46()
        let nums = [1,2,3]
        let result = solution.permute2(nums)
        print(result)
    }
}
