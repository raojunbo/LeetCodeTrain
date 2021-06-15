//
//  86. 分隔链表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/9.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let p1: ListNode? = ListNode(-1)
        let p2: ListNode? = ListNode(-1)
       
        var p1cur: ListNode? = p1
        var p2cur: ListNode? = p2
        var cur: ListNode? = head
        
        while cur != nil {
            if cur!.val < x {
                p1cur?.next = cur
                p1cur = p1cur?.next
            } else {
                p2cur?.next = cur
                p2cur = p2cur?.next
            }
            cur = cur?.next
        }
        // 连接p1 与 p2
        p1cur?.next = p2?.next
        p2cur?.next = nil
        return p1?.next
    }
    static func test(){
        let root: ListNode? = createNode()
        let solution = Solution86()
        let result = solution.partition(root, 3)
        print(result)
    }
    static func createNode() -> ListNode{
        let node1 = ListNode(1)
        let node2 = ListNode(4)
        let node3 = ListNode(3)
        let node4 = ListNode(2)
        let node5 = ListNode(5)
        let node6 = ListNode(2)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        return node1
    }
}
