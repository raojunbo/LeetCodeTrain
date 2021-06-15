/*
 * @lc app=leetcode.cn id=242 lang=swift
 *
 * [242] 有效的字母异位词
 */

// @lc code=start
class Solution242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        //整个思路是采用hash表
        var dict:[Character:Int] = [Character:Int]()
        if s.count != t.count {
            return false
        }
        
        for c in s {
            if let item = dict[c] {
                dict[c] = item + 1
            }else {
                dict[c] = 1
            }
        }
        
        let flag = false
        for c in t  {
            if let item = dict[c] ,item > 0{
                dict[c] = item - 1
            }else {
                return flag
            }
        }
        
        return true
    }
    
    static func test() {
        let solu = Solution242()
        let flag = solu.isAnagram("anagram", "nagaram")
        if flag {
            print("是的")
        } else {
            print("不是的")
        }
    }
}
// @lc code=end

