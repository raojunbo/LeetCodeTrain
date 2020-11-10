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
        for target  in 1...mnums.count-1 {
            var p1 = 0
            var p2 = mnums.count - 1
            //怎么去除重复
//            if mnums[p1] == mnums[target] {
//                continue
//            }
            while p1 < target,p2 > target {
                let sum =  mnums[p1] + mnums[p2] +  mnums[target]
                if sum < 0{
                    p1 = p1+1
                }else if sum > 0 {
                    p2 = p2 - 1
                }else {
                    array.append([mnums[p1],mnums[target],mnums[p2]])
                    break
                }
            }
        }
        return array
    }
}

// @lc code=end

