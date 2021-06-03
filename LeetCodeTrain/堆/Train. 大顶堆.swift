//
//  Train. 堆的创建.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/2.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 二叉堆存储，采用的数组
// 堆的构建
/*
 堆的add
*/
/*堆的delete:
    删除其实就是删除堆顶元素。将最后元素替换堆顶元素；
    然后从堆顶元素开始进行堆化；
*/

class BinaryMaxHeap {
    var elements: [Int] = []
    // 添加元素
    // 向最后添加元素，然后将最后的元素进行上滤
    func add(element: Int) {
        // 在最后添加
        elements.append(element)
        siftUp(index: elements.count - 1)
    }
    // 删除堆顶元素: 拿到最后一个元素放到顶部，然后进行下沉
    // logn级别
    func remove() -> Int{
        if elements.isEmpty {
            return -1
        }
        let top = elements[0]
        elements[0] = elements.last!
        elements.removeLast()
        siftDown(index: 0)
        return top
    }
    // 直接覆盖掉堆顶
    // 将堆顶进行下滤
    func relplace(element: Int) {
        if elements.isEmpty {
            elements.append(element)
        } else {
            elements[0] = element
            siftDown(index: 0)
        }
    }
    // 下滤
    // logn级别
    func siftDown(index: Int) {
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
    // 让index位置的元素上滤（这里是优化后的写法）
    func siftUp(index: Int) {
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
    func print() {
        Swift.print(elements)
    }
}
class SolutionMaxHeapTrain {
    static func test(){
        let solution = BinaryMaxHeap()
        solution.add(element: 68)
        solution.add(element: 72)
        solution.add(element: 43)
        solution.add(element: 50)
        solution.add(element: 38)
        solution.add(element: 10)
        solution.add(element: 90)
        solution.add(element: 65)
        solution.print()
    }
}
