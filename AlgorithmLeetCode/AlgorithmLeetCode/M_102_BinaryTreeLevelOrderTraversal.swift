//
//  M_102_BinaryTreeLevelOrderTraversal.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/binary-tree-level-order-traversal

import Foundation



// MARK: - 题目名称: 102. Binary Tree Level Order Traversal

/* MARK: - 所属类别:
 标签: Tree, Breadth-first Search
 
 相关题目:
  (M) Binary Tree Zigzag Level Order Traversal
  (E) Binary Tree Level Order Traversal II
  (E) Minimum Depth of Binary Tree
  (M) Binary Tree Vertical Order Traversal
 
 */

/* MARK: - 题目英文:
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 
    3
   / \
  9  20
    /  \
   15   7
 return its level order traversal as:
 [
  [3],
  [9,20],
  [15,7]
 ]
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，返回二叉树水平层次遍历的节点值(从左到右，逐层返回)。
 例如：给定二叉树 [3,9,20,null,null,15,7],
 
   3
  / \
 9  20
   /  \
  15   7
 返回它的层次遍历的结果为：
 
 [
  [3],
  [9,20],
  [15,7]
 ]
 
 */



/* MARK: - 解题思路:
 采用递归的思路来解决这题。每遇到新的一层，则在二维数组中增加一行空的数组。
 
 if level == ans.count
 {
    ans.append([])
 }
 并将根节点的值追加到数组的当前层。
 
 ans[level].append((root?.val)!)
 接下来就是遍历根节点的下面一层了，层数加 1。递归调用遍历函数，由于是从左到右的顺序，所以先左节点后右节点。
 
 levelTree(root?.left, level: level + 1, ans: &ans)
 levelTree(root?.right, level: level + 1, ans: &ans)
 
 
-----------
 
 题目分析: 对于二叉树的问题，我们第一想到的就是DFS或者BFS, DFS更易于理解代码，如果处理数据量不是很大的话.对于这样的面试题，我建议用DFS来求解.
 
 需要注意的点为:
 
 对于一棵树，如果我们要求每一层的节点，并且存在一个二维数组里，首先我们要建一个二维数组，但是这个二维数组建多大的合适呢？我们就要求出这颗树的深度，根据深度来建立二维数组.
 题目要求为从左往右添加,所以我们也就是要先放左边的节点，再放右边的节点.
 对于这道题，我们首先就是要用DFS来求出这颗树的高度，之后再用DFS对于每一层遍历，这样节省了空间复杂度.
 
 */


/* MARK: - 复杂度分析:
 时间复杂度分析: 由于两次DFS是并列的，并没有嵌套，所以我们的时间复杂度为O(n).
 
 */


// MARK: - 代码:
private class Solution {
    /**
     * Definition for a binary tree node.
     * public class TreeNode {
     *     public var val: Int
     *     public var left: TreeNode?
     *     public var right: TreeNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.left = nil
     *         self.right = nil
     *     }
     * }
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var ans = [[Int]]()
        levelTree(root: root, level: 0, ans: &ans)
        return ans
    }
    
    private func levelTree(root: TreeNode?, level: Int, ans: inout [[Int]]){
        if root == nil {
            return
        }
        
        // 拼接空数组
        if level == ans.count {
            ans.append([])
        }
        // 拼接元素
        ans[level].append((root?.value)!)
        // 递归遍历
        levelTree(root: root?.left, level: level+1, ans: &ans)
        levelTree(root: root?.right, level: level+1, ans: &ans)
        
    }
    
}



// MARK: - 测试代码:
func BinaryTreeLevelOrderTraversal() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    print(Solution().levelOrder(root1), CreateBinaryTree().isValidBST(root: root1))
    print(Solution().levelOrder(root2), CreateBinaryTree().isValidBST(root: root2))
    print(Solution().levelOrder(root3), CreateBinaryTree().isValidBST(root: root3))
    
}



