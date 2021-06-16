//
//  377. 组合总和IV.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/16.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution377 {
    // 实际上是求排列数
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = Array(repeating: 0, count: target + 1)
        dp[0] = 1
        for i in 0...target {
            for j in 0..<nums.count {
                let coin = nums[j]
                if i < coin {
                    continue
                }
                // 此种情况下是是排列数，（1，5）与(5,1)的组合数都会被添加到和里面
                print(dp[i])
                // & 这个符号表示后面的值无意义了（因为已经溢出了）
                dp[i] &+= dp[i - coin]
            }
        }
        return dp[target]
    }
    
    static func test() {
//        let nums = [1,2,3]
//        let target = 4
        let nums = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880,890,900,910,920,930,940,950,960,970,980,990,111]
        
        let target = 999
        let solution = Solution377()
        let result = solution.combinationSum4(nums, target)
        print(result)
    }
}
