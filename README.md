# DefaultCodable

#### 简介

---

`DefaultCodable`是基于`Swift`属性包装器实现的库，配合`Codable`使用可提高代码的健壮性。使用`Codable`解析`Json`数据时，有些字段可能为`null`或不存在，使用`DefaultCodable`可以指定属性的默认值，保证属性不为`nil`。另外如果`Json`含有未声明的枚举时，通常情况下会导致崩溃，设置`@Default.FirstCase`则会默认使用第一个枚举值。

#### 示例

```swift
struct Model: Codable {
    // 枚举需遵循CaseIterable协议
    enum Category: String, Codable, CaseIterable {
        case unknown, oneCase, twoCase
    }
  
    // 标记title默认值为空字符串
    @Default.EmptyString
    var title: String
  
    // 标记comments默认值为空数组
    @Default.EmptyArray
    var comments: [Int]
  
    // 标记actions默认值为空字典
    @Default.EmptyDictionary
    var actions: [String: Bool]
  
    // 标记flag默认值为true
    @Default.True
    var flag: Bool
  
    // 标记count默认值为0
    @Default.Zero
    var count: Int

    // 标记value默认值为1
    @Default.One
    var value: Double
  
    // 注意：当使用FirstCase或者LastCase，对应的枚举类要遵循CaseIterable协议
    // 标记category1默认值为第一个枚举
    @Default.FirstCase
    var category1: Category
  
    // 标记category2默认值为最后一个枚举
    @Default.LastCase
    var category2: Category
}
```

