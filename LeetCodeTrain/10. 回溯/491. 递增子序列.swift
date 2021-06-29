//
//  491. 递增子序列.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 所有该数组的递增子序列
// 也就是在所有集合里找出递增的子序列
// 下找出所有的节点路径，当路径不是顺序的时候，停止向下走
// 本体容易掉坑里
// 而本题求自增子序列，是不能对原数组经行排序的，排完序的数组都是自增子序列了。
//
class Solution491 {
    var result: [[Int]] = []
    var path: [Int] = []
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        backTrace(nums, start: 0)
        print(result.count)
        return result
    }
    
    func backTrace(_ nums: [Int], start: Int) {
        // 保证本层不会出现相同的元素重复
        var set:Set = Set<Int>()
        for i in start..<nums.count {
            // 保证是有序的
            if let subFix = path.last ,nums[i] < subFix {
                continue
            }
            // 保证相同层不重复的
            if set.contains(nums[i]) {
                // 这里用continue 与 用return 是有区别的
                continue
            }
            set.insert(nums[i])
            path.append(nums[i])
            if path.count > 1 {
                result.append(path)
            }
            backTrace(nums, start: i + 1)
            path.removeLast()
        }
    }
    
    static func test(){
        let solution = Solution491()
        let nums = [4, 6, 7, 7]
//        [4, 7]
//        [4, 6, 7]
//        [6, 7]
//        有3个事重复的
//        [[4, 6], [4, 6, 7], [4, 6, 7, 7], [4, 6, 7], [4, 7], [4, 7, 7], [4, 7], [6, 7], [6, 7, 7], [6, 7], [7, 7]]

        let result = solution.findSubsequences(nums)
        print(result)
    }
}
