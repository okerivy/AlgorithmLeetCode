//
//  E_108_ConvertSortedArrayToBinarySearchTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/20.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree

import Foundation




// MARK: - 题目名称: 108. Convert Sorted Array to Binary Search Tree

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 (M) Convert Sorted List to Binary Search Tree
 
 */

/* MARK: - 题目英文:
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 */


/* MARK: - 题目翻译:
 给定一个数组，其中的元素按升序排序，将它转换成一个高度平衡的二叉查找树。
 
 */



/* MARK: - 解题思路:
 
 二分法
 
 */


/* MARK: - 复杂度分析:
 二分法，时间复杂度O(n)，空间复杂度O(logn)
 
 */


// MARK: - 代码:
private class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        return build(nums, 0, nums.count)
    }
    
    private func build(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        // 终止条件
        if start >= end {
            return nil
        }
        
        // 获取中间节点
        let mid = start + (end - start)/2
        
        // 根据中间节点生成 根节点
        let root: TreeNode? = CreateBinaryTree().convertNumberToTree(nums[mid])
        root?.left = build(nums, start, mid)
        root?.right = build(nums, mid + 1, end)
        
        return root
    }
    
}



// MARK: - 测试代码:
// MARK: - 测试代码:
func ConvertSortedArrayToBinarySearchTree() {
    
    // 单链表
    let root = Solution().sortedArrayToBST([1, 2, 3, 4, 5, 6, 7, 8])
    print(root ?? "构建失败")
}


