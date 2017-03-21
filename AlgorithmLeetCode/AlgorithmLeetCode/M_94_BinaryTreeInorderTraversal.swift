//
//  M_94_BinaryTreeInorderTraversal.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/binary-tree-inorder-traversal

import Foundation





// MARK: - 题目名称: 94. Binary Tree Inorder Traversal

/* MARK: - 所属类别:
 标签: Tree, Hash Table, Stack
 
 相关题目:
 (M) Validate Binary Search Tree 
 (M) Binary Tree Preorder Traversal 
 (H) Binary Tree Postorder Traversal
 (M) Binary Search Tree Iterator 
 (M) Kth Smallest Element in a BST 
 (H) Closest Binary Search Tree Value II 
 (M) Inorder Successor in BST

 */

/* MARK: - 题目英文:
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 For example:
 Given binary tree [1,null,2,3],
 1
  \
   2
  /
 3
 return [1,3,2].
 
 Note: Recursive solution is trivial, could you do it iteratively?
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，返回中序遍历的所有节点的值。
 例如：给定二叉树 {1,#,2,3}，
 
 1
  \
   2
  /
 3
 返回 [1,3,2]。
 注意： 递归的解决方案是微不足道的，你能使用迭代来解决这题吗?
 

 
 */



/* MARK: - 解题思路:
 
 迭代(Iteration)与递归(Recursion)
 
 下面的更简单的非递归遍历二叉树的方法来源于 简书作者紫松 http://www.jianshu.com/p/49c8cfd07410
 非常棒的一篇博客，对二叉树新的遍历方法讲解得非常透彻，并且三种遍历的方法非常统一，也适用于其他遍历方式。
 
 ------ Morris Traversal
 步骤：
 
 1. 如果当前节点的左孩子为空，则输出当前节点并将其右孩子作为当前节点。
 
 2. 如果当前节点的左孩子不为空，在当前节点的左子树中找到当前节点在中序遍历下的前驱节点。
 
    a) 如果前驱节点的右孩子为空，将它的右孩子设置为当前节点。当前节点更新为当前节点的左孩子。
 
    b) 如果前驱节点的右孩子为当前节点，将它的右孩子重新设为空（恢复树的形状）。输出当前节点。当前节点更新为当前节点的右孩子。
 
 3. 重复以上1、2直到当前节点为空。
 
 图示：
 
 下图为每一步迭代的结果（从左至右，从上到下），cur代表当前节点，深色节点表示该节点已输出。

 
 */


/* MARK: - 复杂度分析:
 中序遍历时间复杂度是 O(n),空间复杂度是 O(n)
 Morris Traversal 非递归,非迭代  时间复杂度是 O(n),空间复杂度是 O(1)
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
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
//        return inorderTraversalRecursion(root)
//        return inorderTraversalIteration(root)
        return inorderMorrisTraversal(root)
    }
    
    // 递归
    func inorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
            return []
        }
        
        var ans = [Int]()
        // 递归遍历
        let leftArr = inorderTraversalRecursion(root?.left)
        let rightArr = inorderTraversalRecursion(root?.right)
        
        // 添加左子树
        ans.append(contentsOf: leftArr)
        // 添加跟结点
        ans.append((root?.value)!)
        // 添加右子树
        ans.append(contentsOf: rightArr)

        return ans
    }
    
    // 迭代
    func inorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        
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
                // 找到结点
                ans.append((nood?.value)!)
            } else {
                // 入栈顺序将决定遍历顺序 倒着出去
                stack.append((nood?.right, false))
                stack.append((nood, true))
                stack.append((nood?.left, false))
            }
        }

        return ans
    }
    
    // Morris Traversal 非递归,非迭代  时间复杂度是 O(n),空间复杂度是 O(1)
    func inorderMorrisTraversal(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
            return []
        }
        
        var ans = [Int]()
        
        var cur: TreeNode? = root
        var prev: TreeNode? = nil
        
        while cur != nil {
            
            // 当前结点的左孩子为空, 那么就 找到了
            if cur?.left == nil {
                // 找到了, 加入数组
                ans.append((cur?.value)!)
                // 当前结点指针 指向 右孩子
                cur = cur?.right
            } else {
                
                // 寻找 根结点的 前驱结点
                // 1, 如果当前结点的左孩子 没有右子树, 那么前驱结点 就是 当前结点的左孩子
                // 2, 如果当前结点的左孩子 有右子树, 那么前驱结点 就是这个右子树 最右边的结点
                prev = cur?.left
                while prev?.right != nil && prev?.right !== cur {
                    prev = prev?.right
                }
                
                // 已经找到前驱结点
                if prev?.right == nil {
                    prev?.right = cur
                    cur = cur?.left
                } else if prev?.right === cur {
                    // 把前驱结点的 右孩子赋值为空 恢复二叉树的形状
                    prev?.right = nil
                    // 获取数值
                    ans.append((cur?.value)!)
                    // 移动指针
                    cur = cur?.right
                }
            }
            
        }
        
        
        return ans
    }
    
    
    
}




// MARK: - 测试代码:
func BinaryTreeInorderTraversal() {
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([5, 4, 8, 11, Int.min, 13, 4, 7, 2, Int.min, Int.min, 5, 1])
    let root3 = CreateBinaryTree().convertArrayToTree([10, 5, -3, 3, 2, Int.min, 11, 3, -2, Int.min, 1])
    
    
    print(Solution().inorderTraversal(root1))
    print(Solution().inorderTraversal(root2))
    print(Solution().inorderTraversal(root3))
    
}
