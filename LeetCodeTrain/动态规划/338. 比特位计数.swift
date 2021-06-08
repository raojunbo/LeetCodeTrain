//
//  338. 比特位计数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution338 {
    // 后面的计算可以依赖于前面计算的结果
//    public int[] countBits(int n) {
//            int[] bits = new int[n + 1];
//            int highBit = 0;
//            for (int i = 1; i <= n; i++) {
//                if ((i & (i - 1)) == 0) {
//                    highBit = i;
//                }
//                bits[i] = bits[i - highBit] + 1;
//            }
//            return bits;
//        }
    
    func countBits(_ n: Int) -> [Int] {
        if n == 0 {
            return []
        }
        var array: [Int] = Array(repeating: 0, count: n + 1)
        // 标识进位
        // 每一轮都是在上次进位时多出来的值 + 1
        var hightBit = 0
        for i in 1...n {
            if (i & (i - 1)) == 0 {
                hightBit = i
            }
            let iCount = array[i - hightBit] + 1
            array[i] = iCount
        }
        return array
    }
    static func test() {
        let solution = Solution338()
        let result =  solution.countBits(6)
        print(result)
    }
}
