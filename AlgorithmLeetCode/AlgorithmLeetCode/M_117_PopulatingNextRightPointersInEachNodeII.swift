//
//  M_117_PopulatingNextRightPointersInEachNodeII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii

import Foundation



// MARK: - 题目名称: 117. Populating Next Right Pointers in Each Node II

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 (M) Populating Next Right Pointers in Each Node
 
 */

/* MARK: - 题目英文:
 Follow up for problem "Populating Next Right Pointers in Each Node".
 
 What if the given tree could be any binary tree? Would your previous solution still work?
 
 Note:
 
 You may only use constant extra space.
 For example,
 Given the following binary tree,
     1
    /  \
   2    3
  / \    \
 4   5    7
 After calling your function, the tree should look like:
     1 -> NULL
    /  \
   2 -> 3 -> NULL
  / \    \
 4-> 5 -> 7 -> NULL
 Subscribe to see which companies asked this question.
 
 */


/* MARK: - 题目翻译:
 跟进问题”填充下右指针在每个节点”。
 如果给定的树可以是任意二叉树怎么办？你以前的解决方案仍然有效吗？
 注：
 您只能使用常量额外空间。
 例如,
 给定以下二叉树，
     1
    /  \
   2    3
  / \    \
 4   5    7
 调用函数后，树应该看起来像：
     1 -> NULL
    /  \
   2 -> 3 -> NULL
  / \    \
 4-> 5 -> 7 -> NULL
 
 */



/* MARK: - 解题思路:
 不同于上一题，这题的二叉树并不是完全二叉树，我们不光需要提供first指针用来表示一层的第一个元素，同时也需要使用另一个last指针表示该层上一次遍历的元素。
 那么我们只需要处理好如何设置last的next指针就可以了。
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func connect(_ root: inout TreeNode?) {
        
        if root == nil {
            return
        }
        
        var p: TreeNode? = root
        var first: TreeNode? = nil
        var last: TreeNode? = nil
        
        while p != nil {
            //设置下层第一个元素
            if first == nil {
                if p?.left != nil {
                    first = p?.left
                } else if p?.right != nil {
                    first = p?.right
                }
            }
            
            if p?.left != nil {
                 //如果有last，则设置last的next
                if last != nil {
                    // 先把上一个next 指向完成
                    last?.next = p?.left
                }
                //last完成使命, 移动指针指向left
                last = p?.left
            }
            
            if p?.right != nil {
                //如果有last，则设置last的next
                if last != nil {
                    last?.next = p?.right
                }
                //last为right
                last = p?.right
            }
            
            //如果有next，则转到next
            if p?.next != nil {
                p = p?.next
            } else {
                //转到下一层
                p = first
                first = nil
                last = nil
            }
            
        }
        
    }
    
}



// MARK: - 测试代码:
func PopulatingNextRightPointersInEachNodeII() {
    
    var root1 = CreateBinaryTree().convertArrayToTree([1, 2, 3, 4, 5, 6, 7])
    var root2 = CreateBinaryTree().convertArrayToTree([1, 2, 3, 4, 5, Int.min, 7])

    print(Solution().connect(&root1))
    print(Solution().connect(&root2))

    let head = CreatSinglyList().convertArrayToSinglyList([1, 2, 3, 4, 5, 6, 7])
    print(head ?? "链表为空")
}


