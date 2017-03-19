//
//  E_107_BinaryTreeLevelOrderTraversalII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/binary-tree-level-order-traversal-ii

import Foundation


// MARK: - 题目名称: 107. Binary Tree Level Order Traversal II

/* MARK: - 所属类别:
 标签: Tree, Breadth-first Search
 
 相关题目:
  (M) Binary Tree Level Order Traversal
 
 */

/* MARK: - 题目英文:
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 return its bottom-up level order traversal as:
 [
  [15,7],
  [9,20],
  [3]
 ]
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，返回自底向上的顺序层次遍历节点的值。(从左到右，一级一级从叶到根遍历)。
 
 例如:
 给定二叉树 [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 返回它的从底向上层次遍历的结果为：
 
 [
  [15,7],
  [9,20],
  [3]
 ]
 
 */



/* MARK: - 解题思路:
 和上一题 102. Binary Tree Level Order Traversal 十分类似。之前解答只是之前是从上向下的顺序，现在是从下向上。思路基本一致，都采用递归的思想，但又有所区别。
 
 由于遍历的顺序是倒着的，所以每遇到新的一行，都需要向二维数组的最前面插入一行空的数组。
 
 if level == ans.count
 {
 ans.insert([], atIndex: 0)
 }
 然后递归调用函数遍历下一层，层数加1，由于下一层的遍历顺序是从左向右，所以先左节点，再右节点。
 
 levelTree(root?.left, level: level + 1, ans: &ans)
 levelTree(root?.right, level: level + 1, ans: &ans)
 最关键的地方在于，根节点的值应当插在哪一层上面？由于是倒叙的，所以应当是数组中的层数减去当前层数。
 

 ans[ans.count - 1 - level].append((root?.val)!)
 完整代码如下所示：
 
 
 */


/* MARK: - 复杂度分析:
 时间复杂度为O(n)
 
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
       
        var ans = [[Int]]()
        levelTree(root: root, level: 0, ans: &ans)
        
        return ans
    }

    
    private func levelTree(root: TreeNode?, level: Int, ans: inout [[Int]]) {
        
        if root == nil {
            return
        }
        // 插入空数组
        if level == ans.count {
            ans.insert([], at: 0)
        }
        
        // 递归遍历 从左到右
        levelTree(root: root?.left, level: level+1, ans: &ans)
        levelTree(root: root?.right, level: level+1, ans: &ans)
        
        // 因为根结点是插到最后一行, 所以需要先遍历, 最后再插入
        ans[ans.count - 1 - level].append((root?.value)!)
    }
    
    
}



// MARK: - 测试代码:
func BinaryTreeLevelOrderTraversalII() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    print(Solution().levelOrderBottom(root1), CreateBinaryTree().isValidBST(root: root1))
    print(Solution().levelOrderBottom(root2), CreateBinaryTree().isValidBST(root: root2))
    print(Solution().levelOrderBottom(root3), CreateBinaryTree().isValidBST(root: root3))
    
}


