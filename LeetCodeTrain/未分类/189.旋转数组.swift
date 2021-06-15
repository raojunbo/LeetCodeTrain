/*
 * @lc app=leetcode.cn id=189 lang=swift
 *
 * [189] 旋转数组
 */

// @lc code=start
class Solution189 {
    //一共三种方法
    func rotate(_ nums: inout [Int], _ k: Int) {
        //每次都移动一次
        //on(n * k)
        if k == 0 {
            return
        }
        if nums.count == 0 || nums.count == 1 {
            return
        }
        
        for _ in 1...k {
            let last = nums[nums.count - 1]
            for i in (0..<nums.count).reversed(){
                if i == 0 {
                    nums[0] = last
                }else {
                    nums[i] = nums[i-1]
                }
            }
        }
        
        for item in nums {
            print(item)
        }
    }
    
    func rotate2(_ nums: inout [Int], _ k: Int) {
        //多余一个数组
        var tmpArray:[Int] = [Int](repeating: 0, count: nums.count)
        for index in 0..<nums.count {
            let newIndex = (index+k)%nums.count
            tmpArray[newIndex] = nums[index]
        }
        for (index,item) in tmpArray.enumerated() {
            nums[index]  = item
        }
    }
    
    func rotate3(_ nums: inout [Int], _ k: Int) {
        //反转法
        let mk = (nums.count + k)%nums.count
        localRotate(nums: &nums, begin: 0, end: nums.count - mk - 1)
        localRotate(nums: &nums, begin: nums.count - mk, end:nums.count - 1)
        localRotate(nums: &nums, begin: 0, end: nums.count - 1)
    }
    
    func localRotate(nums:inout [Int],begin:Int,end:Int)  {
        if begin == end {
            return
        }
        var  p1 = begin
        var p2 = end
        while p1 < p2 {
            let tmp = nums[p2]
            nums[p2]  = nums[p1]
            nums[p1] = tmp
            p1 = p1 + 1
            p2 = p2 - 1
        }
    }
    
    class func test()  {
        var array  = [1,2,3,4,5,6,7]
        Solution189().rotate3(&array, 3)
    }
}
// @lc code=end

