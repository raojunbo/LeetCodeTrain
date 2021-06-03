/*
 * @lc app=leetcode.cn id=84 lang=swift
 *
 * [84] 柱状图中最大的矩形
 */

class Solution84 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 1 {
            return heights[0]
        }
        // 前后弄两个哨兵
        let heights = [0] + heights + [0]
        var stack: [Int] = []
        stack.append(0)
        var result = 0
        for i in 1..<heights.count {
            // 新的值比栈顶的值小
            while heights[i] < heights[stack.last!] {
                // 要求栈顶的高度
                let height = heights[stack.removeLast()]
                // 当前index - 栈顶的index - 1
                let width = i - stack.last! - 1
                result = max(result, width * height)
            }
            stack.append(i)
        }
        return result
    }
    
    // 维持一个单调递增的栈
    static func test() {
        let height = [2,1,5,6,2,3]
//        let height = [2,1,2]
        let solution = Solution84()
        let result = solution.largestRectangleArea(height)
        print(result)
    }
}

