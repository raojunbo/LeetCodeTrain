//
//  51. n皇后(第二遍).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 像这种带有路径的匹配的一般都是采用回溯的算法
 在这里能感觉到回溯算法的精妙
 */
class Solution51_2 {
    var array: [[String]] = []
    var result: [[String]] = []
    func solveNQueens(_ n: Int) -> [[String]] {
        // 搞一个二维数组的棋盘,记录位置
        array = Array(repeating: Array(repeating: ".", count: n), count: n)
        backTrace(n, row: 0)
        return result
    }
    // deep表示深度(实际上是行)
    func backTrace(_ n: Int, row: Int) {
        if row == n {
            var strArray: [String] = []
            for item in array {
                let str = item.joined()
                strArray.append(str)
            }
            result.append(strArray)
            return
        }
        // 每一行，都是
        for i in 0..<n {
            if !isValid(n: n, row: row,column: i) {
                continue
            }
            array[row][i] = "Q"
            backTrace(n, row: row + 1)
            array[row][i] = "."
        }
    }
    // 是否可以放置
    func isValid(n: Int, row: Int, column: Int) -> Bool {
        // 检测同一列
        for i in 0..<row {
            if array[i][column] == "Q" {
                return false
            }
        }
        // 是否在同一列
        if row > 0, array[row - 1][column] == "Q" {
            return false
        }
        // 检测45度
        var irow = row - 1
        var icol = column + 1
        while irow >= 0 , icol < n {
            if array[irow][icol] == "Q" {
                return false
            }
            irow -= 1
            icol += 1
        }
        // 检测135度
        var jrow = row - 1
        var jcol = column - 1
        while jrow >= 0, jcol >= 0{
            if array[jrow][jcol] == "Q" {
                return false
            }
            jrow -= 1
            jcol -= 1
        }
        return true
    }
    
    static func test () {
        let result = Solution51_2().solveNQueens(4)
        print(result)
    }
}
