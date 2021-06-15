//
//  2. 两数相加.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/7.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var cur1: ListNode? = l1
        var cur2: ListNode? = l2
        
        let vHead: ListNode? = ListNode(0)
        var newCur: ListNode? = vHead
        
        var flag: Int = 0 // 进位
        // 可以用虚拟节点
        while cur1 != nil || cur2 != nil {
            // 两者都有值
            var value: Int = 0
            if cur1 != nil {
                value += cur1!.val
            }
            if cur2 != nil {
                value += cur2!.val
            }
            value += flag
            
            flag = 0
            flag = value / 10
            value = value % 10
            // 创建新的节点
            let node = ListNode(value)
            newCur?.next = node
            newCur = node
        
            cur1 = cur1?.next
            cur2 = cur2?.next
        }
        // 最后还有一个进位
        if flag == 1{
            let node = ListNode(1)
            newCur?.next = node
            newCur = node
        }
        return vHead?.next
    }
    static func test() {
        let head1 = createNode()
        let head2 = createNode2()
        let solution = Solution2()
        let head3 = solution.addTwoNumbers(head1, head2)
        print(head3)
    }
    static func createNode() -> ListNode?{
        let array = [2,4,3]
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
    static func createNode2() -> ListNode?{
        let array = [5,6,4]
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
