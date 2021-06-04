//
//  347. 前k个高频元素.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution347 {
    // 思考：找出前k个元素本身最好的时间是nlogk
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict:[Int:Int] = [:]
        // o(n)
        for key in nums {
            var itemCount: Int = dict[key] ?? 0
            itemCount += 1
            dict[key] = itemCount
        }
        // 我们对所有的key进行堆化。小顶堆化。然后从队列逐个取出key，及key的Value
        let minHeap = BinaryMinHeap<Int>()
        minHeap.leftLessRightClosure = { (left, right) in
            return dict[left]! < dict[right]!
        }
        for key in dict.keys {
            let itemCount: Int = dict[key]!
            // 当还没有超过堆的本身大小时，全部加入到堆中
            if minHeap.elements.count < k {
                minHeap.add(element: key)
            } else {
                if minHeap.elements.count == 0 {
                    continue
                }
                // 新的count 大于小顶堆的栈
                let topItemCount:Int = dict[minHeap.elements.first!]!
                if itemCount > topItemCount {
                    minHeap.relplace(element: key)
                }
            }
        }
        // 内部是以key为标准的
        print(minHeap.elements)
        return minHeap.elements
    }
    static func test(){
        let nums = [1,1,1,2,2,3]
        let solution = Solution347()
        solution.topKFrequent(nums, 2)
    }
}
