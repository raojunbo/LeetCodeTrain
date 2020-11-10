/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
public class ListNode {
    public var val:Int
    public var next:ListNode?
    public init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

class Solution206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        //头插法(主要是熟悉操作)
        var p1:ListNode? = nil   //前一个节点
        var p2:ListNode? = head  //当前走的节点
        while p2 != nil {
            let tmpNext:ListNode? = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = tmpNext
        }
        return p1
    }
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        //递归法(实际上是利用栈)
        
        //递归跳出条件
        if head == nil || head?.next == nil {
            return head
        }
        
        //递归状态转移
        let node =  reverseList2(head?.next)
        
        //递归后结果收集
        head?.next?.next = head //交换本层级的节点
        head?.next = nil
        return node
    }
    
    //输入: 1->2->3->4->5->NULL
    //输出: 5->4->3->2->1->NULL
    
    //创建链表
    static func test()  {
        var head:ListNode?
        var tail:ListNode?
        for i in 1...5 {
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
        let reversedNode =  Solution206().reverseList2(head)
        var temp = reversedNode
        while temp != nil {
            print(temp!.val)
            temp = temp?.next
        }
    }
}


