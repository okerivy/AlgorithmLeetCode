//
//  testSwift.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/7.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation

func address<T: AnyObject>(o: T) -> String {
    return String.init(format: "%018p", unsafeBitCast(o, to: Int.self))
}

func address(o: UnsafeRawPointer) -> String {
    return String.init(format: "%018p", unsafeBitCast(o, to: Int.self))
}

func printDemo() {
    
    // 数组，无论什么数组都可以
    var str = ["hello", "world", "!\r\n"]
    
    // 查看一下数组
    print(str)
    
    // fr v -R str
    // 获取对象指针并打印地址
    // 第一种 和 第二种相同
    withUnsafePointer(to: &str) { pointer in
        print(pointer)
    }
    // 第二种 和 第一种相同
    withUnsafePointer(to: &str) {
        print("str has address: \($0)")
    }
    
    // 第三种
    print( Unmanaged.passUnretained(str as AnyObject).toOpaque() )
    
    // 第四种 和 第五种相同
    str.withUnsafeBytes {
        print($0)
    }
    // 第五种 和 第四种相同
    print(address(o: str))
    
}
