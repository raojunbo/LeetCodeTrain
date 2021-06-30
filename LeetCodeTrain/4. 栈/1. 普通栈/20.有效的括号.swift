/*
 * @lc app=leetcode.cn id=20 lang=swift
 *
 * [20] 有效的括号
 //{[]}
 思路：
 很明显用一个队列就可解决
 只要是括号匹配的问题。都可以用栈来解决
 */

// @lc code=start
class Solution20 {
    func isValid(_ s: String) -> Bool {
        var stack:[String] = []
        for item in s {
            let top = stack.last
            if item == "]" && top == "["{
                stack.removeLast()
            } else if item == "}" && top == "{" {
                stack.removeLast()
            } else if item == ")" && top == "(" {
                stack.removeLast()
            }else {
                stack.append(String(item))
            }
        }
        if stack.count == 0 {
            return true
        }
        return false
    }
    // 第二次训练
    // 思路
    // 1. 逐个从头开始入栈
    // 2. 栈顶与即将要入栈的元素匹配,出栈
    // 3. 不匹配，入栈
    // 4知道栈为空为止
    func isValid2(_ s: String) -> Bool {
        var stack:[String] = []
        for item in s {
            let last = stack.last
            if item == ")" && last == "(" {
                stack.removeLast()
            } else if item == "}" && last == "{" {
                stack.removeLast()
            } else if item == "]" && last == "["{
                stack.removeLast()
            } else {
                stack.append(String(item))
            }
        }
        return stack.count > 0 ? false : true
    }
    
    class func test() {
    let str = "()[]{}"
      print(Solution20().isValid2(str))
    }
}
// @lc code=end

