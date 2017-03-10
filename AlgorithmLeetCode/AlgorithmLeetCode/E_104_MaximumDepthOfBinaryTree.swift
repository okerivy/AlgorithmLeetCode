//
//  E_104_MaximumDepthOfBinaryTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/maximum-depth-of-binary-tree

import Foundation





// MARK: - 题目名称: 104. Maximum Depth of Binary Tree

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
  (E) Balanced Binary Tree
  (E) Minimum Depth of Binary Tree
 
 */

/* MARK: - 题目英文:
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 */


/* MARK: - 题目翻译:
 给定一个二叉树，找到它的最大深度。
 最大深度是沿着最长路径从根节点到最远的叶节点的节点数量。
 
 */



/* MARK: - 解题思路:
 
 这是一道最常规的寻找二叉树最大深度的问题。
 使用递归算法即可解决。
 代码非常容易理解。
 我们只需要递归遍历二叉树，达到一个叶子节点的时候，记录深度，我们就能得到最深的深度了。
 
 */

// FIXME: 没有完成
/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {

    // 找到它的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
    
}



// MARK: - 测试代码:
func maximumDepthOfBinaryTree() {
    

    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    print(Solution().maxDepth(root1), CreateBinaryTree().isValidBST(root: root1))
    print(Solution().maxDepth(root2), CreateBinaryTree().isValidBST(root: root2))
    print(Solution().maxDepth(root3), CreateBinaryTree().isValidBST(root: root3))

}



