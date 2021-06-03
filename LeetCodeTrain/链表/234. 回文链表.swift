//
//  234. 回文链表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/9.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

// 判定一个链表是否是回文链表
// 找到中间节点
// 反转后半部分节点
class Solution234 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head
        let midHead = findMid(head)
        var reveredHead = reverse(midHead?.next)
        while reveredHead != nil {
            if reveredHead?.val != head?.val {
                return false
            }
            reveredHead = reveredHead?.next
            head = head?.next
        }
        return true
    }
    // 怎么去找中间结点,采用快慢指针
    func findMid(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    // 怎么去反转一个链表
    func reverse(_ node: ListNode?) -> ListNode? {
        var head = node
        var newHead: ListNode? = nil
        while head != nil {
            let tmp = head?.next
            head?.next = newHead
            newHead = head
            head = tmp
        }
        return newHead
    }
    static func test(){
        let root: ListNode? = createNode()
        let solution = Solution234()
        let result = solution.isPalindrome(root)
        print(result)
    }
    static func createNode() -> ListNode{
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(2)
        let node4 = ListNode(1)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
    
        return node1
    }
    
}
