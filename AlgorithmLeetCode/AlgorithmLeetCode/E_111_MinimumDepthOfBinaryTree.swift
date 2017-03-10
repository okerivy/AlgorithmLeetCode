//
//  E_111_MinimumDepthOfBinaryTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/10.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/minimum-depth-of-binary-tree

import Foundation



// MARK: - 题目名称: 111. Minimum Depth of Binary Tree

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search, Breadth-first Search
 
 相关题目:
  (M) Binary Tree Level Order Traversal
  (E) Maximum Depth of Binary Tree
 
 */

/* MARK: - 题目英文:
 Given a binary tree, find its minimum depth.
 
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 different from maximum depth. if a node only has one child, the depth will be 1 + child depth.
 */


/* MARK: - 题目翻译:
 给定一个二叉树，找到它的最小深度。
 最小深度是沿着最短路径从根节点到最近的叶节点的节点数量。
 
 */



/* MARK: - 解题思路:
 和之前的一题求二叉树的最大深度的题目104. Maximum Depth of Binary Tree基本完全一致
 区别在于需要求出根节点到最近的叶子节点的深度，我们仍然使用遍历的方式
 
 不同于最大深度。如果一个节点只有一个，深度将是1 +子结点的深度。
 
 */

// FIXME: 没有完成
/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    
    // 找到它的最小深度
    func minDepth(_ root: TreeNode?) -> Int {
    
        guard let root = root else {
            return 0
        }
        
        if (root.left == nil) { return minDepth(root.right) + 1}
        if (root.right == nil) { return minDepth(root.left) + 1}
        return min(minDepth(root.left), minDepth(root.right)) + 1
    }
}



// MARK: - 测试代码:

// MARK: - 测试代码:
func minimumDepthOfBinaryTree() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    print(Solution().minDepth(root1), CreateBinaryTree().isValidBST(root: root1))
    print(Solution().minDepth(root2), CreateBinaryTree().isValidBST(root: root2))
    print(Solution().minDepth(root3), CreateBinaryTree().isValidBST(root: root3))
    
}






