//
//  207. 可程表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 深度优先遍历的方法论
// 实际上是一个递归遍历,初始的值实际上是遍历所有节点；
class Solution207 {
    // 各个接节点的相邻信息
    var edges: [[Int]] = []
    // 各个节点的访问状态：未访问 0;正在访问 -1 ；已经访问：1
    var visited: [Int] = []
    // 是否有效
    var valid = true
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // 存储图的各个节点的相邻信息
        edges = Array(repeating: [], count: numCourses)
        for edge in prerequisites {
            // prerequisites
            // edges实际上存储的是图的依赖关系
            // 这里图实际上是位置，和其后面跟的子数组的依赖
            edges[edge[1]].append(edge[0])
        }
        
        // 初始化各个节点的访问状态
        visited = Array(repeating: 0, count: numCourses)
        
        // 遍历每个节点
        for vertex in 0..<numCourses {
            // 如果没有访问过
            if visited[vertex] == 0 {
                dfs(currentV: vertex)
            }
        }
        return valid
    }
    // 深度优先搜索方法
    func dfs(currentV: Int) {
        // 当前节点正在访问
        visited[currentV] = -1
        // 遍历当前节点的相邻节点
        for next in edges[currentV] {
            if visited[next] == -1 {
                // 相邻节点正在访问状态（图中存在环）
                valid = false
                return
            } else if visited[next] == 0 {
                // 相邻节点未访问过
                dfs(currentV: next)
                if !valid {
                    return
                }
            }
        }
        // 当前节点已经无相邻节点,标记已经访问
        visited[currentV] = 1
    }
    static func test(){
        let solution = Solution207()
        let prerequisites = [[1,0]]
//        先修课程对 [0, 1] 表示：想要学习课程 0 ，你需要先完成课程 1 。
        let result = solution.canFinish(2, prerequisites)
        print(result)
    }
}
