//
//  56. 合并区间.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/21.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 将其进行排序
        var tmpIntervals = intervals
        quickSort(&tmpIntervals, start: 0, end: tmpIntervals.count - 1)
        
        // 前一个的右边大于后一个的左边
        //  [[0, 2], [1, 4], [3, 5]]
        var last: [Int]?
        var result: [[Int]] = []
        for item in tmpIntervals {
            if let relLast = last , item[0] <= relLast.last! {
                let max = relLast.last! > item.last! ?  relLast.last: item.last
                let arry:[Int] = [relLast.first!, max!];
                result.removeLast()
                result.append(arry)
                last = arry
            } else {
                result.append(item)
                last = item
            }
           
        }
        return result
    }
    
    // 写出一个快速排序的算法
    func quickSort(_ intervals: inout [[Int]], start: Int, end: Int) {
        // 因为是左闭右开
        if end - start < 1 {
            return
        }
        let mid = findMid(&intervals, start: start, end: end)
        quickSort(&intervals, start: start, end: mid)
        quickSort(&intervals, start: mid + 1, end: end)
    }
    
    func findMid(_ intervals: inout [[Int]], start: Int, end: Int) -> Int {
        var i = start
        var j = end
        // 以最左边为锚点
        let pValue = intervals[i]
        while i < j {
            // 右边
            while i < j {
                if pValue.first! <= intervals[j].first! {
                    j = j - 1
                } else {
                    intervals[i] = intervals[j]
                    i = i + 1
                    break
                }
            }
            // 左边
            while i < j {
                if pValue.first! > intervals[i].first! {
                    i = i + 1
                } else {
                    intervals[j] = intervals[i]
                    j = j - 1
                    break
                }
            }
        }
        intervals[i] = pValue
        return i
    }
    
    static func test() {
        var intervals = [[1,4],[0,2],[3,5]]
        let solution = Solution56()
        solution.quickSort(&intervals, start: 0, end: intervals.count - 1)
        print(intervals)
        
        let result = solution.merge(intervals)
        print(result)
    }
}
