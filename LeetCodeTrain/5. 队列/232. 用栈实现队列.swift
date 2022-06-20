//
//  232. 用栈实现队列.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/7.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 用栈实现队列
// 整个的思路 两个栈，
// 入队：放入未放数据的栈，
// 出队：将一个栈的数据移动另一个栈，并取出最后的一个数据
class MyQueue {
    var stack1: [Int] = []
    var stack2: [Int] = []
    func push(_ x: Int) {
        
    }
    func pop() -> Int {
        return 1
    }
    func peek() -> Int {
        return 0
    }
    func empty() -> Bool {
        return false
    }
}
class Solution232 {
    // 第一次练习
    // 栈有哪些队列
    
    static func test() {
        let nums = [4,3,2,7,8,2,3,1]
        let solution = MyQueue()
    }
}
