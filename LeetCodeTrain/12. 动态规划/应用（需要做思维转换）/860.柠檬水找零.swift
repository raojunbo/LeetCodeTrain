/*
 * @lc app=leetcode.cn id=860 lang=swift
 *
 * [860] 柠檬水找零
 */

// @lc code=start
class Solution860 {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0
        var ten = 0
        for item in bills {
            if item == 5 {
                five += 1
            } else if item == 10 {
                if five == 0 {
                   return false
                }
                five -= 1
                ten += 1
            } else if item == 20 {
                if five > 0 && ten > 0 {
                    five -= 1
                    ten -= 1
                } else if five > 3 {
                    five = five - 3
                } else {
                   return false
                }
            }
        }
        return true
    }
}
// @lc code=end

