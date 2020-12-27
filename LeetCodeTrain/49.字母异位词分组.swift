/*
 * @lc app=leetcode.cn id=49 lang=swift
 *
 * [49] 字母异位词分组
 ["eat", "tea", "tan", "ate", "nat", "bat"]
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 */

// @lc code=start
class Solution49 {
    //方法一：每分组的字符串进行排序，就能是一个Key
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var resultArray:[[String]] = []
        var dict:[String:Any] = [:]
        for (index,item) in strs.enumerated() {
            let key = String(item.sorted().hashValue)
            if let tmpItem = dict[key] {
                if var tmpItemArray = tmpItem as? [Int]{
                    tmpItemArray.append(index)
                    dict[key] = tmpItemArray
                }
            }else {
                var tmpArray:[Int] = []
                tmpArray.append(index)
                dict[key] = tmpArray
            }
        }
        
        for item in dict.values {
            var tmpArray:[String] = []
            if let indexArray = item as? [Int] {
                for index in indexArray {
                    let value = strs[index]
                    tmpArray.append(value)
                }
            }
            resultArray.append(tmpArray)
        }
        return resultArray
    }
    
    //方法二：不排序，是将字符的计数序列
    func groupAnagrams2(_ strs: [String]) -> [[String]] {
        var resultArray:[[String]] = []
        var dict:[String:Any] = [:]
        for (index,item) in strs.enumerated() {
           
            let key = countKeyStr(item)
            if let tmpItem = dict[key] {
                if var tmpItemArray = tmpItem as? [Int]{
                    tmpItemArray.append(index)
                    dict[key] = tmpItemArray
                }
            }else {
                var tmpArray:[Int] = []
                tmpArray.append(index)
                dict[key] = tmpArray
            }
        }
        
        for item in dict.values {
            var tmpArray:[String] = []
            if let indexArray = item as? [Int] {
                for index in indexArray {
                    let value = strs[index]
                    tmpArray.append(value)
                }
            }
            resultArray.append(tmpArray)
        }
        return resultArray

    }
    
    //给字符计数
    func countKeyStr(_ item:String) -> String {
        var charCountArray:[Int] = Array<Int>.init(repeating: 0, count: 26)
        for (_,item2) in item.enumerated() {
            if let item22 = item2.asciiValue {
                let cIndex = item22 - 97
                charCountArray[Int(cIndex)] += 1
            }
    
        }
        var keyStr = ""
        for charItem in charCountArray {
            keyStr.append("#")
            keyStr.append("\(charItem)")
        }
        return keyStr
    }
    
    
    static func test() {
        let array = ["eat", "tea", "tan", "ate", "nat", "bat"]
        print(Solution49().groupAnagrams2(array))
    }
}
// @lc code=end

