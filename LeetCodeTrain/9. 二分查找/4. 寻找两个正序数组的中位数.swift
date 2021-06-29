//
//  4. 寻找两个正序数组的中位数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 这题难度有点大
class Solution4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1 = nums1
        var nums2 = nums2
        // 找出nums的个数较小数组
        if nums1.count > nums2.count {
            let tmp: [Int] = nums1
            nums1 = nums2
            nums2 = tmp
        }
        let m = nums1.count
        let n = nums2.count
        
        // 最终的中位数的总位置
        let totalLeft = (m + n + 1) / 2
        
        // 在短的数组进行二分查找，找到短的合适的位置
        var left = 0
        var right = m
        while left < right {
            // i 为第一个数组的中位数的值
            let i = left + (right - left + 1) / 2
            // j 为第二个数组的中位数位置(总位数减去短的占的位数)
            let j = totalLeft - i
            // 保证了nums1的左边始终小于nums2的右边
            if nums1[i - 1] > nums2[j] {
                // nums1的左边的最大值 > nums2的右边的最小值，此时不满足需求，说明 i 太靠右了
                // 重新在left 与right - 1 之间就进行二分查找,继续缩小范围
                right = i - 1
            } else {
                // nums1的左边的最大值 < nums2的右边的最小值，此时不满足需求，说明i 太小了，
                // 重新在left 与 right 之间减小二分查找，继续缩小范围
                left = i
            }
        }
        
        // 此时找到了合适的位置，以下为计算值
        let i = left
        let j = totalLeft - i
        
        let nums1LeftMax = i == 0 ? Int.min : nums1[i - 1]
        let nums1RightMin = i == m ? Int.max : nums1[i]
        
        let nums2LeftMax = j == 0 ? Int.min : nums2[j - 1]
        let nums2RightMin = j == n ? Int.max : nums2[j]
        
        if (m + n) % 2  == 1 {
            // 如果是奇数；
            return Double(max(nums1LeftMax, nums2LeftMax))
        } else {
            // 如果是偶数
            return Double((max(nums1LeftMax, nums2LeftMax) + min(nums1RightMin, nums2RightMin))) / 2.0
        }
    }
    static func test() {
        let nums1 = [1, 2]
        let nums2 = [3, 4]
        let solution = Solution4()
        let result = solution.findMedianSortedArrays(nums1, nums2)
        print(result)
    }
}
