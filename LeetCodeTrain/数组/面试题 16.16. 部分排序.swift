//
//  面试题 16.16. 部分排序.swift
//  LeetCodeTrain
//  实际上就是找逆序对
// 怎么
//  Created by rjb on 2021/5/6.
//  Copyright © 2021 rjb. All rights reserved.
//
// 练习
import Foundation
class Solution1616 {
    // 从左向右，找到最后的逆序对
    // 从右向左，找打最后的逆序对
    func subSort(_ array: [Int]) -> [Int] {
        // 从左到右找最后的逆序对
        var leftMax = 0
        var leftRange = -1
        for i in 0..<array.count {
            // 比最大值要小，就是一个逆序对
            if array[i] < array[leftMax] {
                leftRange = i
            } else {
                // 如果是顺序的更新最大值
                leftMax = i
            }
        }
        var rightMin = array.count - 1
        var rightRange = -1
        for j in (0..<array.count).reversed() {
            // 比最最小值要大
            if array[j] > array[rightMin] {
               rightRange = j
            } else {
                // 若果是顺序的更新最小值
                rightMin = j
            }
        }
        return [rightRange,leftRange]
    }
    
    static func test() {
        let solution = Solution1616()
        let array = [1,2,4, 7,10,11,7,12,6,7, 16,18,19]
        let result = solution.subSort(array)
        print(result)
    }
}
