//
//  215. 数组中的第k个最大元素.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/// 这是一道比较经典的题目
/// 既可以是快速排序的思想nlogn，也就是即使是最好的排序算法就是nlogn
/// 也可以是采用堆的思路 nlogk
/// 采用堆的思路比较直观效率也比较高；
class Solution215 {
    // 构建固定容量的小顶堆；堆顶即为倒数第k大的元素
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let heap: BinaryMinHeap = BinaryMinHeap<Int>()
        // 不断的将原始添加进小顶堆
        for element in nums {
            if heap.elements.count < k {
                // 将前k个元素加入到小顶堆
                heap.add(element: element)
            } else {
                // 如果是第k + 1个数大于堆顶元素（堆顶为里面已经存在的最小值），将堆顶元素进行替换（进入可以保留最大的k个元素）
                if element > heap.elements[0] {
                    heap.relplace(element: element)
                }
            }
        }
        return heap.elements[0]
    }

    static func test(){
        let nums = [51, 30, 39 ,92 ,74 ,25 ,16, 93,91,19,54, 47, 73, 62, 76, 63, 35, 18, 90, 6, 65, 49, 3, 26, 61, 48]
        let solution = Solution215()
        solution.findKthLargest(nums, 3)
    }
}
