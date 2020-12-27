/*
 * @lc app=leetcode.cn id=98 lang=swift
 *
 * [98] 验证二叉搜索树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution98 {
    //递归的写法就是找到条件。找到递归表达式
    
    //搜索树的本质，是每个节点的都有最大值与最小值
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return helper(root, min: -Int.max, max: Int.max)
    }
    
    func helper(_ node: TreeNode?, min:Int,max:Int) -> Bool {
        guard let node = node else {
            return true
        }
        //当前节点比最小值还小
        if node.val <= min  {
            return false
        }
        //当前节点比最大值还大
        if node.val >= max {
            return false
        }
        //看右节点是否满足
        if !helper(node.right, min: node.val, max: max) {
            return false
        }
        //看左节点是否满足
        if !helper(node.left, min: min, max: node.val) {
            return false
        }
        return true
    }
    
    //搜索二叉树的中序遍历是一个有序的特征
    func isValidBST2(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        var lastValue = Int.min
        var isValid = true
        midOrder(root,&lastValue,&isValid)
        return isValid
    }
    
    func midOrder(_ node: TreeNode?,_ last:inout Int,_ isValid:inout Bool) {
        //左根右
        guard let node = node else {
            return
        }
        midOrder(node.left,&last,&isValid)
        if node.val <= last {
            isValid = false
        } else {
            last = node.val
        }
        midOrder(node.right,&last,&isValid)
    }
    
    static func test() {
        //测试1
//        let node2:TreeNode = TreeNode(2)
//        let node1 = TreeNode(1)
//        let node3 = TreeNode(3)
//
//        node2.left = node1
//        node2.right = node3
        
        //测试2
//        let node5 = TreeNode(5)
//        let node1 = TreeNode(1)
//        let node4 = TreeNode(4)
//        let node3 = TreeNode(3)
//        let node6 = TreeNode(6)
//        node5.left  = node1
//        node5.right = node4
//        node4.left = node3
//        node4.right = node6
//
        //测试3
//        let node10 = TreeNode(10)
//        let node5 = TreeNode(5)
//        let node15 = TreeNode(15)
//        let node6 = TreeNode(6)
//        let node20 = TreeNode(20)
//
//        node10.left = node5
//        node10.right = node15
//        node15.left = node6
//        node15.right = node20
        
        //测试4
        let node5 = TreeNode(5)
        let node1 = TreeNode(1)
        let node4 = TreeNode(4)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        
        node5.left = node1
        node5.right = node4
        node4.left = node3
        node4.right = node6
        
        let solution:Solution98 = Solution98()
        let result = solution.isValidBST2(node5)
        print(result)
        
    }
}
// @lc code=end

