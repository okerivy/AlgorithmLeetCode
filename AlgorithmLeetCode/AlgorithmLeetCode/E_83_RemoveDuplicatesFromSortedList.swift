//
//  E_83_RemoveDuplicatesFromSortedList.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/23.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation




// MARK: - 题目名称: 83. Remove Duplicates from Sorted List

/* MARK: - 所属类别:
 标签: Linked List
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 
 */


/* MARK: - 题目翻译:
 给定排序的链表，删除所有重复，这样每个元素只出现一次。
 例如,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 
 */



/* MARK: - 解题思路:
 我们只需要判断当前指针以及下一个指针时候重复，如果是，则删除下一个指针就可以了。
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func deleteDuplicates(_ head: SinglyListNode?) -> SinglyListNode? {
     
        if head == nil || head?.next == nil {
            return nil
        }
        
        var p = head
        
        while p != nil && p?.next != nil {
            if p?.next?.val == p?.val {
                p?.next = p?.next?.next
            } else {
                p = p?.next
            }
            
        }
        return head
    }
    
}



// MARK: - 测试代码:
func RemoveDuplicatesFromSortedList() {
    
    // 单链表
    var head1 = CreatSinglyList().convertArrayToSinglyList([1, 2, 3, 3, 5, 6, 6, 6, 7, 8])
    head1 = Solution().deleteDuplicates(head1)
    print(head1 ?? "没有找到")
    
}






