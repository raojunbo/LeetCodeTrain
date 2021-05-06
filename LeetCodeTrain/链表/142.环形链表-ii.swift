/*
 * @lc app=leetcode.cn id=142 lang=swift
 *
 * [142] 环形链表 II
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

class Solution142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var p1 = head
        var p2 = head
        
        while  p2 != nil ,p1 != nil{
            p1 = p1?.next
            p2 = p2?.next?.next
            if p1 === p2{
                p2 = head
                while !(p2 === p1) {
                    p1 = p1?.next
                    p2 = p2?.next
                }
                return p2
            }
        }
        return nil
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
        tail?.next = head?.next
        let startValue = Solution142().detectCycle(head)
        print("\(startValue?.val)")
        
    }
}
// @lc code=end

