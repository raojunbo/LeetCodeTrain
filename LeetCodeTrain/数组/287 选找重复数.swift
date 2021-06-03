//
//  287 选找重复数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 寻找重复数
// 可以用快慢指针，也可以用二分查找法
class Solution287 {
    // 一种巧妙的解法是用快慢指针
    func findDuplicate(_ nums: [Int]) -> Int {
        // 采用快慢指针
        var p1 = 0
        var p2 = 0
        repeat{
            // p1 走一步
            p1 = nums[p1]
            // p2 走两步
            p2 = nums[nums[p2]]
        } while p1 != p2
        
        // p1,p2 都向后同步走
        // 第二次必定是入口
        p1 = 0
        while p1 != p2 {
            p1 = nums[p1]
            p2 = nums[p2]
        }
        return p1
    }
   

    static func test(){
        let nums = [1,3,4,2,2]
        let solution = Solution287()
        let result = solution.findDuplicate(nums)
        print(result)
    }
}
