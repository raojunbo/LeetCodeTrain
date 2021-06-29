//
//  39. 组合总和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/20.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

// 组合总和
// 穷尽问题
// 怎么去穷举
// 实际上是一种深度优先遍历的方法
class Solution39 {
    var result:[[Int]] = []
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var path: [Int] = []
        // 排序后能去重
        let orderCandidates = candidates.sorted()
        backTrace(_candidates: orderCandidates, target, 0 ,path: &path)
        return result
    }
    
    func backTrace(_candidates: [Int], _ target: Int, _ start: Int, path: inout [Int]) {
        // 递归结束
        if target == 0 {
            result.append(path)
            return
        }
        // 递归表达式
        for index in start..<_candidates.count {
            if target < _candidates[index] {
                return
            }
            // 相连的不用重复
            if index > 0 && _candidates[index] == _candidates[index-1] {
                continue
            }
            // 加入路径
            path.append(_candidates[index])
            backTrace(_candidates: _candidates, target - _candidates[index], index, path: &path)
            // 移除路径
            path.removeLast()
        }
    }
    
    
    // 第二次练习
    // 初步分析可以用动态规划，但也可以用回溯方法
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        if candidates.count == 0 {
            return result
        }
        
        let path = [Int]()
        // 这里排序后，能保证找个回溯算法能走完所有的情况。
        let newCandidates = candidates.sorted()
        dfs(newCandidates, target, 0, path, &result)
        return result
    }
    
    func dfs(_ candidates: [Int], _ target: Int, _ begin: Int, _ path: [Int], _ result: inout [[Int]]) {
        if target == 0 {
            result.append(path)
            return
        }
        
        for i in begin..<candidates.count {
            if target - candidates[i] < 0 {
                break
            }
            var path = path
            path.append(candidates[i])
            dfs(candidates, target - candidates[i], i, path, &result)
            path.removeAll()
        }
    }
    
    static func test() {
        let candidates = [2,7,6,3,5,1]
        
        let solution = Solution39()
        let result = solution.combinationSum2(candidates, 9)
        print(result)
    }
}
