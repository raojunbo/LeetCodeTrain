//
//  Train. 批量建堆.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 批量建堆有两种做法
// 第一种：自上而下的上滤
// 第二种：自下而上的下滤（效率稍微高点）
class BinaryHeapHeapify {
    func heapify(a: inout [Int]) {
//        自上而下的上滤, 整个复杂度是nlogn
        // 本质是从头开始逐渐添加
        for index in 0..<a.count {
            siftUp(elements: &a, index: index)
        }
    }
    func siftUp(elements: inout [Int], index: Int) {
        var index = index
        let v = elements[index]
        while index > 0 {
            let pindex = (index - 1) / 2
            let pv = elements[pindex]
            // 当前小于父节点，不用进行上滤了
            if v < pv {
                break
            }
            // 当前大于父节点
            elements[index] = pv
            index = pindex
        }
        elements[index] = v
    }
    func heapify2(a: inout [Int]) {
        // 自下而上下滤, 整个复杂度n
        // 本质是删除
        for index in (0..<a.count/2).reversed() {
            siftDown(elements: &a, index: index)
        }
    }
    func siftDown(elements: inout [Int],index: Int) {
        // 只调整非叶子节点
        var index = index
        let indexV = elements[index]
        while index < elements.count / 2 {
            var childIndex =  index * 2 + 1
            var childV = elements[childIndex]
            
            // 右子节点
            let rightIndex = childIndex + 1
            // 选出左右子节点最大的那个
            if rightIndex < elements.count && elements[rightIndex] > childV{
                childIndex = rightIndex
                childV = elements[rightIndex]
            }
            if indexV > childV {
                break
            }
            // 将子节点存放到index位置
            elements[index] = childV
            index = childIndex
        }
        elements[index] = indexV
    }
    static func test(){
        let solution = BinaryHeapHeapify()
        var array = [30,34,73,60,68,43]
        solution.heapify2(a: &array)
        print(array)
    }
}
