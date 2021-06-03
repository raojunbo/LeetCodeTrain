/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 */

/*
 一周两课
 思路：
 一个hash表；key为下标，value为值
 target - value  = value 是否存在
 时间复杂度为o(n)
 */
/**已经通过*/

class Solution1 {
    var hasMap:[Int:Int] = [:]
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //遍历，然后一个个加入hash表里；并且判定下一个是否满足；
        for index in 0...nums.count - 1 {
            let item = nums[index]
            let value = target - item
            if let valueIndex = hasMap[value]  {
                return [valueIndex,index]
            }
            hasMap[item] = index
        }
        
        return []
    }
    
    // 第二次练习
    // 两数之和，巧妙的采用HashMap
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        for index in 0..<nums.count {
            let item = nums[index]
            let value = target - item
            if  let old = hasMap[value] {
                return [index,old]
            }
            hasMap[item] = index
        }
        return []
    }
    
    static func test() {
        let nums = [2,7,11,15]
        let solution = Solution1()
        let result = solution.twoSum(nums, 9)
        print(result)
    }
}
// @lc code=end

