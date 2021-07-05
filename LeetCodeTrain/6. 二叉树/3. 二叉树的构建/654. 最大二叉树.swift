//
//  654. 最大二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution654 {
    // 第一遍练习(这道题很简单就做出来了)
    // 思路：先找出最大值。然后区分左右子树()
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return constructMax(nums, start: 0, end: nums.count - 1)
    }
    func constructMax(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        var maxIndex = start
        for i in start...end {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        let root = TreeNode(nums[maxIndex])
        let left = constructMax(nums, start: start, end: maxIndex - 1)
        let right =  constructMax(nums, start: maxIndex + 1, end: end)
        root.left = left
        root.right = right
        return root
    }
    static func test(){
        let nums = [3,2,1,6,0,5]
        let solution = Solution654()
        let result = solution.constructMaximumBinaryTree(nums)
        print(result)
    }
}
