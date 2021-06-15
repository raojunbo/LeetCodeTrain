//
//  Train. 快速排序.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 快速排序
class SolutionQuickSort<E:Comparable> {
    var leftLessRightClosure:(_ left:E, _ right: E)->Bool = {(left,right) in
        return left < right
    }
    func quickSort(a: inout [E]) {
        quickPart(a: &a, begin: 0, end: a.count - 1)
    }
    func quickPart(a: inout [E], begin: Int, end: Int) {
        if begin >= end {
            return
        }
        // 确定轴点位置
        let mid = pivotIndex(a: &a, begin: begin, end: end)
        // 对左边进行快速排序
        quickPart(a: &a, begin: begin, end: mid)
        // 对右边进行快速排序
        quickPart(a: &a, begin: mid + 1, end: end)
    }
    // 获取指定范围的轴点
    func pivotIndex(a: inout [E], begin: Int, end: Int) -> Int {
        // 选中最左边的为轴点
        let pv = a[begin]
        
        var leftIndex = begin
        var rightIndex = end
        
        // 标记从哪边
        var flagRight = true
        while leftIndex < rightIndex {
            // 从右边开始扫描
            if flagRight {
                if leftLessRightClosure(a[rightIndex], pv){
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
                if !leftLessRightClosure(a[leftIndex],pv) {
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
}

class SolutionQuickSortTrain {
    static func test() {
//        var array = [6, 11, 8, 2, 9, 4, 1, 5 , 7, 10, 3]
        var array = [1, 11, 8, 2, 11, 4, 1, 5 , 7, 10, 3]
        let solution = SolutionQuickSort<Int>()
        solution.quickSort(a: &array)
        print(array)
    }
}
