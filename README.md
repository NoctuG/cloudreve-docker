# Cloudreve 使用指南

这个文件将指导你如何使用 Cloudreve，一个基于云的文件管理系统。

## 准备工作

首先，你需要安装 Docker。Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器或 Windows 机器上，也可以实现虚拟化。关于如何安装 Docker，你可以参考 [Docker 官方文档](https://docs.docker.com/get-docker/)。

## 使用步骤

1. **构建 Docker 镜像**

    使用下面的命令构建 Docker 镜像：

    ```bash
    docker build -t cloudreve .
    ```

    这个命令会根据当前目录下的 `Dockerfile` 构建一个名为 `cloudreve` 的 Docker 镜像。

2. **运行 Docker 容器**

    使用下面的命令运行 Docker 容器：

    ```bash
    docker run -d -p 5212:5212 -p 6800:6800 -v /path/to/uploads:/cloudreve/uploads -v /path/to/avatar:/cloudreve/avatar -v /path/to/data:/data -e ARIA2_RPC_SECRET=your_token cloudreve
    ```

    这个命令会运行一个 `cloudreve` Docker 容器，并将容器的 5212 和 6800 端口分别映射到主机的 5212 和 6800 端口。同时，还会将主机上的 `/path/to/uploads`、`/path/to/avatar` 和 `/path/to/data` 目录分别映射到容器的 `/cloudreve/uploads`、`/cloudreve/avatar` 和 `/data` 目录。你需要将 `/path/to/uploads`、`/path/to/avatar` 和 `/path/to/data` 替换为你的实际路径。最后，通过 `-e` 参数设置环境变量 `ARIA2_RPC_SECRET`。

## 配置说明

- `ARIA2_RPC_SECRET`: Aria2 的 RPC 密钥，你需要在运行 Docker 容器时通过 `-e` 参数设置。

- 端口映射：Docker 容器的端口需要映射到主机，才能让外部访问。这里，我们将容器的 5212 端口（Cloudreve）和 6800 端口（Aria2 RPC）分别映射到了主机的 5212 和 6800 端口。

- 卷映射：Docker 容器的文件系统是隔离的，如果需要让主机访问容器中的文件，或者让容器访问主机中的文件，就需要使用卷映射。这里，我们将主机上的 `/path/to/uploads`、`/path/to/avatar` 和 `/path/to/data` 目录分别映射到了容器的 `/cloudreve/uploads`、`/cloudreve/avatar` 和 `/data` 目录。

## 注意事项

- 你需要将 `/path/to/uploads`、`/path/to/avatar` 和 `/path/to/data` 替换为你的实际路径。

- `ARIA2_RPC_SECRET` 是 Aria2 的 RPC 密钥，你需要在运行 Docker 容器时通过 `-e` 参数设置。

- 如果你在使用过程中遇到问题，可以参考 [Cloudreve 官方文档](https://docs.cloudreve.org/)，或者在 [Cloudreve GitHub 仓库](https://github.com/cloudreve/Cloudreve) 提交问题。
