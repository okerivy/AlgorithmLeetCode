//
//  M_142_LinkedListCycleII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/22.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/linked-list-cycle-ii

import Foundation





// MARK: - 题目名称: 142. Linked List Cycle II

/* MARK: - 所属类别:
 标签: Linked List, Two Pointers
 
 相关题目:
 (E) Linked List Cycle 
 (M) Find the Duplicate Number

 */

/* MARK: - 题目英文:
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
 
 Note: Do not modify the linked list.
 
 Follow up:
 Can you solve it without using extra space?
 
 */


/* MARK: - 题目翻译:
 给定一个LINKED LIST，返回的节点在循环开始。如果没有，返回null。
 注：不要修改的链表。
 随访：
 你可以练习，它没有使用额外的空间？
 
 */



/* MARK: - 解题思路:
 这题不光要求出是否有环，而且还需要得到这个环开始的节点。譬如下面这个，起点就是n2。
 
       n6-----------n5
       |             |
 n1--- n2---n3--- n4-|
 我们仍然可以使用两个指针fast和slow，fast走两步，slow走一步，判断是否有环，当有环重合之后，譬如上面在n5重合了，那么如何得到n2呢？
 
 首先我们知道，fast每次比slow多走一步，所以重合的时候，fast移动的距离是slot的两倍，我们假设n1到n2距离为a，n2到n5距离为b，n5到n2距离为c，fast走动距离为a + b + c + b，而slow为a + b，有方程a + b + c + b = 2 x (a + b)，可以知道a = c，
 所以我们只需要在重合之后，一个指针从n1，而另一个指针从n5，都每次走一步，那么就可以在n2重合了。
 

 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func detectCycle(_ head: SinglyListNode?) -> SinglyListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        
        var fast: SinglyListNode? = head
        var slow: SinglyListNode? = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            // 有环
            if fast === slow {
                // 找起点
                slow = head
                while fast !== slow {
                    fast = fast?.next
                    slow = slow?.next
                }
                return slow
            }
        }
        
        
        return nil
    }
}



// MARK: - 测试代码:
func LinkedListCycleII() {
    
    // 单链表
    let head1 = CreatSinglyList().convertArrayToSinglyList([1, 2, 3, 4, 5, 6, 7, 8])
    let head2 = CreatSinglyList().convertArrayToSinglyListCycle([1, 2, 3, 4, 5, 6, 7, 8], 2)
    let ans1 = Solution().detectCycle(head1)
    let ans2 = Solution().detectCycle(head2)

    print(ans1?.val ?? "没有找到")
    print(ans2?.val ?? "没有找到")
    
}



