//
//  M_144_BinaryTreePreorderTraversal.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/binary-tree-preorder-traversal

import Foundation



// MARK: - 题目名称: 144. Binary Tree Preorder Traversal

/* MARK: - 所属类别:
 标签: Tree, Stack
 
 相关题目:
 (M) Binary Tree Inorder Traversal 
 (M) Verify Preorder Sequence in Binary Search Tree

 
 */

/* MARK: - 题目英文:
 Given a binary tree, return the preorder traversal of its nodes' values.
 
 For example:
 Given binary tree {1,#,2,3},
 1
  \
   2
  /
 3
 return [1,2,3].
 
 Note: Recursive solution is trivial, could you do it iteratively?
 

 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，返回先序遍历的所有节点的值。
 例如：给定二叉树 {1,#,2,3}，
 
 1
  \
   2
  /
 3
 返回 [1,2,3]。
 注意： 递归的解决方案是微不足道的，你能使用迭代来解决这题吗?
 
 */



/* MARK: - 解题思路:
  迭代(Iteration)与递归(Recursion)
 
 下面的更简单的非递归遍历二叉树的方法来源于 简书作者紫松 http://www.jianshu.com/p/49c8cfd07410
 非常棒的一篇博客，对二叉树新的遍历方法讲解得非常透彻，并且三种遍历的方法非常统一，也适用于其他遍历方式。
 
 
 */


/* MARK: - 复杂度分析:
 
 
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
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
//        return preorderTraversalRecursion(root)
        return preorderTraversalIteration(root)

    }
    
    // 递归遍历
    private func preorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
            return []
        }
        
        var ans = [Int]()
        
        // 递归遍历
        let leftArr = preorderTraversalRecursion(root?.left)
        let rightArr = preorderTraversalRecursion(root?.right)
        
        // 添加跟结点
        ans.append((root?.value)!)
        // 添加左子树
        ans.append(contentsOf: leftArr)
        // 添加右子树
        ans.append(contentsOf: rightArr)

        return ans
    }
    
    // 迭代遍历
    private func preorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        
        // 排除特殊情况
        if root == nil {
            return []
        }
        
        // 将要返回的结果数组
        var ans = [Int]()
        // 使用数组模仿栈
        var stack = [(TreeNode?, Bool)]()
        // 先将根节点入栈
        stack.append((root, false))
        
        while !stack.isEmpty {
            // 获取栈顶元素
            let nood = stack.last?.0
            let visited = (stack.last?.1)!
            // 栈顶元素出栈
            stack.removeLast()
            if nood == nil {
                continue
            }
            
            if visited {
                //
                ans.append((nood?.value)!)
            } else {
                // 入栈顺序将决定遍历顺序 倒着出去
                stack.append((nood?.right, false))
                stack.append((nood?.left, false))
                stack.append((nood, true))
            }
        }
        
        return ans
    }
}



// MARK: - 测试代码:
// MARK: - 测试代码:
func BinaryTreePreorderTraversal() {
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([5, 4, 8, 11, Int.min, 13, 4, 7, 2, Int.min, Int.min, 5, 1])
    let root3 = CreateBinaryTree().convertArrayToTree([10, 5, -3, 3, 2, Int.min, 11, 3, -2, Int.min, 1])
    
    
    print(Solution().preorderTraversal(root1))
    print(Solution().preorderTraversal(root2))
    print(Solution().preorderTraversal(root3))

}



