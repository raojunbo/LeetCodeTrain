/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 */

// @lc code=start
class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        //主要是注意进位的处理
        var flag = false
        var digits = digits
        for index in (0..<digits.count).reversed() {
            let value =  digits[index] + 1
            if flag {
                digits[index] = value
            }
            if value <= 9 {
                digits[index] = value
                flag = false
                break
            }else {
                flag = true
                digits[index] = value%10
            }
        }
        if flag == true {
            digits.insert(1, at: 0)
        }
        for item in digits {
            print(item)
        }
        
        return digits
    }
    
    class func test() {
        let digits = [9,9,9]
        Solution66().plusOne(digits)
    }
    
}
// @lc code=end

