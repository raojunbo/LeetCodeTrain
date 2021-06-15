/*
 * @lc app=leetcode.cn id=146 lang=swift
 *
 * [146] LRU缓存机制
 */

// @lc code=start

class CacheNode {
    var key:Int         //节点key值
    var value:Int       //节点value
    var next:CacheNode?  //下一个节点
    var pre:CacheNode?  //前一个节点
    init(key:Int,value:Int) {
        self.key = key
        self.value = value
    }
}

class CacheLinkedList {
    var header:CacheNode? //表头
    var tail:CacheNode?//表尾部
    var size = 0 //表的元素个数
    init () {
    }
    
    func addFirst(node:CacheNode)  {
        //头插入法
        if let tmpHeader = header {
            node.next = tmpHeader
            node.pre = nil
            tmpHeader.pre = node
            header = node
        }else {
            header = node
            node.next = nil
            node.pre = nil
            self.tail = node
        }
        size += 1
    }
    
    //双向链表能实现O(1)级别的删除
    func removeNode(node:CacheNode) -> CacheNode? {
        if size == 1 || size == 0 {
            header = nil
            return nil
        }
        
        if header === node {
            //如果要删除的节点是头节点
            header = header?.next
            header?.pre = nil
        }else if tail === node {
            //如果删除的是尾节点
            let preNode = node.pre
            preNode?.next = nil
            tail = preNode
        }else {
            //如果删除的是中间节点
            let nodePre = node.pre
            nodePre?.next = node.next
            node.pre = nil
            node.next = nil
        }
        size -= 1
        return node
    }
    
    func removeLast() -> CacheNode? {
        guard let tmpTail = tail else {
            return nil
        }
        
       return removeNode(node: tmpTail)
    }
}

class LRUCache {
    let linkedList:CacheLinkedList
    var keyNodeMap:[Int:CacheNode]
    let capacity:Int
    init(_ capacity: Int) {
        self.capacity = capacity
        self.linkedList = CacheLinkedList()
        self.keyNodeMap = [:]
    }
    
    func get(_ key: Int) -> Int {
        if let node = self.keyNodeMap[key] {
            put(key, node.value)
            return node.value
        }
        print(-1)
        return -1
    }
    
    
    func put(_ key: Int, _ value: Int) {
        let newNode = CacheNode(key: key, value: value)
        
        //如果存在，移到头部
        if let node = self.keyNodeMap[key]  {
            linkedList.removeNode(node: node)
            linkedList.addFirst(node: newNode)
            keyNodeMap[key] = newNode
            return
        }
        
        //如果不存在
        if(linkedList.size >= capacity) {
            let removedNode = linkedList.removeLast()
            if let removedNode = removedNode {
                keyNodeMap.removeValue(forKey: removedNode.key)
            }
        }
        linkedList.addFirst(node: newNode)
        keyNodeMap[key] = newNode
    }
    
    static func testData () {
        let lruCache = LRUCache(3)
        lruCache.get(3)
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        lruCache.put(3, 3)
        lruCache.put(4, 4)
        lruCache.get(4)
        lruCache.get(3)
        lruCache.get(2)
        lruCache.get(1)
        lruCache.put(5, 5)
        lruCache.get(1)
        lruCache.get(2)
        lruCache.get(3)
        lruCache.get(4)
        lruCache.get(5)
        
        
//        lruCache.put(1, 1)
//        lruCache.put(2, 2)
//        lruCache.get(1)
//        lruCache.put(3, 3)
//        lruCache.get(2)
//        lruCache.put(4, 4)
//        lruCache.get(1)
//        lruCache.get(3)
//        lruCache.get(4)
    }
}


//["LRUCache","put","put","get","put","get","put","get","get","get"]
//[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

