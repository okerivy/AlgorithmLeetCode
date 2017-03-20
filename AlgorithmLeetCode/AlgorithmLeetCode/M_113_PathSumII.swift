//
//  M_113_PathSumII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/19.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/path-sum-ii

import Foundation




// MARK: - 题目名称: 113. Path Sum II

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 (E) Path Sum 
 (E) Binary Tree Paths 
 (E) Path Sum III

 */

/* MARK: - 题目英文:
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 
 For example:
 Given the below binary tree and sum = 22,
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 return
 [
 [5,4,11,2],
 [5,8,4,5]
 ]
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树和一个总和，找到所有根到叶子的路径，每条路径的总和等于给定的和。
 例如:
 鉴于下面的二叉树和总和 = 22，
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 返回
 [
  [5,4,11,2],
  [5,8,4,5]
 ]
 
 */



/* MARK: - 解题思路:
 
 
 
 */


/* MARK: - 复杂度分析:
 时间复杂度O(n)，空间复杂度O(logn)。
 
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
    
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        
        var result = [[Int]]()
        var path = [Int]()
        pathSumHelper(root, sum, &path, &result)
        
        return result
    }
    
    private func pathSumHelper(_ root: TreeNode?, _ sum: Int, _ path: inout [Int], _ results: inout [[Int]]) {
        
        // 如果为空, 直接返回
        if root == nil {
            return
        }
        // 先拼接
        path.append((root?.value)!)
        if root?.value == sum && root?.left == nil && root?.right == nil {
            // 满足条件 并且是最下面的子节点 证明找到了一条路径
            results.append(Array(path))
        }
        
        // 如果找到了 下面两句会直接return, 第三句执行
        // 如果没有找到, 下面两句会继续执行 第三句也会执行
        pathSumHelper(root?.left, sum - (root?.value)!, &path, &results)
        pathSumHelper(root?.right, sum - (root?.value)!, &path, &results)
        // 来到这里, 证明要么是找到了路径, 要么是已经到最底层了 但是还没有找到, 所以就往上层去遍历, pop掉顶层元素
        path.removeLast()

    }
    
}



// MARK: - 测试代码:
func PathSumII() {
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([5, 4, 8, 11, Int.min, 13, 4, 7, 2, Int.min, Int.min, 5, 1])
    
    
    print(Solution().pathSum(root1, 6))
    print(Solution().pathSum(root2, 22))
    
}




