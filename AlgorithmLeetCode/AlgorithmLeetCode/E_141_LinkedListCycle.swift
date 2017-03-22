//
//  E_141_LinkedListCycle.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/22.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation




// MARK: - 题目名称: 141. Linked List Cycle

/* MARK: - 所属类别:
 标签: Linked List, Two Pointers
 
 相关题目:
 (M) Linked List Cycle II
 
 */

/* MARK: - 题目英文:
 Given a linked list, determine if it has a cycle in it.
 
 Follow up:
 Can you solve it without using extra space?
 
 */


/* MARK: - 题目翻译:
 给定链表，确定它是否有一个循环。
 跟进:
 你能不用额外的空间解决它吗？
 
 */



/* MARK: - 解题思路:
 非常简单的一道题目，我们使用两个指针，一个每次走两步，一个每次走一步，如果一段时间之后这两个指针能重合，那么铁定存在环了。
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func hasCycle(_ head: SinglyListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var fast: SinglyListNode? = head
        var slow: SinglyListNode? = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next // 快走两步
            slow = slow?.next // 慢走一步
            if slow === fast { // 相遇
                return true
            }
        }
        
        return false
    }

}



// MARK: - 测试代码:
func LinkedListCycle() {
    
    // 单链表
    let head1 = CreatSinglyList().convertArrayToSinglyList([1, 2, 3, 4, 5, 6, 7, 8])
    let head2 = CreatSinglyList().convertArrayToSinglyListCycle([1, 2, 3, 4, 5, 6, 7, 8], 2)

    print(Solution().hasCycle(head1))
    print(Solution().hasCycle(head2))

}


