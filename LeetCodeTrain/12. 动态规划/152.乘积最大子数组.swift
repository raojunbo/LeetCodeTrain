/*
 * @lc app=leetcode.cn id=152 lang=swift
 *
 * [152] 乘积最大子序列
 */

// @lc code=start
class Solution152 {
    // 第二遍（还没有形成条件反射）
    // 定义dp[i] 以i结尾的最大子数组
    // 求最大值时需要利用最小值。所以还需要将最小值保存
    // 这里在写代码时有个技巧。当存储的数据的i不够时，可以将数组的宽度放大
    func maxProduct(_ nums: [Int]) -> Int {
        var dpmax = Array(repeating: 1, count: nums.count + 1)
        var dpmin = Array(repeating: 1, count: nums.count + 1)
        for i in 1...nums.count {
            let v = nums[i - 1]  // 当前值
            let curMax = dpmax[i - 1] * v // 最大值与现有的值的乘积
            let curMin = dpmin[i - 1] * v // 最小值与现有的值的乘积
            // 实际上是比较上面三者之间的最大值
            dpmin[i] = min(v, curMax,curMin)
            dpmax[i] = max(v, curMax,curMin)
        }
        // 真正的有效值时从1开始
        var result = dpmax[1]
        for i in 1...nums.count {
            if dpmax[i] > result {
                result = dpmax[i]
            }
            if dpmin[i] > result {
                result = dpmin[i]
            }
        }
        return result
    }
    // 内存上进行优化
    // 考虑到实际的值，只是运用到了前面几个值
    func maxProduct2(_ nums: [Int]) -> Int {
        var pmax = 1
        var pmin = 1
        var result = Int.min
        for i in 0..<nums.count {
            let v = nums[i]
            let curMax = pmax * v
            let curMin = pmin * v
            pmax = max(v, curMax, curMin)
            pmin = min(v,curMin,curMax)
            if pmax > result {
                result = pmax
            }
            if pmin > result {
                result = pmin
            }
        }
        return result
    }
    
    static func test() {
        let array = [-2,0,-1]
        let result = Solution152().maxProduct2(array)
        print(result)
    }
}
// @lc code=end

