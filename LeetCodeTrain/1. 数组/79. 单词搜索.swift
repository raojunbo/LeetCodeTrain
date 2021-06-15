//
//  79. 单词搜索.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 下面实际上是一种深度优先遍历
// 深度优先遍历，回溯方法
// 这种带匹配的。经典的深度优先遍历
class Solution79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let words: [Character] = Array(word)
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board.first!.count), count: board.count)
        
        let rowCount = board.count
        let columnCount:Int = board.first!.count
        for i in 0..<rowCount {
            for j in 0..<columnCount {
                let flag = match(board, visited: &visited, i: i, j: j,words: words, index: 0)
                if flag {
                    return true
                }
            }
        }
        return false
    }
    func match(_ board: [[Character]], visited: inout [[Bool]], i: Int, j:Int,words:[Character],index: Int) -> Bool {
        if words[index] != board[i][j] {
            return false
        } else if index == words.count - 1{
            return true
        }
        // 标记本节点访问过
        visited[i][j] = true
        
        // 定义四个方向
        let directions: [[Int]] = [[0,1],[0,-1],[1,0],[-1,0]]
        var result = false
        // 遍历四个方向,继续相下探索
        for direction in directions {
            let newI = i + direction[0]
            let newJ = j + direction[1]
            if newI >= 0, newI < board.count, newJ >= 0, newJ < board.first!.count {
                if !visited[newI][newJ] {
                    // 检测该点的下一个点
                    let flag = match(board, visited: &visited, i: newI, j: newJ, words: words, index: index + 1)
                    if flag {
                        result = true
                        break
                    }
                }
            }
        }
        visited[i][j] = false
        return result
    }
    
    static func test() {
        let board = [Array("ABCE"),Array("SFCS"),Array("ADEE")]
        let solution = Solution79()
        let result = solution.exist(board, "SEE")
        print(result)
    }
    
}
