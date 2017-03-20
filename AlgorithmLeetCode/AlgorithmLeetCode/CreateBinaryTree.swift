//
//  CreateBinaryTree.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/10.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation

typealias TreeNode = CreateBinaryTree.TreeNode

public class CreateBinaryTree {
    
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
        // 后来添加
        var next: TreeNode?
        init(value: Int, left: TreeNode?, right: TreeNode?) {
            self.value = value
            self.left = left
            self.right = right
            self.next = nil
        }
    }
    
    
    
    // MARK: - 按数组来构建二叉树
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
    
    // MARK: - 按数组来构建二叉查找树 Binary Search Tree
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
    
    // MARK: - 判断一颗二叉树是否为二叉查找树
    func isValidBST(root: TreeNode?) -> Bool {
        return _helperValidBST(node: root, nil, nil)
    }
    
    private func _helperValidBST(node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        
        // 如果结点为nil 返回true
        guard let node = node else {
            return true
        }
        
        // 所有右子节点都必须大于根节点
        if min != nil && node.value <= min! {
            return  false
        }
        
        //所有左子节点都必须小于根节点
        if max != nil && node.value >= max! {
            return false
        }
        
        return _helperValidBST(node: node.left, min, node.value) && _helperValidBST(node: node.right, node.value, max)
    }
    
}
