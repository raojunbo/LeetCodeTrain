/*
 * @lc app=leetcode.cn id=874 lang=swift
 *
 * [874] 模拟行走机器人
 */

// @lc code=start
class Solution874 {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        //坐标
        var x = 0
        var y = 0
        var direction = 0 // 0,1,2,3 分别是向上，向右，向下，向左
        let dx = [0,1,0,-1] // 在横坐标下为k的方向上走的1次
        let dy = [1,0,-1,0] // 在纵坐标下
        //怎样去表示方向
        //怎么快速的找到
        
        var obstacleSet = Set<Int>()
        for obstacle in obstacles {
            let ox = obstacle[0] + 30000
            let oy = obstacle[1] + 30000
            obstacleSet.insert(ox<<16 + oy)
        }
        var ans = 0
        for command in commands {
            if command == -2 {//向左
                direction = (direction + 3) % 4
            } else if command == -1 { //向右
                direction = (direction + 1) % 4
            } else {
                // 求x 能走的最远距离
                // 求y 能走的最远距离
                for _ in 0..<command {
                    let nx = x + dx[direction]
                    let ny = y + dy[direction]
                    let code = (nx + 30000)<<16 + (ny + 30000)
                    if !obstacleSet.contains(code) {
                        x = nx
                        y = ny
                        ans = max(ans,  x*x + y*y)
                    }
                }
            }
        }
        return ans
    }
    
    static func test() {
        let commands = [4,-1,4,-2,4]
        let obstacles = [[2,4]]
        let result = Solution874().robotSim(commands, obstacles)
        print(result)
    }
}
// @lc code=end

