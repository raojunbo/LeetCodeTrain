/*
 * @lc app=leetcode.cn id=141 lang=swift
 *
 * [141] 环形链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return false
        }
        var p1 = head
        var p2 = head?.next?.next
        var result = false
        while  p2 != nil {
            if p1 === p2{
                result = true
                break
            }
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        return result
    }
    
    static func test()  {
        var head:ListNode?
        var tail:ListNode?
        for i in 1...4 {
            let node = ListNode(i)
            if i == 1 {
                head = node
                tail = head
            }else {
                tail?.next = node
                node.next = nil
                tail = node
            }
        }
//        tail?.next = head?.next
        
        let has = Solution141().hasCycle(head)
        if  has {
            print("有环")
        }else {
            print("无环")
        }
    }
}
// @lc code=end

