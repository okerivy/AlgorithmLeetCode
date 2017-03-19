//
//  E_101_SymmetricTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/symmetric-tree

import Foundation



// MARK: - 题目名称: 101. Symmetric Tree

/* MARK: - 所属类别:
 标签:
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
      1
    /   \
   2     2
  / \   / \
 3   4 4   3
 But the following [1,2,2,null,3,null,3] is not:
   1
  / \
 2   2
  \   \
   3   3
 Note:
 Bonus points if you could solve it both recursively and iteratively.
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树,检查它是不是自己的镜像(即关于中心对称)。
 例如, 二叉树 [1,2,2,3,4,4,3] 是对称的:
 
     1
   /  \
  2    2
 / \  / \
 3  4 4  3
 但是下面的二叉树 [1,2,2,null,3,null,3] 不是中心对称的:
 
    1
   / \
  2   2
   \   \
    3   3
 注意：
 加分点就是如果你能采用递归和迭代两种方式解决它。
 
 */



/* MARK: - 解题思路:
 需要判断二叉树左节点的左节点与二叉树右节点的右节点是否相等；二叉树左节点的右节点与二叉树的右节点的左节点是否相等。
 
 递归: 这道题没什么特别的地方，现在这里简单的分析一下解题思路，从根节点往下，我们要判断三个条件.
 
 左右两个节点的大小是否相同.
 左节点的左孩子是否和右节点的右孩子相同.
 左节点的右孩子是否和右节点的左孩子相同.
 循环: 这道题的难点在于循环解法， 如果是循环解法，我们必须要用到额外的存储空间用于回溯，关键是对于这道题目， 我们要用多少？要怎么用？要用什么样的存储空间？
 
 递归求解，如果以上三个条件对于每一层都满足，我们就可以认为这棵树是镜像树.
 
 
 
 循环解法: 我们主要想介绍一下这道题的循环解法，对于循环，我们要满足对于每一层进行check，代替了递归，一般树的循环遍历，我们都是用FIFO的queue来作为临时空间存储变量的，所以这道题我们也选取了queue，但是我们用两个queue，因为我们要对于左右同时进行检查，很显然一个queue是不够的，具体实现细节，咱们还是看代码吧，，我相信代码更能解释方法.
 
 
 */


/* MARK: - 复杂度分析:
 递归:本质其实就是DFS,时间复杂度为O(n),空间复杂度O(1) 
 循环:时间复杂度O(n),空间复杂度O(n)
 
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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
       
        if root == nil {
            return true
        }
    
        
        return isSymmetricIteration(root?.left, root?.right)
    }
    
    // 递归
    private func isSymmetricRecursion(_ leftT: TreeNode?, _ rightT: TreeNode?) -> Bool {
        
        if leftT == nil || rightT == nil {
            return leftT == nil && rightT == nil
        } else {
            let value = (leftT?.value == rightT?.value)
            let left = isSymmetricRecursion(leftT?.left, rightT?.right)
            let right = isSymmetricRecursion(leftT?.right, rightT?.left)
            return value && left && right
        }
    }
    
    // 迭代遍历
    private func isSymmetricIteration(_ leftT: TreeNode?, _ rightT: TreeNode?) -> Bool {
        
        // 判断是否为空
        if leftT == nil || rightT == nil {
            return leftT == nil && rightT == nil
        }
        
        // 构建两个栈
        var stack_p: [TreeNode] = []
        var stack_q: [TreeNode] = []
        
        // push元素
        stack_p.append(leftT!)
        stack_q.append(rightT!)
        
        // 判断栈中是否有数据
        while stack_p.isEmpty == false && stack_q.isEmpty == false {
            // pop出最后一个元素
            let temp_p = stack_p.removeLast()
            let temp_q = stack_q.removeLast()
            
            // 值不相等
            if temp_p.value != temp_q.value {
                return false
            }
            
            // 值相等
            // 判断是否为空,来拼接进去, 因为数组不能加入nil
            if temp_p.left != nil {
                stack_p.append(temp_p.left!)
            }
            if temp_q.right != nil {
                stack_q.append(temp_q.right!)
            }
            
            // 判断栈中个数是否相等
            if stack_p.count != stack_q.count {
                return false
            }
            
            
            if temp_p.right != nil {
                stack_p.append(temp_p.right!)
            }
            
            if temp_q.left != nil {
                stack_q.append(temp_q.left!)
            }
            
            // 判断栈中个数是否相等
            if stack_p.count != stack_q.count {
                return false
            }
            
        }
        
        return stack_p.count == stack_q.count
    }
}



// MARK: - 测试代码:
// MARK: - 测试代码:
func SymmetricTree() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([1, 2, 2, Int.min, 3, Int.min, 3])
    
    
    print(Solution().isSymmetric(root1))
    print(Solution().isSymmetric(root2))
    
}

