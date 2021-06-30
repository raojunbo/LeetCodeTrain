//
//  40. 组合总和II.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/28.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 每个数字只能使用一次
 这里主要是体现怎么去重
 */
class Solution40 {
    var result: [[Int]] = []
    var used: [Bool] = []
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return []
        }
        var path: [Int] = []
        let orderCan = candidates.sorted()
        used = Array(repeating: true, count: candidates.count)
        backTrance(orderCan, target, start: 0, path: &path)
        return result
    }
    func backTrance(_ candidates: [Int], _ target: Int, start: Int, path: inout [Int]) {
        if target == 0 {
            result.append(path)
            return
        }
        for i in start..<candidates.count {
            let item = candidates[i]
            // 这个剪枝在这里有相当的重要作用
            if target - i < 0{
                return
            }
            // 排完序后，在层级进行取重
            // 使用used[i-1] = true 表示同一树枝上使用过
            // 使用used[i - 1] = false 表示同一层上使用过
            if i > 0 && item == candidates[i - 1] && used[i - 1] == false {
                // 防止连续的是一样的值
                used[i] = false
                continue
            }
            path.append(item)
            used[i] = true;
            backTrance(candidates, target - item, start: i + 1,path: &path)
            used[i] = false // 回到本层，表示本层使用过
            path.removeLast()
        }
    }
    static func test() {
        let candidates = [2,5,2,1,2]
        let solution = Solution40()
        let result = solution.combinationSum2(candidates, 5)
        print(result)
    }
}
