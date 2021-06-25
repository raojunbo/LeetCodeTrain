//
//  674. 最长连续递增序列.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/25.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution674 {
    // 最长连续递增序列
    // 用贪心就可以
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var result = 1
        var tmpResult = 1
        for i in 1..<nums.count {
            let pre = nums[i - 1]
            let cur = nums[i]
            if cur > pre {
                tmpResult += 1
            } else {
                tmpResult = 1
            }
            if tmpResult > result {
                result = tmpResult
            }
        }
        return result
    }
    
    static func test() {
        let nums1 = [10, 9, 2, 5, 3, 7, 101, 18]
        let nums2 = [0,1,0,3,2,3]
        let nums3 = [7,7,7,7,7,7,7]
        let num4 = [4,10,4,3,8,9]
        
        let num5 = [2,2,2,2,2]
        let result = Solution674().findLengthOfLCIS(num5)
        print(result)
    }
}
