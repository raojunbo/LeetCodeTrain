/*
 * @lc app=leetcode.cn id=75 lang=swift
 *
 * [75] 颜色分类
 像这种一次遍历的都需要采用多指针的方法；
 */

// @lc code=start
class Solution75 {
    func sortColors(_ nums: inout [Int]) {
        // 颜色分类,原地排序
        // 遇到0，从最前找找到最后一个0，
        // 遇到2，从最后向前找最后一个2
        // 也就是要记录一个前面的指针，记录一个后面的指针，一个cur的指针
        var left = 0
        var right = nums.count - 1
        var cur = 0;
        // 一遍扫描法
        while cur <= right {
            let tmp = nums[cur]
           
            if tmp == 0 {
                // 当前值为0，将0 移动到左边某个位置
                // 移动cur
                nums[cur] = nums[left]
                nums[left] = tmp
                left += 1
                cur += 1
            } else if tmp == 2 {
                // 当前值为 2, 将2 移动到右边某个位置
                // 不移动cur，目的在于nums[right] 可能还是2
                nums[cur] = nums[right]
                nums[right] = tmp
                right -= 1
            } else {
                cur += 1
            }
        }
        print(nums)
    }
    static func test() {
        let solution = Solution75()
        var nums: [Int] = [2, 0, 2, 1, 1 ,0]
        
        solution.sortColors(&nums)
    }
}
// @lc code=end

