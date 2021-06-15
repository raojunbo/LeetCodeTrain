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
    var findValue: Int?
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
    // 哈哈这是第二种方法
    // 采用快速排序的方法
    // 不断的以一个为基准，进行划分，logn
    func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
       
        quickSort(a: &nums,k: k)
        return findValue!
    }
    func quickSort(a: inout [Int], k: Int) {
        quickPart(a: &a, begin: 0, end: a.count - 1,k: k)
    }
    func quickPart(a: inout [Int], begin: Int, end: Int, k: Int) {
        if begin >= end {
            return
        }
        // 确定轴点位置
        let mid = pivotIndex(a: &a, begin: begin, end: end)
        
        //被确定为轴点的位置，实际上就已经确定好了真正的位置
        if mid == a.count - k {
            findValue = a[mid]
            return
        }
        // 对左边进行快速排序
        quickPart(a: &a, begin: begin, end: mid, k:k)
        // 对右边进行快速排序
        quickPart(a: &a, begin: mid + 1, end: end,k:k)
    }
    // 获取指定范围的轴点
    func pivotIndex(a: inout [Int], begin: Int, end: Int) -> Int {
        // 选中最左边的为轴点
        let pv = a[begin]
        
        var leftIndex = begin
        var rightIndex = end
        
        // 标记从哪边
        var flagRight = true
        while leftIndex < rightIndex {
            // 从右边开始扫描
            if flagRight {
                if a[rightIndex] < pv {
                    // 将右边放到左边
                    a[leftIndex] = a[rightIndex]
                    flagRight = false
                    leftIndex += 1
                } else {
                    // 右边元素本身就大
                    rightIndex -= 1
                }
            } else {
                // 从左边开始扫描
                if a[leftIndex] > pv  {
                    // 将左边放到右边
                    a[rightIndex] = a[leftIndex]
                    flagRight = true
                    rightIndex -= 1
                } else {
                    // 左边元素本身就小
                    leftIndex += 1
                }
            }
        }
        a[leftIndex] = pv
        return leftIndex
    }

    static func test(){
        let nums = [51, 30, 39 ,92 ,74 ,25 ,16, 93,91,19,54, 47, 73, 62, 76, 63, 35, 18, 90, 6, 65, 49, 3, 26, 61, 48]
        let solution = Solution215()
       let result =  solution.findKthLargest2(nums, 3)
        print(result)
    }
}
