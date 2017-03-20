//
//  E_112_PathSum.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/path-sum

import Foundation




// MARK: - 题目名称: 112. Path Sum

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 (M) Path Sum II 
 (H) Binary Tree Maximum Path Sum 
 (M) Sum Root to Leaf Numbers 
 (E) Path Sum III

 
 */

/* MARK: - 题目英文:
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
 
 For example:
 Given the below binary tree and sum = 22,
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 

 
 */


/* MARK: - 题目翻译:
 给定一个二叉树和一个和 sum，判断二叉树是否有从根到叶子节点的路径，把所有沿路径的叶子节点的值相加和等于给定的总和 sum 。
 例如：给定下面的二叉树并且和 sum = 22,
 
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 返回true, 因为存在从根到叶子节点的路径 5->4->11->2 它的和是22。
 
 */



/* MARK: - 解题思路:
 
 采用递归的思路来解决这道题目非常容易。
 从根节点开始遍历，遍历到当前节点，将当前节点的值从总和中减去之后，只需要递归判断剩下的子树是否存在路径和等于剩下的值即可。
 找到路径的条件是，当前的节点为叶子节点，并且当前的值等于最后剩下的值即可。
 
 if root?.val == sum && root?.left == nil && root?.right == nil
 {
 return true
 }

 直接用DFS就可以求解.
 
 */


/* MARK: - 复杂度分析:
 时间复杂度: O(n)
 
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
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root?.value == sum && root?.left == nil && root?.right == nil {
            return true
        }
        
        return hasPathSum(root?.left, sum - (root?.value)!) || hasPathSum(root?.right, sum - (root?.value)!)
    }
    
}



// MARK: - 测试代码:
func PathSum() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([5, 4, 8, 11, Int.min, 13, 4, 7, 2, Int.min, Int.min, Int.min, 1])

    
    
    print(Solution().hasPathSum(root1, 6))
    print(Solution().hasPathSum(root2, 22))
  
}


