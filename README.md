# go-mitm

中间人代理。可以更方便地查看请求/响应结果，可以将请求转化成常用语言的请求代码。

[go-mitm](https://github.com/lizongying/go-mitm)

## Contents

1. [Usage](#Usage)
    1. [Install certificate](#Install-certificate)
    2. [Set the proxy](#Set-the-proxy)
    3. [Run](#Run)
    4. [Open the link](#Open-the-link)
    5. [Include & Exclude](#Include--Exclude)
2. [Dev](#Dev)
3. [TODO](#TODO)

## Usage

### Install certificate

当前设备安装并信任CA证书 [ca.crt](https://github.com/lizongying/go-mitm/releases/download/v0.0.3/ca.crt)

mac:

![image](./screenshot/img_5.png)

windows:

![image](./screenshot/img_7.png)
![image](./screenshot/img_8.png)
![image](./screenshot/img_9.png)
![image](./screenshot/img_10.png)

### Set the proxy

设置代理为 http://localhost:8082

mac:

![image](./screenshot/img_6.png)

windows:

![image](./screenshot/img_12.png)
![image](./screenshot/img_13.png)

### Run

执行程序

```shell
mitm
```

参数:

* -mid-port 指定中间人端口
* -web-port 指定网页端口
* -include 指定包含规则，多条规则用";"分割（使用中间人，页面能看到记录）
* -exclude 指定排除规则，多条规则用";"分割（使用直连，页面看不到记录）
* -proxy proxy 指定上游代理

过滤规则仅对hostname过滤。如

* a.com
* a.com.cn
* a.*.cn
* *.com
* a.*
* a.com.*
* \*.*

mac:

[mitm_darwin_arm64](https://github.com/lizongying/go-mitm/releases/download/v0.0.3/mitm_darwin_arm64)
[mitm_darwin_amd64](https://github.com/lizongying/go-mitm/releases/download/v0.0.3/mitm_darwin_amd64)

linux:

[mitm_linux_arm64](https://github.com/lizongying/go-mitm/releases/download/v0.0.3/mitm_linux_arm64)
[mitm_linux_amd64](https://github.com/lizongying/go-mitm/releases/download/v0.0.3/mitm_linux_amd64)

windows:

[mitm_windows_amd64.exe](https://github.com/lizongying/go-mitm/releases/download/v0.0.3/mitm_windows_amd64.exe)

### Open the link

访问链接 http://localhost:8083

![image](./screenshot/img.png)
![image](./screenshot/img_1.png)
![image](./screenshot/img_4.png)
![image](./screenshot/img_2.png)
![image](./screenshot/img_3.png)

### Include & Exclude

按行进行分割，其他请参考`-include`和`-exclude`参数定义

![image](./screenshot/img_11.png)

## Dev

### Test

```shell
go run ./cmd/mitm-web/*.go

# http://localhost:5173/
npm run --prefix ./web/ui dev

curl -X POST "https://httpbin.org/post" -H "accept: application/json" --data '{"a":"xyz","b":"123"}' -x http://localhost:8082 --cacert ./static/tls/ca.crt

```

### Build

```shell
make
```

## TODO

* python http.client
* node https/request
* java
* middleware tmpdir save image/video
* replay
