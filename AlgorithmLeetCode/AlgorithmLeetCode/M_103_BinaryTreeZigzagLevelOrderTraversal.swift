//
//  M_103_BinaryTreeZigzagLevelOrderTraversal.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal

import Foundation



// MARK: - 题目名称: 103. Binary Tree Zigzag Level Order Traversal

/* MARK: - 所属类别:
 标签: Tree, Breadth-first Search, Stack
 
 相关题目:
  (M) Binary Tree Level Order Traversal
 
 */

/* MARK: - 题目英文:
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 return its zigzag level order traversal as:
 [
  [3],
  [20,9],
  [15,7]
 ]
 
 */


/* MARK: - 题目翻译:
 给定二叉树，返回其节点值的锯齿级遍历。（即从左到右，然后右到左为下一级和交替之间）。
 例如:
 给定的二叉树[ 3,9,20，空，空，7 ]，
   3
  / \
 9  20
   /  \
  15   7
 返回其锯齿级顺序遍历为：
 [
  [3],
  [20,9],
  [15,7]
 ]
 
 */



/* MARK: - 解题思路:
 完成 102 题目后
 只需要将得到的数据按照zigzag的方式翻转一下
 
 */


/* MARK: - 复杂度分析:
 时间复杂度为O(n)
 
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var ans = [[Int]]()
        levelTree(root: root, level: 0, ans: &ans)
        
        // 翻转数组 步长为2
        for i in stride(from: 1, to: ans.count, by: 2)  {
            ans[i] = ans[i].reversed()
        }
        
        return ans
    }
    
    
    private func levelTree(root: TreeNode?, level: Int, ans: inout [[Int]]) {
        
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
func BinaryTreeZigzagLevelOrderTraversal() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    print(Solution().zigzagLevelOrder(root1), CreateBinaryTree().isValidBST(root: root1))
    print(Solution().zigzagLevelOrder(root2), CreateBinaryTree().isValidBST(root: root2))
    print(Solution().zigzagLevelOrder(root3), CreateBinaryTree().isValidBST(root: root3))
    
}


