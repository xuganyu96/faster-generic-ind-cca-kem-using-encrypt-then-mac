# 魔改 Kyber
- [x] 修改kyber性能测试，使得可以在Apple Silicon上运行  
但是跑出来的数据看起来好奇怪
- [x] 测量封装和解封使用的CPU周期`test/test_etm_speed.c`
- [ ] 尝试使用GMAC，HMAC，KMAC，CMAC

## 配置 language server

```yaml
CompileFlags:
  Add: ["-I/opt/homebrew/Cellar/openssl@3/3.3.1/include"]
```
