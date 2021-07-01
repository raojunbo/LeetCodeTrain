/*
 * @lc app=leetcode.cn id=155 lang=swift
 *
 * [155] 最小栈
 用一个辅助栈，每次入栈时将最小值入辅助栈
 */

// @lc code=start

class MinStack155 {
    var stack: [Int]
    var minStack: [Int]
    
    
    /** initialize your data structure here. */
    init() {
        stack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            minStack.append(min(x, minStack.last!))
        }
    }
    
    func pop() {
        if !stack.isEmpty {
            minStack.removeLast()
            stack.removeLast()
        }
    }
    
    func top() -> Int {
        if stack.isEmpty {
            return -1
        }
        return stack.last!
    }
    
    func getMin() -> Int {
        if minStack.isEmpty {
            return -1
        }
        return minStack.last!
    }
    
    class func test() {
        let stack =  MinStack155()
        stack.push(-2)
        stack.push(0)
        stack.push(-3)
        print(stack.getMin())
        stack.pop()
        stack.pop()
        print(stack.getMin())
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
// @lc code=end

