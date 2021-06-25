//
//  剑指 Offer 33. 二叉搜索树的后序遍历序列.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class SolutionSord33 {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        return verifyPostorderSection(postorder, begin: 0, end: postorder.count - 1)
    }
    func verifyPostorderSection(_ postorder: [Int], begin: Int, end: Int) -> Bool {
        if begin >= end {
            return true
        }
        let root = postorder[end]
        var rootMay = begin
        
        // 在左边寻找位置
        for index in begin...end {
            let val = postorder[index]
            rootMay = index
            if val > root {
                break
            }
        }
        // root 一定是小于右边区域的
        for index in rootMay...end {
            let val = postorder[index]
            if val < root {
                return false
            }
        }
        
        let leftResult = verifyPostorderSection(postorder, begin: begin, end: rootMay - 1)
        let rightResult = verifyPostorderSection(postorder, begin: rootMay, end: end - 1)
        
        return leftResult && rightResult
    }
    static func test() {
        let solution = SolutionSord33()
//        let array: [Int] = [5,7,6,9,11,10,8]
        let array: [Int] = [4,6,7,5]
        let result = solution.verifyPostorder(array)
        print(result)
    }
}
