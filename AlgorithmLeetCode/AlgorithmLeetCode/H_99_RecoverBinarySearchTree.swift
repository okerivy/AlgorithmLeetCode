//
//  H_99_RecoverBinarySearchTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/21.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation



// MARK: - 题目名称: 99. Recover Binary Search Tree

/* MARK: - 所属类别:
 标签: Tree, Depth-first Search
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 Two elements of a binary search tree (BST) are swapped by mistake.
 
 Recover the tree without changing its structure.
 
 Note:
 A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?
 
 */


/* MARK: - 题目翻译:
 二进制搜索树（BST）的两个元素被错误交换。
 不改变结构的情况下恢复树。
 注：
 使用O（n）空间的解决方案是相当直向前。你能想出一个恒定的空间解吗？
 
 Input Tree:
     10
    /  \
   5    8
  / \
 2   20
 
在上面的树中，必须交换节点20和8来修复树。
     10
    /  \
   5    20
  / \
 2   8
 */



/* MARK: - 解题思路:
 
 这题需要修复一颗二叉搜索树的两个交换节点数据，我们知道对于一颗二叉搜索树来说，如果按照中序遍历，那么它输出的值是递增有序的，所以我们只需要按照中序遍历输出，在输出结果里面找到两个异常数据（比它后面输出结果大），交换这两个节点的数据就可以了。
 
 但是这题要求使用O(1)的空间，如果采用通常的中序遍历（递归或者栈）的方式，都需要O(N)的空间，所以这里我们用Morris Traversal的方式来进行树的中序遍历。
 
 Morris Traversal中序遍历的原理比较简单：
 
 如果当前节点的左孩子为空，则输出当前节点并将其有孩子作为当前节点。
 如果当前节点的左孩子不为空，在当前节点的左子树中找到当前节点在中序遍历下的前驱节点，也就是当前节点左子树的最右边的那个节点。
 如果前驱节点的右孩子为空，则将它的右孩子设置为当前节点，当前节点更新为其左孩子。
 如果前驱节点的右孩子为当前节点，则将前驱节点的右孩子设为空，输出当前节点，当前节点更新为其右孩子。
 重复上述过程，直到当前节点为空，
 
 递归的时候我们同时需要记录错误的节点。那么我们如何知道一个节点的数据是不是有问题呢？
 对于中序遍历来说，假设当前节点为cur，它的前驱节点为pre，如果cur的值小于pre的值，那么cur和pre里面的数据就是交换的了。
 
 中序遍历为 3 20 7 10 15 5 25
 发现, 20 > 7  15 > 5 所以 错的数字 在 20 7 15 5 这四个数字里面
 分析可得为 20 和 5 , 因为 对于一个有序数列的 两个数乱序(交换) 其实就是一个大的数字 20 放到了前面, 一个小的数字 5 放到了后面

 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func recoverTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        var cur: TreeNode? = root
        var prev: TreeNode? = nil
        var preCur: TreeNode? = nil
        
        var p1: TreeNode? = nil
        var p2: TreeNode? = nil
        var found = false
        
        while cur != nil {
            
            // 找到的第一个数字 肯定是 cur?.left == nil 
            // 因为它肯定是 一个没有左孩子的结点
            if cur?.left == nil {
                // 找到
                if preCur != nil && (preCur?.value)! > (cur?.value)! {
                    if !found {
                        // 只会执行一次 找到前面的那个大数字 即 当前结点7 的 上一个结点20
                        p1 = preCur
                        found = true
                    }
                    // 会执行两次 找到后面的那个小数字 即 当前结点 5
                    p2 = cur
                }
                
                // 所以 这一句话肯定是 先执行 所以 下面就不用再判断 preCur != nil
                preCur = cur
                cur = cur?.right
            } else {
                
                prev = cur?.left
                while prev?.right != nil && prev?.right !== cur {
                    prev = prev?.right
                }
                
                if prev?.right == nil {
                    prev?.right = cur
                    cur = cur?.left
                } else {
                    // 找到
                    if (preCur?.value)! > (cur?.value)! {
                        
                        if !found {
                            // 只会执行一次 找到前面的那个大数字 即 当前结点7 的 上一个结点20
                            p1 = preCur
                            found = true
                        }
                        // 会执行两次 找到后面的那个小数字 即 当前结点 5
                        p2 = cur
                    }
                    
                    preCur = cur
                    prev?.right = nil
                    cur = cur?.right
                }
            }
 
        }
        
        if p1 != nil && p2 != nil {
            let temp = (p1?.value)!
            p1?.value = (p2?.value)!
            p2?.value = temp
        }
    }
}



// MARK: - 测试代码:
func RecoverBinarySearchTree() {
    
    
    let root1 = CreateBinaryTree().convertArrayToTree([10, 9, 11, Int.min, 8])//CreateBinaryTree().convertArrayToTree([10, 20, 5, 2, 8])
    let root2 = CreateBinaryTree().convertArrayToBSTree([8,2,10,9,11,1,7])
    let root3 = CreateBinaryTree().convertArrayToTree([10, 5, 20, 3, 7, 15, 25, Int.min, Int.min, Int.min, 8])
    let root4 = CreateBinaryTree().convertArrayToTree([10, 20, 5, 3, 7, 15, 25, Int.min, Int.min, Int.min, 8])
    let root5 = CreateBinaryTree().convertArrayToTree([10, 3, 20, 5, 7, 15, 25, Int.min, Int.min, Int.min, 8])

    
    print(CreateBinaryTree().isValidBST(root: root1), Solution().recoverTree(root1), CreateBinaryTree().isValidBST(root: root1))
    print(CreateBinaryTree().isValidBST(root: root2), Solution().recoverTree(root2), CreateBinaryTree().isValidBST(root: root2))
    print(CreateBinaryTree().isValidBST(root: root3), Solution().recoverTree(root3), CreateBinaryTree().isValidBST(root: root3))
    print(CreateBinaryTree().isValidBST(root: root4), Solution().recoverTree(root4), CreateBinaryTree().isValidBST(root: root4))
    print(CreateBinaryTree().isValidBST(root: root5), Solution().recoverTree(root5), CreateBinaryTree().isValidBST(root: root5))

    
}



