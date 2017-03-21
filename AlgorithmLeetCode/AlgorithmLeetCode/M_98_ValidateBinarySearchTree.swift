//
//  M_98_ValidateBinarySearchTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/21.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation






// MARK: - 题目名称: 98. Validate Binary Search Tree

/* MARK: - 所属类别:
 标签:
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 Example 1:
   2
  / \
 1   3
 Binary tree [2,1,3], return true.
 Example 2:
   1
  / \
 2   3
 Binary tree [1,2,3], return false.
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，确定它是否是一个有效的二叉查找树（BST）。
 假设BST定义如下：
 节点的左子树只包含节点的密钥少于节点的键。
 节点的右子树只包含具有大于节点键的节点。
 的左、右子树也必须是二叉搜索树。
 例1：
   2
  / \
 1   3
 二叉树[ 2,1,3 ]，返回true。
 例2：
   1
  / \
 2   3
 二叉树[1,2,3]，返回false。
 
 */



/* MARK: - 解题思路:
 
 二叉排序树或者是一棵空树，或者是具有下列性质的二叉树：
 （1）若左子树不空，则左子树上所有结点的值均小于它的根结点的值；
 （2）若右子树不空，则右子树上所有结点的值均大于它的根结点的值；
 （3）左、右子树也分别为二叉排序树；
 （4）没有键值相等的节点。
 
 也可以通过中序遍历
 如果中序遍历得到的结果是递增的,那么他就是一个二叉排序树
 否则,则不是
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
     
        
        return validBSTHelper(root, nil, nil)
    }
    
    private func validBSTHelper(_ node: TreeNode?, _ minVal: Int?, _ maxVal: Int?) -> Bool {
        guard let node = node else { return true }
        
        if minVal != nil && node.value <= minVal! { return false }
        if maxVal != nil && node.value >= maxVal! { return false }
        
        // 左结点的值 要比它的根节点小
        // 右节点的值 要比它的根节点大
        return validBSTHelper(node.left, minVal, node.value) && validBSTHelper(node.right, node.value, maxVal)
    }
}



// MARK: - 测试代码:
func ValidateBinarySearchTree() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    print(Solution().isValidBST(root1), CreateBinaryTree().isValidBST(root: root1))
    print(Solution().isValidBST(root2), CreateBinaryTree().isValidBST(root: root2))
    print(Solution().isValidBST(root3), CreateBinaryTree().isValidBST(root: root3))
    
}


