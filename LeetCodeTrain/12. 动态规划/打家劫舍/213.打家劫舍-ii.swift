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
    // 第二遍练习
    // 实际上就是比较0-(n - 1) ，1-(n-2)的比较大小
    func rob2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        let one = oneRob2(start: 0, end: nums.count - 2, nums: nums)
        let two = oneRob2(start: 1, end: nums.count - 1, nums: nums)
        return max(one, two)
    }
    
    func oneRob2(start: Int, end: Int, nums: [Int]) -> Int {
        var x = 0 // 最左一个值
        var y = 0 // 次左值
        var z = 0 // 当值
        for i in start...end {
            y = z
            z = max(y, x + nums[i])
            x = y
        }
        return z
    }

    static func test() {
        let array = [2,3,2]
//        let array = [4,1,2,7,5,3,1]
        let result = Solution213().rob2(array)
        print(result)
    }
}
// @lc code=end

