# 新知识库

## http3

HTTP/3 是 HTTP 协议的第三个主版本，基于 QUIC 传输协议。与 HTTP/2 相比，HTTP/3 采用 UDP 作为底层传输层协议，具备更低的连接延迟、更好的多路复用能力和更强的抗丢包能力。HTTP/3 主要优势包括：
- 基于 QUIC，减少了握手延迟
- 内建多路复用，避免队头阻塞
- 更安全，默认集成 TLS 1.3
- 适合移动和高丢包网络环境

### Go 语言 HTTP/3 服务端 Demo

```go
package main

import (
    "fmt"
    "log"
    "net/http"
    "github.com/lucas-clemente/quic-go/http3"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, HTTP/3!")
}

func main() {
    mux := http.NewServeMux()
    mux.HandleFunc("/", helloHandler)

    server := &http3.Server{
        Addr:      ":443",
        Handler:   mux,
        TLSConfig: generateTLSConfig(), // 需实现证书加载
    }
    log.Println("HTTP/3 server running on :443")
    log.Fatal(server.ListenAndServe())
}

// generateTLSConfig 需根据实际情况加载证书
```

> 说明：需使用 `github.com/lucas-clemente/quic-go/http3` 包，并配置 TLS 证书。更多细节请参考官方文档。

### Q/A
1.  http3 是否兼容 http2客户端？

    答：HTTP/3 并不直接兼容仅支持 HTTP/2 的客户端。HTTP/3 是基于 QUIC 协议（UDP），而 HTTP/2 基于 TCP。大多数现代浏览器和客户端会在与服务器协商时优先尝试使用 HTTP/3，如果不支持则自动回退到 HTTP/2 或 HTTP/1.1。因此，服务端通常需要同时支持多种协议以兼容不同客户端，但 HTTP/3 连接本身无法被仅支持 HTTP/2 的客户端直接使用。
2. 有没有办法让 http3 兼容 http2客户端？

    答：可以通过在服务端配置支持 HTTP/2 或 HTTP/1.1 的方式，让 HTTP/3 连接能够被 HTTP/2 客户端使用。但这需要在服务端进行配置，而不是客户端。
3. Springboot如何同时持http2和http3？

    答：Spring Boot 可以通过配置 `server.http2.enabled=true` 和 `server.http3.enabled=true` 来同时支持 HTTP/2 和 HTTP/3。但需要注意的是，HTTP/3 目前还处于试验阶段，可能存在一些兼容性问题，需要谨慎使用。