//
//  108. 将有序数组转换为二叉搜索树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/6.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution108 {
    // 将有序数组转成二叉搜索树
    // 二叉搜索树的左边比根小，右边比根大;要想是平衡的二叉树。只需要递归的从子数组中取中间节点
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        return traverse(nums, start: 0, end: nums.count - 1)
    }
    func traverse(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        if start == end {
            let node = TreeNode(nums[start])
            return node
        }
        let mid:Int = (start + end ) / 2
        let node = TreeNode(nums[mid])
        let left = traverse(nums, start: start, end: mid - 1)
        let right = traverse(nums, start: mid + 1, end: end)
        node.left = left
        node.right = right
        return node
    }
    static func test() {
        let nums =  [-10,-3,0,5,9]
        let solution = Solution108()
        let result = solution.sortedArrayToBST(nums)
        print(result)
    }
}
