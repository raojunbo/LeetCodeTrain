/*
 * @lc app=leetcode.cn id=589 lang=swift
 *
 * [589] N叉树的前序遍历
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func preorder(_ root: Node?) -> [Int] {
    	//n 叉树的前序遍历
        var result:[Int] = []
        preorderT(root, result: &result)
        return result
    }
    
    func preorderT(_ root: Node?,result: inout [Int]) {
        guard let root = root else {
            return
        }
        result.append(root.val)
        for item in root.children {
            preorderT(item, result: &result)
        }
    }
    
    // n叉树的前序遍历
    // 第二变练习
//    func preorder2(_ root: Node?) -> [Int] {
//        
//    }
    static func test() {
            
    }
}
// @lc code=end

