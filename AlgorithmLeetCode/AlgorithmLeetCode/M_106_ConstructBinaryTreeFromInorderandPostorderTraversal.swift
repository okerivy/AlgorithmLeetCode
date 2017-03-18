//
//  M_106_ConstructBinaryTreeFromInorderandPostorderTraversal.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/18.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal

import Foundation



// MARK: - 题目名称: 106. Construct Binary Tree from Inorder and Postorder Traversal

/* MARK: - 所属类别:
 标签: Tree, Array, Depth-first Search
 
 相关题目: 
  (M) Construct Binary Tree from Preorder and Inorder Traversal
 
 */

/* MARK: - 题目英文:
 
 Given inorder and postorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 */


/* MARK: - 题目翻译:
 给一棵树的的中序遍历 和 后序遍历，构造该二叉树。
 
 注：
 您可以假设树中不存在重复项。
 
 */



/* MARK: - 解题思路:
 
 ① NLR：前序遍历(PreorderTraversal亦称（先序遍历））
 ——访问结点的操作发生在遍历其左右子树之前。
 ② LNR：中序遍历(InorderTraversal)
 ——访问结点的操作发生在遍历其左右子树之中（间）。
 ③ LRN：后序遍历(PostorderTraversal)
 ——访问结点的操作发生在遍历其左右子树之后。
 
 要知道如何构建二叉树，首先我们需要知道二叉树的几种遍历方式，譬如有如下的二叉树：
 
             1
     --------|-------
     2               3
 ----|----       ----|----
 4       5       6       7
 前序遍历 1245367
 中序遍历 4251637
 后续遍历 4526731
 具体到上面这一题，我们知道了一个二叉树的中序遍历以及后序遍历的结果，那么如何构建这颗二叉树呢？
 
 仍然以上面那棵二叉树为例，我们可以发现，对于后序遍历来说，最后一个元素一定是根节点，也就是1。然后我们在中序遍历的结果里面找到1所在的位置，那么它的左半部分就是其左子树，有半部分就是其右子树。
 
 我们将中序遍历左半部分425取出，同时发现后序遍历的结果也在相应的位置上面，只是顺序稍微不一样，也就是452。我们可以发现，后序遍历中的2就是该子树的根节点。
 
 上面说到了左子树，对于右子树，我们取出637，同时发现后序遍历中对应的数据偏移了一格，并且顺序也不一样，为673。而3就是这颗右子树的根节点。
 
 重复上述过程，通过后续遍历找到根节点，然后在中序遍历数据中根据根节点拆分成两个部分，同时将对应的后序遍历的数据也拆分成两个部分，重复递归，就可以得到整个二叉树了。
 
 
 
 */


/* MARK: - 复杂度分析:
 递归，时间复杂度O(n)，空间复杂度O(\logn)
 
 */


// MARK: - 代码:
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
private class Solution {
    
    private var hashTable:Dictionary<Int, Int> = [:]
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if(postorder.isEmpty) {
            return nil;
        }
        
        // 用在查询根节点 索引位置 相当于以空间换时间
        for i in 0..<inorder.count {
            hashTable[inorder[i]] = i
        }

        
        return build(inorder, 0, inorder.count - 1,
                     postorder, 0, postorder.count - 1);
        
    }
    
    // start end0 代表二叉树的 起点和终点位置 因为分为左右两个二叉树
    // end 1 代表根节点的位置
    private func build(_ inorder: [Int], _ start0: Int, _ end0: Int, _ postorder: [Int], _ start1: Int, _ end1: Int) -> TreeNode? {
        if(start0 > end0 || start1 > end1) {
            return nil;
        }
        
        // 根据根节点 构建只有根节点的二叉树
        let root = CreateBinaryTree().convertArrayToTree([postorder[end1]])
        
        // 根据后序遍历 根节点, 在中序遍历数组中 找到 根节点的位置(通过hashTable)
        guard let  mid = hashTable[postorder[end1]] else { return root }
        
        
        // 计算左子树 的长度 3-0 = 3
        let num = mid - start0;
        
        
        // inorder  [0-2]  4, 2, 5,
        // postorder[0-2]  4, 5, 2,
        root?.left = build(inorder, start0, mid - 1, postorder, start1, start1 + num - 1);
        // inorder  [4-6]  6, 3, 7
        // postorder[3-5]  6, 7, 3,
        root?.right = build(inorder, mid + 1, end0, postorder, start1 + num, end1 - 1);
        
        return root;

    }
}



// MARK: - 测试代码:
func ConstructBinaryTreeFromInorderandPostorderTraversal() {
    
    let inorder = [4, 2, 5, 1, 6, 3, 7]
    let postorder = [4, 5, 2, 6, 7, 3, 1]
    
    let root = Solution().buildTree(inorder, postorder)
    print(root ?? "二叉树为空", CreateBinaryTree().isValidBST(root: root))

}


