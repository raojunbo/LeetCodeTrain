/*
 * @lc app=leetcode.cn id=24 lang=swift
 *
 * [24] 两两交换链表中的节点
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = head?.next
        head?.next = swapPairs(newHead?.next)
        newHead?.next = head
        return newHead
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
        
        let reversedNode =  Solution24().swapPairs(head)
        var temp = reversedNode
        while temp != nil {
            print(temp!.val)
            temp = temp?.next
        }
    }
}
// @lc code=end

