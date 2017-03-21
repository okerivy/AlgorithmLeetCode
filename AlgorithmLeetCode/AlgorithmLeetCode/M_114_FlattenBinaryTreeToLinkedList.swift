//
//  M_114_FlattenBinaryTreeToLinkedList.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/21.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation



// MARK: - 题目名称: 114. Flatten Binary Tree to Linked List

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Given a binary tree, flatten it to a linked list in-place.
 
 For example,
 Given
 
     1
    / \
   2   5
  / \   \
 3   4   6
 The flattened tree should look like:
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 click to show hints.
 
 Hints:
 If you notice carefully in the flattened tree, each node's right child points to the next node of a pre-order traversal.
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，将其扁平化到一个链表中。
 例如,
 
     1
    / \
   2   5
  / \   \
 3   4   6
 扁平的树应该看起来像：
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 点击显示提示。
 提示:
 如果你仔细注意到在平坦的树，每个节点的右子点指向下一个节点的顺序遍历。
 
 */



/* MARK: - 解题思路:
 
 我们可以看到处理之后的节点顺序其实跟前序遍历原二叉树的一致，所以我们只需要前序遍历二叉树同时处理就可以了。
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func flatten(_ root: inout TreeNode?) {
        
        if root == nil {
            return
        }
        
        // 定义一个 尾指针 (只是作为起点, 以后还要去掉)
        var tail = CreateBinaryTree().convertNumberToTree(-1)
        // 定义头指针 指向这个位置
        let header = tail
        
        // 前序遍历
        var stack = [(TreeNode?, Bool)]()
        
        stack.append((root, false))
        
        while !stack.isEmpty {
            let nood = stack.last?.0
            let visited = (stack.last?.1)!
            stack.removeLast()
            
            if nood == nil {
                continue
            }
            
            // 找到节点
            if visited {
                // 进行操作 右边赋值, 左边清空, 同时尾指针指向下一个元素
                tail?.right = nood
                tail?.left = nil
                tail = tail?.right
            } else {
                
                stack.append((nood?.right, false))
                stack.append((nood?.left, false))
                stack.append((nood, true))
            }
        }
        // 对root 进行赋值 因为header开始指向的是个临时数据, 所以需要 .right
        root = header?.right
    }
    
}



// MARK: - 测试代码:
func FlattenBinaryTreeToLinkedList() {
    
    var root1 = CreateBinaryTree().convertArrayToTree([1, 2, 5, 3, 4, Int.min, 6])

    Solution().flatten(&root1)
    print(root1 ?? "构建失败")
}




