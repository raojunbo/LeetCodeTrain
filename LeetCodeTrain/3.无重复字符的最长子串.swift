/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution3 {
    // 思路
    // "abcabcbb"
    // 以某一个字符结尾的最长子串
    // 这实际上是一种穷举法
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var array = Array(s)
        var result = 0
        var lastLength = 0
        // 以index结尾的字符的长度
        for iIndex in 0..<array.count  {
           
            let currC = array[iIndex]
           
            var tmpResult = 1 //abcaabcbb
            if iIndex == 0 {
                result = tmpResult
                lastLength = result
                continue
            }
            // 向左查找, 看最长能达多长，向左查找的长度为上一个字符的最长长度
            for jIndex in (iIndex - lastLength..<iIndex).reversed() {
                if currC != array[jIndex] {
                    tmpResult += 1
                } else {
                    break
                }
            }
            lastLength = tmpResult
            if tmpResult > result {
                result = tmpResult
            }
        }
        return result
    }
    // 这是最优解
    func lengthOfLongestSubstring3(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        // 整个思路
        // 上次该字符出现的最近位置
        // 当前出现这个字符时，算出值
        // 与目前的最长字符相比较
        // 得出最值
        var cache = [Character: Int]()
        var start = 0, end = 0, res = 0
        for item in s {
            // 如果历史存位置
            if let oldL = cache[item] {
                // item是否存在于上次最长串里面
                // 选中oldL + 1 表示在最长串里面
                // 选中start 表示不在最长串里面
                start = max(oldL + 1, start)
            }
            cache[item] = end
            res = max(end - start + 1, res)
            end += 1
        }
        return res
    }
    
    static func test() {
        let solution = Solution3()
        let str = "abcaabcbb"
        let result = solution.lengthOfLongestSubstring3(str)
        print(result)
    }
}
// @lc code=end

