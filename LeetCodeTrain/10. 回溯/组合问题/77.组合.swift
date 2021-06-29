/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 // 这种回溯方法实际上就是一种递归
 // 通过全局变量。或者局部穿透每层。去保存这个结果；
 // 为什么叫回溯：在一个路径处理完在处理完后，从调用栈中返回时，处理相应的结果；
 */

// @lc code=start
class Solution77 {
    var result: [[Int]] = []
    var path: [Int] = []
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        backTrack(n, k, 1)
        return result
    }
    func backTrack(_ n: Int, _ k: Int, _ start: Int) {
        //退出条件
        if path.count == k {
            result.append(path)
            return
        }
        if start > n {
            return
        }
        // 在本层也需要每个路径走到
        for i in start...n {
            path.append(i)
            backTrack(n, k, i + 1)
            path.removeLast()
        }
    }
    // 进行剪枝优化的版本
    func combine2(_ n: Int, _ k: Int) -> [[Int]] {
        backTrack(n, k, 1)
        return result
    }
    func backTrack2(_ n: Int, _ k: Int, _ start: Int) {
        //退出条件
        if path.count == k {
            result.append(path)
            return
        }
        if start > n {
            return
        }
        // 这里有个剪枝过程（当后面的数据个数已经不能满足时，可以立刻跳出）
        for i in start...n - (k - path.count) + 1 {
            path.append(i)
            backTrack(n, k, i + 1)
            path.removeLast()
        }
    }
    
    static func test() {
        let solution = Solution77()
//        [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
        let result = solution.combine2(4, 2)
        print(result)
    }
}
// @lc code=end

