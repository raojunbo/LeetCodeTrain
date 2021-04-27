/*
 * @lc app=leetcode.cn id=151 lang=swift
 *
 * [151] 翻转字符串里的单词
 */

// @lc code=start
class Solution151 {
    // 思路1
    // 先去掉空白
    // 翻转全部
    // 翻转单个单词
    
    // 思路2
    // 先去掉空白
    // 逐个翻转单词
    // 整体翻转
    func reverseWords(_ s: String) -> String {
        // 去除中间的多余的空白字符
        // reveseSomeWords(0,s.count - 1)
        // 翻转单词
        
        var noBlank: [Character] = Array(s)
        
        var curIndex = 0
        var lastBankFlag = true
        
        // 整个过程只处理我需要的东西
        for index in 0..<noBlank.count {
            if noBlank[index] != " " {
                noBlank[curIndex] = noBlank[index]
                curIndex += 1
                lastBankFlag = false
            } else if lastBankFlag == false {
                //  本次为空
                noBlank[curIndex] = " "
                curIndex += 1
                lastBankFlag = true
            }
        }
        
        // 反转全部
        reverseSomeWords(noBlank: &noBlank, begin: 0, end: curIndex - 1)
        for index in 0...curIndex - 1 {
            reverseSomeWords(noBlank: &noBlank, begin: 0, end: 0)
        }
        
        // 反转局部
//        var begin: Int = 0
//        var end: Int = 0
//        for index in 0...curIndex - 1 {
//            // 遇到结束符
//            if noBlank[index] == " " {
//                reverseSomeWords(noBlank: &noBlank, begin: begin, end: index - 1)
//                begin = index + 1
//            }
//            // 是最后
//            if index == curIndex - 1 {
//                reverseSomeWords(noBlank: &noBlank, begin: begin, end: index)
//            }
//        }

        return String(noBlank[0..<curIndex - 1])
    }
    
    // 起始点，结束点进行翻转
    func reverseSomeWords(noBlank: inout [Character], begin: Int, end: Int) {
        for index in 0...end {
            if index < end / 2 {
                let tmp =  noBlank[end - index]
                noBlank[end - index] =  noBlank[index]
                noBlank[index] = tmp
            }
        }
    }
    static func test() {
//        let solution = Solution151()
//        let hello = "the  sky is  blue"
//        let result = solution.reverseWords(hello)
//        print(result)
    }
}
// @lc code=end

