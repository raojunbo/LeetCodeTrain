/*
 * @lc app=leetcode.cn id=213 lang=swift
 *
 * [213] 打家劫舍 II
 */

// @lc code=start
class Solution213 {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        let one = oneRob(Array(nums[0...nums.count - 2]))
        let two = oneRob(Array(nums[1...nums.count - 1]))
        return max(one, two)
    }
    func oneRob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var last1 = 0
        var last2 = 0
        var cur = 0
        for i in 0..<nums.count {
            if i == 0 {
                last2 = nums[0]
                continue
            }
            if i == 1 {
                last2 = max(nums[0], nums[1])
                last1 = nums[0]
                continue
            }
          
            cur = max(last2, last1 + nums[i])
            last1 = last2
            last2 = cur
        }
        return last2
    }
    static func test() {
        let array = [2,3,2]
        let result = Solution213().rob(array)
        print(result)
    }
}
// @lc code=end

