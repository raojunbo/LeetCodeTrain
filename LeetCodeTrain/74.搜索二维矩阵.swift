/*
 * @lc app=leetcode.cn id=74 lang=swift
 *
 * [74] 搜索二维矩阵
 采用二分搜索即可
 竖采用二分
 横也采用二分
 log m * n
 */

// @lc code=start
class Solution74 {
    // 这种方法更好
    // 整体可以组成一个有序的数组。有序的数组可采用二分搜索实现
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rowC = matrix.count
        let columnC = matrix[0].count
        var left = 0
        var right = rowC * columnC - 1
        while left <= right {
            let mid = (left + right)/2
            let i = mid / columnC
            let j = mid % columnC
            if target  == matrix[i][j] {
                // 找到了
                return true
            } else if  target < matrix[i][j]  {
                // 在左边
                right = mid - 1
            } else {
                // 在右边
                left = mid + 1
            }
        }
        return false
    }
    
    static func test() {
        let array = [[1,3,5]]
        let target = 1
        let result = Solution74().searchMatrix(array, target)
        print(result)
    }
}
// @lc code=end

