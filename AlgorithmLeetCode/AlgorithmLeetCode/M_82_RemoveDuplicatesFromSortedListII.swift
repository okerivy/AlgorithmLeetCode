//
//  M_82_RemoveDuplicatesFromSortedListII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/23.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation




// MARK: - 题目名称: 82. Remove Duplicates from Sorted List II

/* MARK: - 所属类别:
 标签: Linked List
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 For example,
 Given 1->2->3->3->4->4->5, return 1->2->5.
 Given 1->1->1->2->3, return 2->3.
 
 */


/* MARK: - 题目翻译:
 给定一个已排序的链表，删除所有具有重复编号的节点，只留下与原始列表不同的数字。
 例如,
 Given 1->2->3->3->4->4->5, return 1->2->5.
 Given 1->1->1->2->3, return 2->3.
 
 */



/* MARK: - 解题思路:
 需要在一个有序的链表里面删除所有的重复元素的节点。因为不同于上题可以保留一个，这次需要全部删除，所以我们遍历的时候需要记录一个prev节点，用来处理删除节点之后节点重新连接的问题。
 

 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func deleteDuplicates(_ head: SinglyListNode?) -> SinglyListNode? {
     
        if head == nil || head?.next == nil {
            return head
        }
        
        var p = head
        // 记录初始位置
        let dummy = CreatSinglyList().convertArrayToSinglyList([-1])
        dummy?.next = head
        var prev = dummy
        while p != nil && p?.next != nil {
            if p?.next?.val == p?.val {
                //如果有重复，则继续遍历，直到不重复的节点
                var n = p?.next?.next
                while n != nil {
                    if p?.val != n?.val {
                        break
                    }
                    n = n?.next
                }
                prev?.next = n
                p = n
            } else {
                //如果没有重复，则prev为p，next为p->next
                prev = p
                p = p?.next
            }
        }
        
        return dummy?.next
    }
    
}



// MARK: - 测试代码:
func RemoveDuplicatesFromSortedListII() {
    
    // 单链表
    var head1 = CreatSinglyList().convertArrayToSinglyList([1, 2, 3, 3, 5, 6, 6, 6, 7, 8])
    var head2 = CreatSinglyList().convertArrayToSinglyList([1, 1, 1, 1, 5, 6, 6, 6, 7, 8])

    head1 = Solution().deleteDuplicates(head1)
    head2 = Solution().deleteDuplicates(head2)
    print(head1 ?? "没有找到")
    print(head2 ?? "没有找到")

    
}


