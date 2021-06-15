/*
 * @lc app=leetcode.cn id=51 lang=swift
 *
 * [51] N皇后
 */

// @lc code=start
class Solution51 {
    var cols:[Int] = []
    var res = [[String]]()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        //n皇后
        if n < 1 {
            return []
        }
        cols = Array(repeating: 0, count: n)
        place(row: 0)
        return res
    }
    /// 一行一行摆放
    /// - Parameters:
    ///   - row: 需要摆放的行
    func place(row:Int)  {
        if row == cols.count {
            componetResult()
            return
        }
        for col in 0..<cols.count {
            //当前行的，当前列是否有效
            if isValid(row: row, col: col) {
                cols[row] = col
                place(row: row + 1)
            }
        }
    }
    
    func isValid2(row: Int, col: Int) -> Bool {
        //优化写法
        return false
    }
    
    func isValid(row: Int, col: Int) -> Bool {
        for i in 0..<row {
            //列已经有皇后
            if cols[i] == col {
                return false
            }
            //若果斜线有皇后
            if row - i == abs(col - cols[i]) {
                return false
            }
        }
        return true
    }
    
    func componetResult()  {
        var tmpArr = [String]()
        for r in 0..<cols.count {
            var tmpStr = ""
            for c in 0..<cols.count {
                if cols[r] == c {
                    tmpStr.append("Q")
                } else {
                    tmpStr.append(".")
                }
            }
            tmpArr.append(tmpStr)
        }
        res.append(tmpArr)
    }
    
    func show()  {
        for row in 0..<cols.count {
            for col in 0..<cols.count {
                //一维数组里存的
                if cols[row] == col {
                    print("1", terminator: "")
                } else {
                    print("0", terminator: "")
                }
            }
            print("")
        }
        print("")
    }
    
    static func test () {
        let result = Solution51().solveNQueens(4)
        print(result)
    }
}
// @lc code=end

class Solution51_2 {
    var cols:[Bool] = [] //记录列是否有皇后
    var leftTop:[Bool] = [] //左斜线
    var rightTop:[Bool] = [] //右斜线
    
    var res = [[String]]()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        //n皇后
        if n < 1 {
            return []
        }
        cols = Array(repeating: false, count: n)
        place(row: 0)
        return res
    }
    /// 一行一行摆放
    /// - Parameters:
    ///   - row: 需要摆放的行
    func place(row:Int)  {
        if row == cols.count {
            componetResult()
            return
        }
        for col in 0..<cols.count {
            //这一列已经摆上
            if cols[col] {
                continue
            }
//            if leftTop[ltIndex] {
//                continue
//            }
//            if rightTop[rtIndex] {
//                continue
//            }
//            cols[col] = true
//            leftTop[ltIndex] = true
//            rightTop[rtIndex] = true
//            if isValid(row: row, col: col) {
//                cols[row] = col
//                place(row: row + 1)
//            }
        }
    }
    
    func isValid2(row: Int, col: Int) -> Bool {
        //优化写法
        return false
    }
    
//    func isValid(row: Int, col: Int) -> Bool {
//        for i in 0..<row {
//            //列已经有皇后
//            if cols[i] == col {
//                return false
//            }
//            //若果斜线有皇后
//            if row - i == abs(col - cols[i]) {
//                return false
//            }
//        }
//        return true
//    }
    
    func componetResult()  {
//        var tmpArr = [String]()
//        for r in 0..<cols.count {
//            var tmpStr = ""
//            for c in 0..<cols.count {
//                if cols[r] == c {
//                    tmpStr.append("Q")
//                } else {
//                    tmpStr.append(".")
//                }
//            }
//            tmpArr.append(tmpStr)
//        }
//        res.append(tmpArr)
    }
    
    func show()  {
//        for row in 0..<cols.count {
//            for col in 0..<cols.count {
//                //一维数组里存的
//                if cols[row] == col {
//                    print("1", terminator: "")
//                } else {
//                    print("0", terminator: "")
//                }
//            }
//            print("")
//        }
//        print("")
    }
    
    static func test () {
        let result = Solution51().solveNQueens(4)
        print(result)
    }
}

