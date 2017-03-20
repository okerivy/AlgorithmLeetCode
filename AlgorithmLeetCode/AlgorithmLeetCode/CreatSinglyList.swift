//
//  CreatSinglyList.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation

typealias SinglyListNode = CreatSinglyList.SinglyListNode

public class CreatSinglyList {
    
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     public var val: Int
     *     public var next: ListNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.next = nil
     *     }
     * }
     */
    
    class SinglyListNode {
        var val: Int
        var next: SinglyListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    var head: SinglyListNode?
    var tail: SinglyListNode?
    
    // 尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = SinglyListNode.init(val)
            head = tail
        } else {
            tail?.next = SinglyListNode.init(val)
            tail = tail?.next
        }
    }
    
    // 头插法
    func appendToHead(_ val: Int) {
        if head == nil {
            head = SinglyListNode.init(val)
            tail = head
        } else {
            let temp = SinglyListNode.init(val)
            temp.next = head
            head = temp
        }
    }
    
    // 用数组来构建单链表
    func convertArrayToSinglyList(_ array: [Int]) -> SinglyListNode? {
        
        if array.count == 0 {
            return nil
        }
        
        // 尾插法
        for value in array {
            appendToTail(value)
        }
        
        return head
    }
    
    
}
