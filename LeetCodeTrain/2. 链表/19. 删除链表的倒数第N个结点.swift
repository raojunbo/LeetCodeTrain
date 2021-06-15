//
//  19. 删除链表的倒数第N个结点.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/20.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 搞一个假节点
        let newHead = ListNode(-1)
        newHead.next = head
        var slow: ListNode? = newHead
        var fast: ListNode? = newHead
        var fastStep = 0
        while slow != nil , fast != nil {
            if fastStep > n {
                slow = slow?.next
                fast = fast?.next
            } else {
                fast = fast?.next
            }
            fastStep = fastStep + 1
        }
        
        // slow 为要删除节点的上一个节点
        slow?.next = slow?.next?.next
        
        return newHead.next
    }
    

    static func test(){
        var rootNode:ListNode?
        var pNode: ListNode?
        let array = [1]
        for item in array {
            let node = ListNode(item)
            if rootNode == nil {
                rootNode = node
                pNode = rootNode
            } else {
                pNode?.next = node
                pNode = pNode?.next
            }
        }
        let solution = Solution19()
        let result = solution.removeNthFromEnd(rootNode, 1)
        print(result)
    }
}
