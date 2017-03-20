//
//  E_437_PathSumIII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/path-sum-iii

import Foundation



// MARK: - 题目名称: 437. Path Sum III

/* MARK: - 所属类别:
 标签:  Tree
 
 相关题目:
 (E) Path Sum 
 (M) Path Sum II
 
 */

/* MARK: - 题目英文:
 You are given a binary tree in which each node contains an integer value.
 
 Find the number of paths that sum to a given value.
 
 The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
 
 The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
 
 Example:
 
 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
 
       10
      /  \
     5   -3
    / \    \
   3   2   11
  / \   \
 3  -2   1
 
 Return 3. The paths that sum to 8 are:
 
 1.  5 -> 3
 2.  5 -> 2 -> 1
 3. -3 -> 11

 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，其中每个节点包含一个整数值。
 求与给定值求和的路径数。
 该路径不需要在根或叶开始或结束，但必须向下（仅从父节点到子节点）。
 该树有不超过1000个节点和值在范围- 1000000到1000000。
 例子:
 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
 
       10
      /  \
     5   -3
    / \    \
   3   2   11
  / \   \
 3  -2   1
 
 返回3。总和为8的路径是：
 1.  5 -> 3
 2.  5 -> 2 -> 1
 3. -3 -> 11

 
 */



/* MARK: - 解题思路:
 树的遍历，在遍历节点的同时，以经过的节点为根，寻找子树中和为sum的路径。
 
 
 */


/* MARK: - 复杂度分析:
 平衡树的时间复杂度为O(n*logn)
 在最坏的情况下，时间复杂度确实是O(n^2)
 
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
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        // 定义一个变量记录次数
        var ans = 0
        // 为空, 直接返回 0
        if root == nil { return ans}
        // 查找根节点的 满足条件的个数
        ans += DFS(root, sum)
        
        // 查找左右结点的 满足条件的个数
        ans += pathSum(root?.left, sum)
        ans += pathSum(root?.right, sum)
        
        return ans
    }
    
    private func DFS(_ root: TreeNode?, _ sum: Int) -> Int {
        // 定义一个变量记录次数
        var res = 0
        // 为空, 直接返回 0
        if root == nil { return res }
        // 满足条件 res 加1
        if sum == root?.value { res += 1}
        // 查找左右结点的 满足条件的个数
        res += DFS(root?.left, sum - (root?.value)!)
        res += DFS(root?.right, sum - (root?.value)!)
        
        return res
    }
    
}



// MARK: - 测试代码:
func PathSumIII() {
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 2, 3, 4, 4, 3])
    let root2 = CreateBinaryTree().convertArrayToTree([5, 4, 8, 11, Int.min, 13, 4, 7, 2, Int.min, Int.min, 5, 1])
    let root3 = CreateBinaryTree().convertArrayToTree([10, 5, -3, 3, 2, Int.min, 11, 3, -2, Int.min, 1])

    
    print(Solution().pathSum(root1, 6))
    print(Solution().pathSum(root2, 22))
    print(Solution().pathSum(root3, 8))

    
}


