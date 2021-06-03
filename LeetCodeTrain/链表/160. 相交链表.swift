//
//  160. 相交链表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/7.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 相交链表
//如果两个链表没有交点，返回 null.
//在返回结果后，两个链表仍须保持原有的结构。
//可假定整个链表结构中没有循环。
//程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
//
// 链表的环；如何确定链表的环的起始点；
// 这里好好理解；

class Solution160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var head1: ListNode? = headA
        var head2: ListNode? = headB
        while head1 !== head2 {
            if head1 != nil {
                head1 = head1?.next
            } else {
                head1 = headB
            }
            if head2 != nil {
                head2 = head2?.next
            } else {
                head2 = headA
            }
        }
        return head1
    }
    static func test() {
        
    }
    static func createNode() -> ListNode?{
        let array = [4,1,8,4,5]
        var head: ListNode?
        var p: ListNode?
        for item in array {
            if head == nil {
                head = ListNode(item)
                p = head
            } else {
                let cur = ListNode(item)
                p?.next = cur
                p = cur
            }
        }
        return head
    }
}
