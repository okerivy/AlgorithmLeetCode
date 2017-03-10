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


/* MARK: - 复杂度分析:
 
 
 */



// MARK: - 代码:
private class CreateBinaryTree {
    
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
    
    class TreeNode {
        var value: Int
        var left: TreeNode?
        var right: TreeNode?
        init(value: Int, left: TreeNode?, right: TreeNode?) {
            self.value = value
            self.left = left
            self.right = right
        }
    }
    

    
    // 按数组来构建二叉树
    func convertArrayToTree(_ array: [Int]) -> TreeNode? {
        let count = array.count
        if count <= 0  {
            return nil
        }
        
        let root: TreeNode = TreeNode.init(value: array[0], left: nil, right: nil)
        var fifoQueue: [TreeNode] = [root]
        
        var  i = 1
        
        while i < count {
            
            let node: TreeNode = fifoQueue.removeFirst()
            
            if array[i] == Int.min {
                node.left = nil
            } else {
                node.left = TreeNode.init(value: array[i], left: nil, right: nil)
                if let left = node.left {
                    fifoQueue.append(left)
                }
            }
            if i+1 >= count {
                break
            }
            if array[i+1] == Int.min {
                node.right = nil
            } else {
                node.right = TreeNode.init(value: array[i+1], left: nil, right: nil)
                if let right = node.right {
                    fifoQueue.append(right)
                }
            }
            i += 2
        }
        
        return root
    }

    // Binary Search Tree 二叉查找树
    func convertArrayToBSTree(_ array: [Int]) -> TreeNode? {
        let count = array.count
        if count <= 0  {
            return nil
        }
        
        let root: TreeNode = TreeNode.init(value: array[0], left: nil, right: nil)
        for number in array {
            addNode(node: root, value: number)
        }
       
        return root
    }
    
    // 给 tree 添加左右结点
    private func addNode(node:TreeNode, value : Int) {
        
        if (value < node.value) {
            if let leftNode = node.left {
                // 递归添加
                addNode(node: leftNode, value: value)
            } else {
                node.left = TreeNode.init(value: value, left: nil, right: nil)
            }
        } else if (value > node.value) {
            if let rightNode = node.right {
                // 递归添加
                addNode(node: rightNode, value: value)
            } else {
                node.right = TreeNode.init(value: value, left: nil, right: nil)
            }
        }
    }

}





// MARK: - 代码:
private class Solution {

    typealias TreeNode = CreateBinaryTree.TreeNode
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
       
//        if root == nil
//        {
//            return 0
//        }
//        else if root?.left == nil && root?.right == nil
//        {
//            return 1
//        }
//        else if root?.left == nil && root?.right != nil
//        {
//            return maxDepth(root?.right) + 1
//        }
//        else if root?.left != nil && root?.right == nil
//        {
//            return maxDepth(root?.left) + 1
//        }
//        else
//        {
//            return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
//        }
//        
//        return 0
    }
    
}



// MARK: - 测试代码:
func maximumDepthOfBinaryTree() {
    

    let root1 = CreateBinaryTree().convertArrayToTree([4, 2, 6, 1, 3, 5, -1, 9])
    let root2 = CreateBinaryTree().convertArrayToTree([3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9, 10])
    let root3 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    
    
    
    print(Solution().maxDepth(root1))
    print(Solution().maxDepth(root2))
    print(Solution().maxDepth(root3))

}



