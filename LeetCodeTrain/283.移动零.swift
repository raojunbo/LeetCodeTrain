/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 */

// @lc code=start
//[0,1,0,3,12]
//遍历。是0将后面的
/**
 测试数据
 
 */
class Solution283 {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0
        var noZeroIndex = 0
        if nums.count <= 1 {
            return
        }
        while index < nums.count {
            let value = nums[index]
            if value != 0 {
                nums[noZeroIndex] = value
                if(noZeroIndex != index){
                    nums[index] = 0
                }
                noZeroIndex += 1
            }
            index += 1
        }
    }
}
// @lc code=end

