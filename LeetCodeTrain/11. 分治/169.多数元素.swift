/*
 * @lc app=leetcode.cn id=169 lang=swift
 *
 * [169] 求众数
 */

// @lc code=start
class Solution169 {
    func majorityElement(_ nums: [Int]) -> Int {
        // 整个过程
        // 当将一个数组分成两半时,两边必定有一个多数元素
        // 求出左边的多数元素，与求出右边的多数元素过程，与全部的一样。
        // 所以整个的是一个递推的过程；
        // 时间复杂度是nlogn,空间复杂度（系统调用栈空间）也是logn
        return majority(nums, start: 0, end: nums.count - 1)
    }
    func majority(_ nums: [Int], start: Int, end: Int) -> Int {
        if start == end {
            return start
        }
        let mid = (start + end) / 2
        let leftIndex = majority(nums, start: start, end: mid)
        let rightIndex = majority(nums, start: mid + 1, end: end)
        var m = leftIndex
        // 若果两边相等
        if nums[leftIndex] == nums[rightIndex] {
            // 比较个数
            var lCount = countM(nums, m: leftIndex, start: start, end: end)
            var rCount = countM(nums, m: rightIndex, start: start, end: end)
            if lCount > rCount {
                m = lCount
            } else {
                m = rCount
            }
        } else {
            if nums[leftIndex] < nums[rightIndex] {
                m = rightIndex
            } else {
                
            }
        }
        return 1
    }
    func countM(_ nums: [Int], m: Int,start: Int, end: Int) -> Int {
        var count = 0
        for index in start...end {
            if nums[index] == nums[m] {
                count = count + 1
            }
        }
        return count
    }
    
    static func test(){
        let array = [2, 2, 1 ,1 ,1 ,2 ,2]
        let solution = Solution169()
        let res = solution.majorityElement(array)
        print(res)
    }
}
// @lc code=end

