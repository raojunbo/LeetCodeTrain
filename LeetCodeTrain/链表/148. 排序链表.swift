//
//  148. 排序链表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/23.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        // 寻找中间节点
        let midNode = findMid(head)
        let rightHead = midNode?.next
        midNode?.next = nil
        
        // 左边
        let leftSortNode = sortList(head)
        // 右边
        let rightSortNode = sortList(rightHead)
        // 合并
        let root = mergeSortedList(leftSortNode, rightSortNode)
        return root
    }
    // 合并有序链表
    func mergeSortedList(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        let newHead = ListNode(-1)
        var p: ListNode? = newHead
        var p1: ListNode? = left
        var p2: ListNode? = right
        
        while p1 != nil , p2 != nil {
            if p1!.val <= p2!.val {
                p?.next = p1
                p1 = p1?.next
            } else {
                p?.next = p2
                p2 = p2?.next
            }
            p = p?.next
        }
        if p1 != nil {
            p?.next = p1
        }
        if p2 != nil {
            p?.next = p2
        }
        return newHead.next
    }
    
    // 寻找链表的中间节点
    func findMid(_ head: ListNode?) -> ListNode? {
        // head 为空，或者只有一个值
        if head == nil || head?.next == nil {
            return head
        }
        // 采用快慢指针
        
        // 创建伪头节点
        let newHead = ListNode(-1)
        newHead.next = head
        
        // p1 走一步
        var p1: ListNode? = newHead
        // p2 走两步
        var p2: ListNode? = newHead
        while p1 != nil {
            if p2 == nil {
                break
            }
            if p2?.next == nil {
                break
            }
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        return p1
    }
    static func test() {
        let head = [4, 2, 1, 3]
        let root = createNode(head)
        let solution = Solution148()
        let result = solution.sortList(root)
        print(result)
    }
    
    static func createNode(_ link: [Int]) -> ListNode?{
        var root: ListNode?
        var p: ListNode?
        for item in link {
            if root == nil {
                root = ListNode(item)
                p = root
            } else {
                p?.next = ListNode(item)
                p = p?.next
            }
        }
        return root
    }
}
