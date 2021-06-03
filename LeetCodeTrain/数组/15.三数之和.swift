/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */

// @lc code=start
// 说实话，这个题目有点难度
// 利用双指针
// 利用排序
// 以及怎么去重都是难题
class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        //至少是3元素
        if nums.count < 3 {
            return []
        }
        //先排序
        var mnums  = nums
        mnums.sort()
        
        //两头指针
        var array:[[Int]] = []
        var hasAdd = false
        // 外循环为目标
        for target in 0...mnums.count-1 {
            // taget 也要去重
            if hasAdd && mnums[target] == mnums[target - 1] {
                continue
            }
            hasAdd = true
            // 从target的下一个位置开始遍历
            var p1 = target + 1
            var p2 = mnums.count - 1
            // 内循环两边夹击
            while p1 < p2  {
                let sum =  mnums[p1] + mnums[p2] + mnums[target]
                if sum < 0{
                    // 向右移动
                    p1 = p1 + 1
                }else if sum > 0 {
                    // 向左移动
                    p2 = p2 - 1
                } else {
                    array.append([mnums[p1],mnums[target],mnums[p2]])
                    // 当相等时,p1 与 p2 去重
                    while p1 < p2, mnums[p1] == mnums[p1 + 1] {
                        p1 = p1 + 1
                    }
                    while p1 < p2, mnums[p2] == mnums[p2 - 1] {
                        p2 = p2 - 1
                    }
                    p1 = p1 + 1
                    p2 = p2 - 1
                }
            }
        }
        return array
    }
    static func test() {
        let solution = Solution15()
//        let nums = [0,0,0,0]
        let nums = [-1,0,1,2,-1,-4]
        let result = solution.threeSum(nums)
        print(result)
    }
}

// @lc code=end

