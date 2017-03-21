//
//  E_257_BinaryTreePaths.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/21.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/binary-tree-paths

import Foundation





// MARK: - 题目名称: 257. Binary Tree Paths

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 (M) Path Sum II
 
 */

/* MARK: - 题目英文:
 Given a binary tree, return all root-to-leaf paths.
 
 For example, given the following binary tree:
 
    1
  /   \
 2     3
  \
   5
 All root-to-leaf paths are:
 
 ["1->2->5", "1->3"]
 
 */


/* MARK: - 题目翻译:
 给定一个二叉树，返回所有根到叶子的路径。
 例如，给定下面的二叉树：
    1
  /   \
 2     3
  \
   5
 所有的根到叶子的路径都是：
  ["1->2->5", "1->3"]
 
 */



/* MARK: - 解题思路:
 本题属于二叉树的遍历问题，可以用深度优先搜索来解决。
 
 使用栈来记录遍历过程中访问过的节点。递归地访问每个节点的子节点，如果遇到叶节点，则输出记录的路径。返回上一层之前弹出栈顶元素。
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [String]()
        var path = [Int]()
        // 搜索路径
        BFS(root, &path, &result)
        return result
    }
    
    // 递归函数，深度优先搜索
    private func BFS(_ root: TreeNode?, _ path: inout [Int], _ result: inout [String]) {
        
        if  root == nil {
            return
        }
        
        // 入栈
        path.append((root?.value)!)
        
        if root?.left == nil && root?.right == nil {
            // 找到 拼接到数组中
            result.append(generatePath(path))
        } else {
            if root?.left != nil {
                // 递归
                BFS(root?.left, &path, &result)
                // 出栈 方便去调用 右子树
                path.removeLast()
            }
            if root?.right != nil {
                // 递归
                BFS(root?.right, &path, &result)
                // 出栈
                path.removeLast()
            }
        }
    }
    // 辅助函数，用于生成路径字符串
    private func generatePath(_ path: [Int]) -> String {
        var res = ""
        
        for i in 0..<(path.count - 1) {
            res += "\(path[i])\("->")"
        }
        res += "\((path.last)!)"
        return  res
    }
    
    
}



// MARK: - 测试代码:
func BinaryTreePaths() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 3, 4, 5, 6, 7, 8])
    
    
    print(Solution().binaryTreePaths(root1))

    
}




