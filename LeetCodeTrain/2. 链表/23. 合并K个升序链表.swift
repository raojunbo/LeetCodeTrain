//
//  23. 合并K个升序链表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/23.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution23 {
    // 使用优先队列
    // 两两合并
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return merge(lists, 0, lists.count - 1)
    }
    func merge(_ lists: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return lists[left]
        }
        if left > right {
            return nil
        }
        let mid = (left + right) / 2
        return mergeTow(oneList: merge(lists, left, mid), twoList: merge(lists, mid + 1, right))
    }
    // 合并两个链表
    func mergeTow(oneList: ListNode?,twoList: ListNode?) -> ListNode? {
        let newHead = ListNode(-1)
        var p: ListNode? = newHead
        var p1: ListNode? = oneList
        var p2: ListNode? = twoList
        while p1 != nil , p2 != nil{
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
    
    static func test() {
        let link1 = [1,4,5]
        let link2 = [1,3,4]
        let link3 = [2,6]
        
        let root1 = createNode(link1)
        let root2 = createNode(link2)
        let root3 = createNode(link3)
        let lists = [root1,root2,root3]
        
        let solution = Solution23()
        let result = solution.mergeKLists(lists)
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
