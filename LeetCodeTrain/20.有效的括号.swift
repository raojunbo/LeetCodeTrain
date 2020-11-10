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
    class func test() {
    let str = "()"
      print(Solution20().isValid(str))
    }
}
// @lc code=end

