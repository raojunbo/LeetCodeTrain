//
//  448. 找到所有数组中消失的数字.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution448 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        let len = nums.count
        var index = 0
        while index < len {
            // 索引位置即为真正位置
            if nums[index] == index + 1 {
                index = index + 1
            } else {
                // 位置不正确
                let targetIndex = nums[index] - 1
                // 若如果正确的位置已经存在了。不管
                if nums[targetIndex] == nums[index] {
                    index = index + 1
                    continue
                }
                // 如果正确的位置不存在正确的值
                // 将当前值放入正确的位置
                let tmp = nums[targetIndex]
                nums[targetIndex] = nums[index]
                nums[index] = tmp
            }
        }
        var res: [Int] = []
        for index in 0..<nums.count {
            if nums[index] != index + 1 {
                res.append(index + 1)
            }
        }
        return res
    }
    
    static func test() {
        let nums = [4,3,2,7,8,2,3,1]
        let solution = Solution448()
        let ressult = solution.findDisappearedNumbers(nums)
        print(ressult)
    }
}
