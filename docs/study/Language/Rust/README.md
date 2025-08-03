# Rust

### 基础

```rust
// 定义
// 静态字符串
pub static RSA_PATH: &'static str = "../RSA.txt";
```

### 小问题

在 Rust 中，问号 `?` 是一种处理 `Result` 和 `Option` 错误的简介方式。它被称为"问号运算符"。
当你在 Rust 程序中调用一个可能失败的函数时（即函数返回 `Result` 或 `Option` 类型），你需要处理成功和失败两种情况。对于这两种情况，Rust 提供了多种处理方式，其中最简洁的就是使用问号运算符。
具体来说，问号运算符的工作原理如下：

- 如果 `Result` 或 `Option` 值是 `Ok(val)` 或 `Some(val)`，它会把 `val` 解包并返回。

- 如果 `Result` 或 `Option` 值是 `Err(e)` 或 `None`，它会立即从当前函数返回错误 `e` 或 `None`。
  这样可以让你的代码更简洁并保持可读性。
  例子：
  
  ```rust
  fn some_operation() -> Result<String, Error> {
  let result1 = may_fail_operation1()?;
  let result2 = may_fail_operation2()?;
  Ok(format!("Results: {}, {}", result1, result2))
  }
  ```
  
  在上述代码中，`may_fail_operation1` 和 `may_fail_operation2` 是可能会返回错误的函数。使用 `?`，我们可以在函数成功时获取值，并在函数出错时立刻从 `some_operation` 函数返回错误。这样就避免了复杂的 `match` 结构。
  但是请注意，问号运算符只能用于返回 `Result` 或者 `Option` 的函数中。如果你在一个返回其他类型或者不返回任何值的函数中使用问号，你会得到一个编译错误。

在 Rust 中，经常使用 `Result` 类型来处理可能错误的操作。`Result` 类型是一个枚举（enum），它有两种变体：`Ok` 和 `Err`。`Ok` 表示操作成功，而 `Err` 表示操作失败。
如果你的函数返回一个 `Result` 类型，并且你想要获取 `Ok` 中的内容，你可以使用 `match` 或者 `unwrap` 和 `expect` 方法。
这是一个示例：

```rust
fn might_fail() -> Result<i32, &'static str> {
 // 这只是一个示例，实际的函数可能会返回Err
 Ok(42)
}
fn main() {
 let result = might_fail();
 // 使用 match 获取
 match result {
 Ok(value) => println!("Got a value: {}", value),
 Err(err) => println!("An error occurred: {}", err),
 }
 // 使用 unwrap 获取
 // 注意：如果 Result 是 Err，unwrap 会引发 panic
 let value = result.unwrap();
 println!("Got a value: {}", value);
 // 使用 expect 获取
 // 注意：如果 Result 是 Err，expect 会引发 panic，并显示你提供的信息
 let value = result.expect("An error occurred");
 println!("Got a value: {}", value);
}
```

全部三种方法都可以从 `Ok` 中获取值。然而，需要注意的是，`unwrap` 和 `expect` 在面对 `Err` 时会引发 panic，导致程序崩溃。如果你需要处理可能的错误而不是直接崩溃，那么应该使用 `match` 或者 `if let`。
