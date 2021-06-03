//
//  560. 和为k的子数组.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/23.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution560 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        return 0
//        // 采用双指针,实现一遍扫描法
//        if nums.count == 1 {
//            if k == nums[0] {
//                return 1
//            }
//            return 0
//        }
//
//        var p1 = 0
//        var p2 = 0
//        var sum = nums[p1]
//        var resCount = 0
//        while p1 < nums.count, p2 < nums.count {
//            // 左边移除,右边增加
//            sum = sum + nums[p2]
//
//            if sum == k {
//                resCount = resCount + 1
//                sum = sum - nums[p1]
//                p1 = p1 + 1
//                p2 = p2 + 1
//            } else if sum < k {
//                p2 = p2 + 1
//            } else {
//                sum = sum - nums[p1]
//                p1 = p1 + 1
//            }
//        }
//        return resCount
    }
    static func test(){
        let nums = [1,2,3]
        let solution = Solution560()
        let result = solution.subarraySum(nums, 3)
        print(result)
    }
}
