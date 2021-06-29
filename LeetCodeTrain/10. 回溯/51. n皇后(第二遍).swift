//
//  51. n皇后(第二遍).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution51_2 {
    var array: [[Int]] = []
    func solveNQueens(_ n: Int) -> [[String]] {
        // 搞一个二维数组的棋盘,记录位置
        array = Array(repeating: Array(repeating: 0, count: n), count: n)
        backTrace(n, start: 0, deep: 0)
        return []
    }
    func backTrace(_ n: Int, start: Int, deep: Int) {
        if start == n && deep == n {
            print(array)
            print("")
            return
        }
        for i in start..<n {
            if !isValid(start: start, deep: deep) {
                continue
            }
            array[deep][i] = 1
            backTrace(n, start: i + 1,deep: deep + 1)
            array[deep][i] = 0
        }
    }
    func isValid(start: Int, deep: Int) -> Bool {
        // 条件判定
        // 是否在前面的同一行
        
        // 是否在前面的同一列
        
        // 是否在同一个斜线
        
        return false
    }
    static func test () {
        let result = Solution51_2().solveNQueens(4)
        print(result)
    }
}
