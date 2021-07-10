# StopHoldingCycles

The purpose of this project is to show an implementation that can save your app when it comes to retention of cycles and memory leaks

## Memory Leaks

Indeed, it’s one of the most frequent problems we face as developers. We code feature after feature and as the app grows, we introduce leaks.
A memory leak is a portion of memory that is occupied forever and never used again. It is garbage that takes space and causes problems.

## Retain Cycles

The word retain comes from the Manual Reference Counting days in Objective-C. Before ARC and Swift and all the nice things we can do now with value types, there was Objective-C and MRC. You can read about MRC and ARC in [this article](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID48).

## How to break retain cycles

Swift provides two ways to resolve strong reference cycles when you work with properties of class type: weak references and unowned references.
Weak and unowned references enable one instance in a reference cycle to refer to the other instance without keeping a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.
[Apple’s Swift Programming Language](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID48)

## Why is it important to be aware of cycle retention and memory leaks?

Not only they increase the memory footprint of the app, but they also introduce unwanted side effects and crashes.
Why does the memory footprint grow? It is a direct consequence of objects not being released. Those objects are actually garbage. As the actions that create those objects are repeated, the occupied memory will grow. Too much garbage! This can lead to memory warnings situations and in the end, the app will crash.

## Credits

- [Leandro Pérez](https://medium.com/@leandromperez)
- [Krzysztof Zabłocki](https://github.com/krzysztofzablocki)
- [Jesús Alfredo Hernández Alarcón](https://alfredohdz.medium.com/)

## References

- [Memory Leaks in Swift](https://medium.com/flawless-app-stories/memory-leaks-in-swift-bfd5f95f3a74)
- [Detecting memory leaks using Unit Tests in Swift](https://levelup.gitconnected.com/detecting-memory-leaks-using-unit-tests-in-swift-c37533e8ee4a)

