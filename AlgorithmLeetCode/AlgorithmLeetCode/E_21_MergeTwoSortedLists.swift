//
//  E_21_MergeTwoSortedLists.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/23.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/merge-two-sorted-lists

import Foundation



// MARK: - 题目名称: 21. Merge Two Sorted Lists

/* MARK: - 所属类别:
 标签:
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 

 
 */


/* MARK: - 题目翻译:
 合并两个已排序的链表并将其返回为新列表。新的列表应该由前两个列表的节点拼接而成。
 
 */



/* MARK: - 解题思路:
 
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    
    func mergeTwoLists(_ l1: SinglyListNode?, _ l2: SinglyListNode?) -> SinglyListNode? {

        var l1 = l1
        var l2 = l2
        let dummy = CreatSinglyList().convertArrayToSinglyList([-1])
        var p = dummy
        
        while l1 != nil && l2 != nil {
            
            //哪个节点小，就挂载，同时移动到下一个节点
            if (l1?.val)! < (l2?.val)! {
                p?.next = l1
                l1 = l1?.next
            } else {
                p?.next = l2
                l2 = l2?.next
            }
            p = p?.next
        }
        
        p?.next = l1 ?? l2

        return dummy?.next
    }
}



// MARK: - 测试代码:
func MergeTwoSortedLists() {
    
    // 单链表
    let head1 = CreatSinglyList().convertArrayToSinglyList([1, 3, 3, 5, 6, 6, 6, 8])
    let head2 = CreatSinglyList().convertArrayToSinglyList([0, 2, 3, 4, 7, 9, 10, 11, 12, 13])
    
    let res = Solution().mergeTwoLists(head1, head2)
    print(res ?? "没有找到")
    
    
}

