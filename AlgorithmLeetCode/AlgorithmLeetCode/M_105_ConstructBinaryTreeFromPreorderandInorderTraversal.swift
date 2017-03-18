//
//  M_105_ConstructBinaryTreeFromPreorderandInorderTraversal.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/18.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal

import Foundation




// MARK: - 题目名称: 105. Construct Binary Tree from Preorder and Inorder Traversal

/* MARK: - 所属类别:
 标签: Tree, Array, Depth-first Search
 
 相关题目:
  (M) Construct Binary Tree from Inorder and Postorder Traversal
 
 */

/* MARK: - 题目英文:
 Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 */


/* MARK: - 题目翻译:
 给一棵树的的中序遍历 和 前序遍历，构造该二叉树。
 
 注：
 您可以假设树中不存在重复项。
 
 */



/* MARK: - 解题思路:

 二叉树的重建，典型题。核心有两点：
 preorder 先序遍历的第一个节点即为根节点。
 确定 inorder 数组中的根节点后其左子树和右子树也是 preorder 的左子树和右子树。
 其中第二点是隐含条件，数组中没有重复元素，故可以根据先序遍历中第一个元素（根节点）得到根节点的值，然后在 inorder 中序遍历的数组中搜索得到根节点的索引值，即为左子树，右边为右子树。根据中序遍历中左子树的索引确定先序遍历数组中左子树的起止索引。递归直至处理完所有数组元素。
 
 要知道如何构建二叉树，首先我们需要知道二叉树的几种遍历方式，譬如有如下的二叉树：
 
             1
     --------|-------
     2               3
 ----|----       ----|----
 4       5       6       7
 前序遍历 1245367
 中序遍历 4251637
 后续遍历 4526731
 
 
 */


/* MARK: - 复杂度分析:
  递归，时间复杂度O(n)，空间复杂度O(\logn)
 
 */


// MARK: - 代码:
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
private class Solution {
    
    private var hashTable:Dictionary<Int,Int> = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty {
            return nil
        }
        
        for i in 0..<inorder.count {
            hashTable[inorder[i]] = i
        }
        
        return build(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    
    private func build(_ preorder: [Int], _ preStart: Int, _ preEnd: Int, _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        
        if (preStart > preEnd || inStart > inEnd) {
            return nil
        }
        
        // 根据根节点 构建只有根节点的二叉树
        let root = CreateBinaryTree().convertArrayToTree([preorder[preStart]])
        // 根据前序遍历 根节点, 在中序遍历数组中 找到 根节点的位置(通过hashTable)
        guard let mid = hashTable[preorder[preStart]] else { return root }
        
        // 计算左子树 的长度 3-0 = 3
        let num = mid - inStart
        
        // inorder  [0-2]  4, 2, 5
        // preorder [1-3]  2, 4, 5
        root?.left = build(preorder, preStart + 1, preStart + num, inorder, inStart, mid - 1)
        // inorder  [4-6]  6, 3, 7
        // preorder [4-6]  3, 6, 7
        root?.right = build(preorder, preStart + num + 1, preEnd, inorder, mid + 1, inEnd)
        
        return root
    }
}





// MARK: - 测试代码:
func ConstructBinaryTreeFromPreorderandInorderTraversal() {
    
    let inorder = [4, 2, 5, 1, 6, 3, 7]
    let preorder = [1, 2, 4, 5, 3, 6, 7]
    
    let root = Solution().buildTree(preorder, inorder)
    print(root ?? "二叉树为空", CreateBinaryTree().isValidBST(root: root))
    
}






