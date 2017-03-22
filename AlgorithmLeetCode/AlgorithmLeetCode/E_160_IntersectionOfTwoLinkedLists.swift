//
//  E_160_IntersectionOfTwoLinkedLists.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/22.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/intersection-of-two-linked-lists

import Foundation



// MARK: - 题目名称: 160. Intersection of Two Linked Lists

/* MARK: - 所属类别:
 标签: Linked List
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Write a program to find the node at which the intersection of two singly linked lists begins.
 
 
 For example, the following two linked lists:
 
 A:          a1 → a2
                     ↘
                     c1 → c2 → c3
                     ↗
 B:     b1 → b2 → b3
 begin to intersect at node c1.
 
 
 Notes:
 
 If the two linked lists have no intersection at all, return null.
 The linked lists must retain their original structure after the function returns.
 You may assume there are no cycles anywhere in the entire linked structure.
 Your code should preferably run in O(n) time and use only O(1) memory.
 
 */


/* MARK: - 题目翻译:
 编写一个程序来查找两个单链表相交的节点。
 例如，以下两个链表：
 A:          a1 → a2
                     ↘
                     c1 → c2 → c3
                     ↗
 B:     b1 → b2 → b3
 开始在节点C1相交。
 笔记:
 如果两个链表没有交集，返回null。
 链表在函数返回后必须保留其原有结构。
 你可以假设整个链接结构中没有任何循环。
 您的代码最好在O（n）的时间内运行，只使用O（1）内存
 
 */



/* MARK: - 解题思路:
 需要得到两个链表的交接点，也就是c1，这一题也很简单。
 
 遍历A，到结尾之后，将A最后的节点连接到B的开头，也就是c3 -> b1
 使用两个指针fast和slow，从a1开始，判断是否有环
 如果没环，在返回之前记得将c3 -> b1给断开
 如果有环，则按照第二题的解法得到c1，然后断开c3 -> b1
 代码如下：
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    
    func getIntersectionNode(_ headA: SinglyListNode?, _ headB: SinglyListNode?) -> SinglyListNode? {
        
        if headA == nil || headB == nil {
            return nil
        }
        
        // 找到 headA 的尾结点
        var p = headA
        while p?.next != nil {
            p = p?.next
        }
        
        // headA 尾部 和 headB 拼接
        p?.next = headB
        
        // 记录 headA 的尾部结点 方便以后断开
        let tail = p
        p = headA
        
        // 快慢指针 判断是否有环
        var fast = p
        var slow = p
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast === slow {
                break
            }
        }
        
        // 没环
        if fast?.next == nil {
            //断开两个链表
            tail?.next = nil
            return nil
        }
        
        // 有环
        slow = p
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        //断开两个链表
        tail?.next = nil
        
        return slow
    }
}



// MARK: - 测试代码:
func IntersectionOfTwoLinkedLists() {
    
    // 单链表
    let head1 = CreatSinglyList().convertArrayToSinglyList([1, 2])
    let head2 = CreatSinglyList().convertArrayToSinglyList([-3, -2, -1])
    let head3 = CreatSinglyList().convertArrayToSinglyList([3, 4, 5, 6, 7, 8])
    
    // 找到 head1 的尾结点
    var p = head1
    while p?.next != nil {
        p = p?.next
    }
    // head1 与 head3 拼接
    p?.next = head3
    
    // 找到 head1 的尾结点
    p = head2
    while p?.next != nil {
        p = p?.next
    }
    // head2 与 head3 拼接
    p?.next = head3
    
    // p 作为相交的结点
    p = nil
    p = Solution().getIntersectionNode(head1, head2)
    
    print(p?.val ?? "没有找到")
    
}


