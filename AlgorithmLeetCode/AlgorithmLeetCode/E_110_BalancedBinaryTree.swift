//
//  E_110_BalancedBinaryTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation





// MARK: - 题目名称: 110. Balanced Binary Tree

/* MARK: - 所属类别:
 标签:  Tree, Depth-first Search
 
 相关题目:
 (E) Maximum Depth of Binary Tree
 
 */

/* MARK: - 题目英文:
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，判断它是不是高度平衡的。
 对于这个问题，一个高度平衡的二叉树的定义是：二叉树中，每个节点的左右子树的深度相差不会超过1。
 
 */



/* MARK: - 解题思路:
 
 解题思路: 这道题其实就是应用DFS，对于一颗二叉树边计算树的高度边计算差值，针对树里面的每一个节点计算它的左右子树的高度差，如果差值大于1，那么就返回-1，如果不大于1，从下往上再次检测.
 

 
 解决本题可以采用递归的思路。
 由于题目中涉及到左右子数的高度，所以可以先写一个函数来求一颗二叉树的最大高度。之前做过这样的题目，代码如下：
 
 func maxHeight(root: TreeNode?) -> Int
 {
     if root == nil
     {
         return 0
     }
     return max(maxHeight(root?.left), maxHeight(root?.right)) + 1
 }
 判断是否是高度平衡的二叉树的步骤如下：
 
 首先判断根节点是不是为空。如果根节点为 nil ，则是高度平衡的二叉树。
 然后 递归判断左右子数是否是高度平衡的二叉树，如果不同时是，则返回 false。
 分别求左右子数的高度，判断它们相差是否大于 1，如果大于 1，返回 false；否则返回 true。
 
 */


/* MARK: - 复杂度分析:
  时间复杂度: 由于是运用DFS，所以时间复杂度为O(n).
 
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
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        
        // 直接递归调用到最低层
        if !isBalanced(root?.left) || !isBalanced(root?.right) {
            return false
        }
        
        // 计算左右子树的 高度
        let leftH = maxHeight(root?.left) + 1
        let rightH = maxHeight(root?.right) + 1
        if abs(leftH - rightH) > 1 {
            return false
        }
        return true
    }
    
    private func maxHeight(_ root: TreeNode?) -> Int {
        
        if  root == nil {
            return 0
        }
        
        return max(maxHeight(root?.left), maxHeight(root?.right)) + 1
    }
    
}



// MARK: - 测试代码:
func BalancedBinaryTree() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([1, 2, 2, Int.min, 3, Int.min, 3])
    let root3 = CreateBinaryTree().convertArrayToTree([1, Int.min, 2, Int.min, 3, Int.min, 3])

    
    print(Solution().isBalanced(root1))
    print(Solution().isBalanced(root2))
    print(Solution().isBalanced(root3))

    
}




