//
//  203. 移除链表元素.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/6.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 移除链表元素，比较简单的题目
// 链表在处理头结点为null的情况下。通常使用一个虚拟的头结点。
class Solution203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        // 遍历链表
        let vHead = ListNode(-1)
        vHead.next = head
        var p: ListNode? = head
        var pre: ListNode? = vHead
        while p != nil {
            if p?.val == val {
                pre?.next = p?.next
            } else {
                pre = p
            }
            p = p?.next
        }
        return vHead.next
    }
    static func test() {
        let head = createNode()
        let solution = Solution203()
        solution.removeElements(head, 6)
    }
    static func createNode() -> ListNode?{
        let array = [1,2,6,3,4,5,6]
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
