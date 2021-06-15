//
//  48. 旋转图像.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/21.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 旋转图像
class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        // 先进行上下翻转
        // 上下对折翻转
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        for i in 0..<rowCount / 2 {
            for j in 0..<columnCount {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[rowCount - i - 1][j]
                matrix[rowCount - i - 1][j] = tmp
            }
        }
        // 对角翻转
        for i in 0..<rowCount  {
            for j in 0...i {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
    }
    static func test() {
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        let solution = Solution48()
        solution.rotate(&matrix)
    }
}
