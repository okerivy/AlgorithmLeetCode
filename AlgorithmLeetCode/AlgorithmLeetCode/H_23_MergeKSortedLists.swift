//
//  H_23_MergeKSortedLists.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/23.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/merge-k-sorted-lists

import Foundation




// MARK: - 题目名称: 23. Merge k Sorted Lists

/* MARK: - 所属类别:
 标签: Divide and Conquer, Linked List, Heap
 
 相关题目:
 (E) Merge Two Sorted Lists 
 (M) Ugly Number II

 */

/* MARK: - 题目英文:
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

 
 */


/* MARK: - 题目翻译:
 合并k排序的链表并将其返回为一个排序列表。分析并描述其复杂性。
 
 */



/* MARK: - 解题思路:
 需要合并k个排好序的链表，我们采用divide and conquer的方法，首先两两合并，然后再将先前合并的继续两两合并。
 
 
 */


/* MARK: - 复杂度分析:
 时间复杂度为O(NlgN)。
 
 */


// MARK: - 代码:
private class Solution {
    
    func mergeKLists(_ lists: [SinglyListNode?]) -> SinglyListNode? {
        if lists.count == 0 { return nil }
        var lists = lists
        
        var n = lists.count
        // 递归
        while n > 1 {
            let k = (n+1)/2
            
            for i in 0..<n/2 {
                //合并i和i + k的链表，并放到i位置
                lists[i] = merge2Lists(lists[i], lists[i+k])
            }
            
            // 两个合并成一个, 还剩下 一半
            // 继续合并  下个循环只需要处理前k个链表了
            n = k
        }
        return lists[0]
    }
    
    private func merge2Lists(_ l1: SinglyListNode?, _ l2: SinglyListNode?) -> SinglyListNode? {
        
        var l1 = l1
        var l2 = l2
        // 起点
        let dummy = CreatSinglyList().convertArrayToSinglyList([-1])
        var p = dummy
        
        
        while l1 != nil && l2 != nil {
            
            //哪个节点小，就挂载，同时移动到下一个节点
            if (l1?.val)! < (l2?.val)! {
                // 加上结点l1
                p?.next = l1
                l1 = l1?.next
            } else {
                p?.next = l2
                l2 = l2?.next
            }
            // p 指向下一个结点
            p = p?.next
        }
        
        p?.next = l1 ?? l2
        
        return dummy?.next
    }

}



// MARK: - 测试代码:
// MARK: - 测试代码:
func MergeKSortedLists() {
    
    // 单链表
    let head1 = CreatSinglyList().convertArrayToSinglyList([1, 2])
    let head2 = CreatSinglyList().convertArrayToSinglyList([2, 3, 4])
    let head3 = CreatSinglyList().convertArrayToSinglyList([-3, -2, -1])
    let head4 = CreatSinglyList().convertArrayToSinglyList([3, 4, 5, 6, 7, 8])
    
    let arr = [head1, head2, head3, head4]
    let res = Solution().mergeKLists(arr)
    
    print(res ?? "没有找到")
    
}




