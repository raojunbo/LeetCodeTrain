/*
 * @lc app=leetcode.cn id=641 lang=swift
 *
 * [641] 设计循环双端队列
 队列是先进先出
 注意循环的实现
 */

// @lc code=start

class MyCircularDeque641 {
    var capacity = 0
    var array:[Int]
    var front:Int //队首指针
    var rear:Int //队尾指针
    
    /** Initialize your data structure here. Set the size of the deque to be k. */
    //k 为容量的大小
    init(_ k: Int) {
        //k 为外部的容量。内部还有一个位置用于判定队满
        self.capacity = k + 1
        //将所有元素初始为0
        self.array = [Int](repeating: 0, count:  self.capacity)
        self.front = 0
        self.rear = 0
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        //队满的判定条件
        if isFull() {
            return false
        }
        front =  ((front - 1) + capacity) % capacity
        array[front] = value
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        //从队尾入队
        if isFull() {
            return false
        }
        array[rear] = value
        rear = (rear + 1) % capacity
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        //从队头出队
        if isEmpty() {
            return false
        }
        front = (front + 1) % capacity
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        //从队尾出队
        if isEmpty() {
            return false
        }
        rear = ((rear - 1) + capacity) % capacity
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return self.array[front]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if  isEmpty() {
            return -1
        }
        let realRear = ((rear - 1) + capacity) % capacity
        return self.array[realRear]
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        if front == rear {
            return true
        }
        return false
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        if (rear + 1) % capacity == front {
            return true
        }
        return false
    }
    
    class func test () {
        let circle = MyCircularDeque641(3)
        let r1 = circle.insertLast(1)
        let r2 = circle.insertLast(2)

        let r3 = circle.insertFront(3)
        let r4 = circle.insertFront(4)

        let r5 =  circle.getRear()
        let r6 = circle.isFull()
        let r7 = circle.deleteLast()
        let r8 = circle.insertFront(4)
        let r9 = circle.getFront()

        print(r1,r2,r3,r4,r5,r6,r7,r8,r9)
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
// @lc code=end

