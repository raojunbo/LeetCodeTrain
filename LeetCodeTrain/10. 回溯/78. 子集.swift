//
//  78. 子集.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 子集
// 这实际上是一种动态规划的思想
class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        for i in 0..<nums.count {
            let newResult = createNew(nums, result: &result, i)
            result.append(contentsOf: newResult)
        }
        result.insert([], at: 0)
        return result
    }
    func createNew(_ numss: [Int], result: inout [[Int]],_ index: Int) -> [[Int]] {
        var newArray:[[Int]] = []
        newArray.append([numss[index]])
        // 在原有数组基础上添加新的元素
        for i in 0..<result.count {
            var item = result[i]
            item.append(numss[index])
            newArray.append(item)
        }
        return newArray
    }
    
    
    
    // 第二遍练习
    // 求集合，要想保证集合的唯一性
    // 回溯算法有两个关键的地方
    // start 进来后for循环的起点
    // start 的下一个递归起点是什么
    var path: [Int] = []
    var result: [[Int]] = [[]]
    func subsets2(_ nums: [Int]) -> [[Int]] {
        backTrace2(nums, start: 0)
        return result
    }
    
    func backTrace2(_ nums: [Int], start: Int) {
        if start >= nums.count {
            return
        }
        for i in start..<nums.count {
            path.append(nums[i])
            // 每一条路径都得加入
            result.append(path)
            // start 是i + 1 是关键;表示从后面递归遍历的取值，这样保证原始不重复取(关键)
            backTrace2(nums, start: i + 1)
            path.removeLast()
        }
    }
    static func test(){
        let solution = Solution78()
        let nums = [1,2,3]
        let result = solution.subsets2(nums)
        print(result)
    }
}
