//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/20.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // 找头元素与尾部元素
        if nums.count == 0 {
            return [-1, -1]
        }
        let first = findFirst(nums,target: target)
        let last = findLast(nums,target: target)
        return [first, last]
    }
    func findFirst(_ nums: [Int], target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = (right + left) / 2
            if nums[mid] == target {
                // 在左边继续查找
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        if nums[left] == target {
            return left
        }
        return -1
    }
    func findLast(_ nums: [Int], target: Int) -> Int {
        // 二分查找
        var left = 0
        var right = nums.count - 1
        while left < right {
            // 向上取整
            let mid = (right + left + 1) / 2
            if nums[mid] == target {
                // 在右边继续查找
                left = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        if nums[right] == target {
            return right
        }
        return -1
    }
    static func test(){
        let solution = Solution34()
        let nums = [5,7,7,8,8,10]
//        let nums = [2,2]
        let result = solution.searchRange(nums, 8)
        print(result)
    }
}
