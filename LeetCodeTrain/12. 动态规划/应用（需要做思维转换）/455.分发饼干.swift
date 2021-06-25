/*
 * @lc app=leetcode.cn id=455 lang=swift
 *
 * [455] 分发饼干
 */

// @lc code=start
class Solution455 {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        //孩子的胃口排序
        //饼干大小排序
        //排序+ 贪心
        //gg 小孩的按从小到大的胃口排序
        let gg = g.sorted()
        let ss = s.sorted()
        var i = 0
        var j = 0
        while i < ss.count ,j < gg.count{
            //如果饼干值》胃口值
            if ss[i] >= gg[j]  {
                i += 1
                j += 1
            } else {
                //若果饼干值，小于胃口值。需要拿更大的饼干
                i += 1
            }
        }
        return j
    }
    
    static func test() {
//        let g = [1,2,3]
//        let s = [1,1]
        
//        let g = [2,1]
//        let s = [1,2,3]
        
//        let g = [7,8,9,10]
//        let s = [5,6,7,8]
        let g = [10,9,8,7]
        let s = [10,9,8,7]
        let result = Solution455().findContentChildren(g, s)
        print(result)
    }
}
// @lc code=end

