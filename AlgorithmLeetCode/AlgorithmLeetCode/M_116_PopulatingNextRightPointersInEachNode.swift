//
//  M_116_PopulatingNextRightPointersInEachNode.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/populating-next-right-pointers-in-each-node

import Foundation




// MARK: - 题目名称: 116. Populating Next Right Pointers in Each Node

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目: 
 (M) Populating Next Right Pointers in Each Node II 
 (M) Binary Tree Right Side View

 */

/* MARK: - 题目英文:
 Given a binary tree
 
 struct TreeLinkNode {
    TreeLinkNode *left;
    TreeLinkNode *right;
    TreeLinkNode *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
 
 Initially, all next pointers are set to NULL.
 
 Note:
 
 You may only use constant extra space.
 You may assume that it is a perfect binary tree (ie, all leaves are at the same level, and every parent has two children).
 For example,
 Given the following perfect binary tree,
     1
    /  \
   2    3
  / \  / \
 4  5  6  7
 After calling your function, the tree should look like:
     1 -> NULL
    /  \
   2 -> 3 -> NULL
  / \  / \
 4->5->6->7 -> NULL
 
 */


/* MARK: - 题目翻译:
 给定二叉树
 struct TreeLinkNode {
    TreeLinkNode *left;
    TreeLinkNode *right;
    TreeLinkNode *next;
 }
 
 填充下一个指针指向它的右下一个节点。如果没有右下一个节点，则下一个指针应该设置为null。
 最初，所有下一个指针都设置为null。
 注：
 您只能使用常量额外空间。
 你可以假设它是一个完美的二叉树（即，所有的叶子都在同一水平，并且每个父母都有两个孩子）。
 例如,
 给出了以下完全二叉树，
     1
    /  \
   2    3
  / \  / \
 4  5  6  7
 调用函数后，树应该看起来像：
      1 -> NULL
    /  \
   2 -> 3 -> NULL
  / \  / \
 4->5->6->7 -> NULL
 
 */



/* MARK: - 解题思路:
 
 需要在一棵完全二叉树中使用next指针连接旁边的节点，我们可以发现一些规律。
 
 如果一个子节点是根节点的左子树，那么它的next就是该根节点的右子树，譬如上面例子中的4，它的next就是2的右子树5。
 如果一个子节点是根节点的右子树，那么它的next就是该根节点next节点的左子树。譬如上面的5，它的next就是2的next（也就是3）的左子树。

 first指针用来表示一层的第一个元素
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
        
        while p != nil {
            
            //记录下层第一个左子树
            if first == nil {
                first = p?.left
            }
            
            //如果有左子树，那么next就是父节点
            if p?.left != nil {
                p?.left?.next = p?.right
            } else {
                //叶子节点了，遍历结束
                break
            }
            
            //如果有next，那么设置右子树的next
            if p?.next != nil{
                p?.right?.next = p?.next?.left
                p = p?.next
                continue
            } else {
                //转到下一层
                p = first
                first = nil
            }
        }
    }
}



// MARK: - 测试代码:
func PopulatingNextRightPointersInEachNode() {
    
    var root1 = CreateBinaryTree().convertArrayToTree([1, 2, 3, 4, 5, 6, 7])
    
    print(Solution().connect(&root1))

    
}


