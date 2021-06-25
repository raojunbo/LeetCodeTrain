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
class SolutionSord7 {
    // 给定前序遍历，中序遍历
    // 重建二叉树
    // 用中前序定根
    // 用中序定范围
    // 将程序转化成递归
    var preorder: [Int] = []
    var inorder: [Int] = []
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count != inorder.count {
            return nil
        }
        self.preorder = preorder
        self.inorder = inorder
        
        return buildSubTree(beginPre: 0, endPre: self.preorder.count - 1, beginInOrder: 0, endInOrder: self.inorder.count - 1)
    }
    func buildSubTree(beginPre: Int, endPre: Int, beginInOrder: Int, endInOrder: Int) -> TreeNode? {
        // 递归退出条件
        if beginPre > endPre {
            return nil
        }
        if beginInOrder > endInOrder {
            return nil
        }
        
        // 构建子树节点
        let rootVal = preorder[beginPre]
        let rootNode = TreeNode()
        rootNode.val = rootVal
        
        // 在中序遍历中找到根节点的索引
        var tmpEndInOrder = endInOrder
        for index in beginInOrder...endInOrder {
            let nodeVal = inorder[index]
            if rootVal == nodeVal {
                tmpEndInOrder = index
                break
            }
        }
        
        // pre的结束点
        let length = tmpEndInOrder - beginInOrder
        let tmpEndPre = beginPre + length
        
        // 递归构建左子树
        rootNode.left = buildSubTree(beginPre: beginPre + 1, endPre: tmpEndPre, beginInOrder: beginInOrder, endInOrder: tmpEndInOrder - 1)
        // 递归构建右子树
        rootNode.right = buildSubTree(beginPre: tmpEndPre + 1, endPre: endPre, beginInOrder: tmpEndInOrder + 1, endInOrder: endInOrder)
        
        return rootNode
    }
    
    static func test() {
        let preoerder = [1,2,4,7, 3,5, 6,8]
        let inorder = [4,7,2,1,  5,3, 8,6]
        let root = SolutionSord7().buildTree(preoerder, inorder)
        
        print(root)
    }
}
