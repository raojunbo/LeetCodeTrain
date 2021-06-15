/*
 * @lc app=leetcode.cn id=45 lang=swift
 *
 * [45] 跳跃游戏 II
 */

// @lc code=start
class Solution45 {
    func jump(_ nums: [Int]) -> Int {
        //贪心算法，每次都以最大的步伐去走
        var steps = 0
        var maxPosition = 0
        var end = 0
        for i in 0..<nums.count - 1 {
            maxPosition = max(maxPosition, nums[i] + i)
            if i == end {
                end = maxPosition
                steps += 1
            }
        }
        return steps
    }
    
    static func test() {
        let nums = [2,3,1,1,4]
        let result = Solution45().jump(nums)
        print(result)
    }
}
// @lc code=end

