//
//  240. 搜索二维矩阵2.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution240 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }
        // 整个的思路：
        // 一次二分搜索是针对一行，一列;
        // 所以实际上是针对对角线进行的;
        let shorterDim = min(matrix.count, matrix[0].count)
        for index in 0..<shorterDim {
            let verticalFound = binarySearch(matrix: matrix, target: target, start: index, vertical: true)
            let horizontalFound = binarySearch(matrix: matrix, target: target, start: index, vertical: false)
            if verticalFound || horizontalFound {
                return true
            }
        }
        return false
    }
    // 以下是分别针对行与列进行二分搜索
    // 这里的start 就是对角线
    func binarySearch(matrix: [[Int]], target: Int, start: Int, vertical: Bool) ->Bool {
        var lo = start
        var hi = vertical ? matrix[0].count - 1 : matrix.count - 1
        while hi >= lo {
            let mid = (lo + hi) / 2
            // 如果是垂直方向
            if vertical {
                if matrix[start][mid] < target {
                    lo = mid + 1
                } else if matrix[start][mid] > target {
                    hi = mid - 1
                } else {
                    return true
                }
            } else {
                // 如果是水平方向
                if matrix[mid][start] < target {
                    lo = mid + 1
                } else if matrix[mid][start] > target {
                    hi = mid - 1
                } else {
                    return true
                }
            }
        }
        return false
    }
    static func test() {
//        let array = [
//            [1, 4, 7, 11, 15],
//            [2, 5, 8, 12, 19],
//            [3, 6, 9, 16, 22],
//            [10, 13, 14, 17, 24],
//            [18, 21, 23, 26, 30]
//        ]
        let array = [[1,1]]
        let solution = Solution240()
        let result = solution.searchMatrix(array, 5)
        print(result)
    }
}
