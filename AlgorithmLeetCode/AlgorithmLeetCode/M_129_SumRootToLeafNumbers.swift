//
//  M_129_SumRootToLeafNumbers.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/21.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation




// MARK: - 题目名称: 129. Sum Root to Leaf Numbers

/* MARK: - 所属类别:
 标签:  Tree, Depth-first Search
 
 相关题目:
 (E) Path Sum 
 (H) Binary Tree Maximum Path Sum
 
 */

/* MARK: - 题目英文:
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
 
 An example is the root-to-leaf path 1->2->3 which represents the number 123.
 
 Find the total sum of all root-to-leaf numbers.
 
 For example,
 
   1
  / \
 2   3
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 
 Return the sum = 12 + 13 = 25.
 
 */


/* MARK: - 题目翻译:
 从0-9只有一个二叉树包含数字，每根叶路径可以表示一个数。
 一个例子是根到叶路径1->2->3表示数字123。
 求所有根到叶数的总和。
 例如,
   1
  / \
 2   3
 根到叶路径1>2表示数字12。
 根到叶路径1>3表示数字13。
 返回总和= 12 + 13 = 25。
 
 */



/* MARK: - 解题思路:
 从根节点到叶节点的遍历方法是深度优先搜索(DFS)。解决本题只需在遍历过程中记录路径中的数字，在到达叶节点的时候把记录下来的数字转换成数值，加到和里面即可。
 
 
 */


/* MARK: - 复杂度分析:
  时间复杂度: O(n)
 
 */


// MARK: - 代码:
private class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0
        var path = [Int]()
        DFS(root, &path, &sum)
        
        return sum
    }
    
    private func DFS(_ root: TreeNode?, _ path: inout [Int], _ sum: inout Int) {
        if root == nil {
            return
        }
        // 入栈
        path.append((root?.value)!)
        if root?.left == nil && root?.right == nil {
            // 找到 计算
            sum += arr2Num(path)
        } else {
            if root?.left != nil {
                // 递归
                DFS(root?.left, &path, &sum)
                // 出栈
                path.removeLast()
            }
            if root?.right != nil {
                // 递归
                DFS(root?.right, &path, &sum)
                // 出栈
                path.removeLast()
            }
        }
    }
    
    private func arr2Num(_ path: [Int]) -> Int {
        var sum = 0
        // path 里面的数字 是从 0 - 9  没有 二位数
        for i in 0..<path.count {
            sum = sum * 10 + path[i]
        }
        return sum
    }
    
}



// MARK: - 测试代码:
func SumRootToLeafNumbers() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([1, 2, 3, 4, 5, 6, 7, 8])

    
    print(Solution().sumNumbers(root1))
    
    
}


