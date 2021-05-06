/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
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
class Solution25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        //下次跌的
        var newHead = head
        var  tmpk = 0
        while newHead != nil, tmpk < k{
            tmpk = tmpk + 1
            newHead = newHead?.next
        }
        
        if newHead == nil {
            return head
        }else {
            //给定头与尾，进行反转
            let newHead = reverseSub(head: head, tail: newHead)
            let node = reverseKGroup(newHead?.next, k)
            newHead?.next = head
            return newHead
        }
    }
    
    func reverseSub(head:ListNode?,tail:ListNode?) -> ListNode? {
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
        
        let reversedNode =  Solution25().reverseKGroup(head,2)
        head = reversedNode
        while head != nil {
            print(head!.val)
            head = head?.next
        }
    }
}
// @lc code=end

