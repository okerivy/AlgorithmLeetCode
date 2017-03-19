//
//  E_100_SameTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation



// MARK: - 题目名称: 100. Same Tree

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Given two binary trees, write a function to check if they are equal or not.
 
 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 
 */


/* MARK: - 题目翻译:
 给定两个二叉树，编写一个函数来判断它们是否相等。如果两个二叉树在结构上是相同的，并且所有的节点有相同的值，则它们被认为是相等的。
 
 */



/* MARK: - 解题思路:
 又是一题经典的递归程序。
 如果当前节点的值相等，则递归调用当前函数判断两个二叉树的左分支和右分支是否分别相等即可。
 需要注意的是，如果两个节点都为空，则返回true。如果两个节点值不相等，则返回false。

 
 
 */


/* MARK: - 复杂度分析:
 迭代(Iteration)与递归(Recursion)
 递归版，因为是DFS, 所以时间复杂度为O(n)，空间复杂度O(logn)
 迭代版，时间复杂度O(n)，空间复杂度O(logn)
 
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        return isSameTreeIteration(p, q)
    }
    
    private func isSameTreeRecursion(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // 判断是否为空
        if p == nil || q == nil {
            return (p == nil && q == nil)
        } else {
            // 不为空 判断值是否相等
            let value = (p?.value == q?.value)
            // 递归遍历左子树
            let left = isSameTreeRecursion(p?.left, q?.left)
            // 递归遍历右子树
            let right = isSameTreeRecursion(p?.right, q?.right)
            return value && left && right
        }
    }
    
    private func isSameTreeIteration(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        // 判断是否为空
        if p == nil || q == nil {
            return (p == nil && q == nil)
        }
        // 构建两个栈
        var stack_p: [TreeNode] = []
        var stack_q: [TreeNode] = []
        // push元素
        stack_p.append(p!)
        stack_q.append(q!)
        
        // 判断栈中是否有数据
        while (stack_p.isEmpty == false && stack_q.isEmpty == false) {
            
            // pop出最后一个元素
            let tem_p: TreeNode = stack_p.removeLast()
            let tem_q: TreeNode = stack_q.removeLast()
            // 值不相等
            if tem_p.value != tem_q.value {
                return false
            }
            
            // 值相等
            // 判断是否为空,来拼接进去, 因为数组不能加入nil
            if tem_p.left != nil {
                stack_p.append(tem_p.left!)
            }
            if tem_q.left != nil {
                stack_q.append(tem_q.left!)
            }
            // 判断栈中个数是否相等
            if stack_p.count != stack_q.count {
                return false
            }
            
            // 右边
            if tem_p.right != nil {
                stack_p.append(tem_p.right!)
            }
            if tem_q.right != nil {
                stack_q.append(tem_q.right!)
            }
            if stack_p.count != stack_q.count {
                return false
            }
        }
        
        return stack_q.count == stack_q.count
    }
}



// MARK: - 测试代码:
func SameTree() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    
    
    print(Solution().isSameTree(root1, root2))
    print(Solution().isSameTree(root1, root3))
    
}


