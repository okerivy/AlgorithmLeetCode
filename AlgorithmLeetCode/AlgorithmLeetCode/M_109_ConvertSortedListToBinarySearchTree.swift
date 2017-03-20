//
//  M_109_ConvertSortedListToBinarySearchTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree

import Foundation



// MARK: - 题目名称: 109. Convert Sorted List to Binary Search Tree

/* MARK: - 所属类别:
 标签: Depth-first Search, Linked List
 
 相关题目:
 (E) Convert Sorted Array to Binary Search Tree
 
 */

/* MARK: - 题目英文:
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
 */


/* MARK: - 题目翻译:
 给定一个单向链表，元素是以升序排序，将它转换成一个高度平衡的二叉查找树。
 
 */



/* MARK: - 解题思路:
 这题需要将一个排好序的链表转成一个平衡二叉树，我们知道，对于一个二叉树来说，左子树一定小于根节点，而右子树大于根节点。所以我们需要找到链表的中间节点，这个就是根节点，链表的左半部分就是左子树，而右半部分则是右子树，我们继续递归处理相应的左右部分，就能够构造出对应的二叉树了。
 
 这题的难点在于如何找到链表的中间节点，我们可以通过fast，slow指针来解决，fast每次走两步，slow每次走一步，fast走到结尾，那么slow就是中间节点了。
 
 
 >>>>>>>>>>>>>>>>>>>>>> 恒等运算符
 
 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
 
 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
 
 等价于（===）
 不等价于（!==）
 运用这两个运算符检测两个常量或者变量是否引用同一个实例：
 

 请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
 
 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。

 */


/* MARK: - 复杂度分析:
 时间复杂度O(n)，空间复杂度O(logn)
 
 */


// MARK: - 代码:
private class Solution {
    func sortedListToBST(_ head: SinglyListNode?) -> TreeNode? {
        
        
        return build(head, nil)
    }
    
    private func build(_ start: SinglyListNode?, _ end: SinglyListNode?) -> TreeNode? {
        // 恒等运算符
        if start === end {
            return nil
        }
        // 给fast slow 定位初始位置
        var fast: SinglyListNode? = start
        var slow: SinglyListNode? = start
        
        // fast slow 分别走一步和两步 直到 fast.next === end
        while fast !== end && fast?.next !== end {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // value: (slow?.val)! 这里的slow 不可能为nil 因为slow 是慢指针
        // fast 是快指针 所以fast 可能为nil end == nil
        let node: TreeNode? = CreateBinaryTree.TreeNode.init(value: (slow?.val)!, left: nil, right: nil)
        node?.left = build(start, slow)
        node?.right = build(slow?.next, end)
        
        return node
    }
    
}



// MARK: - 测试代码:
func ConvertSortedListToBinarySearchTree() {
    
    // 单链表
    let head = CreatSinglyList().convertArrayToSinglyList([1, 2, 3, 4, 5, 6, 7, 8])
    let root = Solution().sortedListToBST(head)
    print(root ?? "构建失败")
}

