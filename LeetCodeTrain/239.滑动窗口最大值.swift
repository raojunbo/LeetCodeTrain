/*
 * @lc app=leetcode.cn id=239 lang=swift
 *
 * [239] 滑动窗口最大值
 */

// @lc code=start
class Solution239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        //滑动窗口的最大值
        var queue = [Int]()//队列
        var result = [Int]()//结果
        let length = nums.count//长度
        
        for i in 0..<length {
            //如果新进来的值比队列里的最后的值大（队列里的最后值，实际上是队列里的最大值）
            //移除队列里的全部值
            
            while queue.count > 0 && nums[i] > nums[queue.last!] {
                queue.removeLast()
            }
            //将当前值，追加到队列后面
            //大 小，更小
            queue.append(i)
            
            let w = i - k + 1 //第二个index
            if w >= 0  {
                //w 在queue的第一个后面，说明一件超出区域，移除队列头
                if w > queue.first! {
                    queue.removeFirst()
                }
                //每次迭代一次，从队列头部取出就是最大值
                result.append(nums[queue.first!])
            }
        }
        return result
    }
}
// @lc code=end

