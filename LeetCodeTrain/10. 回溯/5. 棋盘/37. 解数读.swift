//
//  37. 解数读.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

/**
 数字1-9在每一行只能出现一次
 数字1-9在每一列只能出现一次
 数字1-9在每个以粗实线分隔的3x3内只能出现一次
 填数独就是不断的尝试

 */
class Solution37 {
    // 解决数独
    func solveSudoku(_ board: inout [[Character]]) {
        backTrance(&board)
    }
    // 回溯
    @discardableResult
    func backTrance(_ board: inout [[Character]]) ->Bool{
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                // 给这个点做尝试
                if board[i][j] != "." {
                    continue
                }
                for k in 1...9 {
                    // 这个 k 值尝试可以
                    let v = Character("\(k)")
                    if attmpValid(&board, row: i, column: j, k: v) {
                        // 填入 k 值
                        board[i][j] = v
                        // 继续下一个
                        if backTrance(&board) {
                            return true
                        }
                        // 不满足条件回退
                        board[i][j] = "."
                    }
                }
                // 9 个都测试完，还是不行。说明方案不行
                return false
            }
        }
        return true
    }
    func attmpValid(_ board: inout [[Character]], row: Int, column: Int, k: Character) -> Bool {
        // 判定行里面是否有重复
        for i in 0..<9 {
            if board[row][i] == k {
                return false
            }
        }
        // 判定列里是否有重复
        for j in 0..<9 {
            if board[j][column] == k {
                return false
            }
        }
        let startRow = (row / 3) * 3
        let startCol = (column / 3) * 3
        for i in startRow..<startRow + 3 {
            for j in startCol..<startCol + 3 {
                if board[i][j] == k {
                    return false
                }
            }
        }
        return true
    }
    static func test () {
        var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],
                                    ["6",".",".","1","9","5",".",".","."],
                                    [".","9","8",".",".",".",".","6","."],
                                    ["8",".",".",".","6",".",".",".","3"],
                                    ["4",".",".","8",".","3",".",".","1"],
                                    ["7",".",".",".","2",".",".",".","6"],
                                    [".","6",".",".",".",".","2","8","."],
                                    [".",".",".","4","1","9",".",".","5"],
                                    [".",".",".",".","8",".",".","7","9"]]
        Solution37().solveSudoku(&board)
        print(board)
    }
}
