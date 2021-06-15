/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
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

class Solution21 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //采用迭代法
        let preHead:ListNode? = ListNode(0)
        var p1:ListNode? = l1
        var p2:ListNode? = l2
        var tail:ListNode?  = preHead
        
        while p1 != nil || p2 != nil {
            guard let tmp1 = p1 else {
                tail?.next = p2
                break
            }
            guard let tmp2 = p2 else {
                tail?.next = p1
                break
            }
            if tmp1.val <= tmp2.val {
                tail?.next = p1
                p1 = p1?.next
                
            }else {
                tail?.next = p2
                p2 = p2?.next
            }
            tail = tail?.next
            
        }
        return preHead?.next
    }
    
    // 采用分治法
    // 合并链表：子问题为合并两个很小的链表，这两个小链表最终有解法。
    // 整个的思想，就是我想合并两个链表，当前头比较已经出来，我只需要合并剩下的两个链表，以此类推。
    // 这就是一种分治的思想
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let tmpl1 = l1 else {
            return l2
        }
        guard let tmpl2 = l2 else {
            return l1
        }
        
        if tmpl1.val <= tmpl2.val {
            tmpl1.next = mergeTwoLists2(tmpl1.next, tmpl2)
            return tmpl1
        }else {
            tmpl2.next = mergeTwoLists2(tmpl1, tmpl2.next)
            return tmpl2
        }
    }
    

    class func test()  {
        let link1 = createLink(begin: 1,end: 5)
        let link2 = createLink(begin: 3,end: 9)
        let head:ListNode? =  Solution21().mergeTwoLists2(link1, link2)
        var cur:ListNode? = head
        while cur != nil {
            print(cur?.val ?? "")
            cur = cur?.next
        }
    }
    
    class func createLink(begin:Int,end:Int) -> ListNode? {
        var head:ListNode?
        var tail:ListNode?
        for i in begin...end {
            let node = ListNode(i)
            if head == nil {
                head = node
                tail = head
            }
            tail?.next = node
            node.next = nil
            tail = node
        }
        
        return head
    }
}
// @lc code=end

