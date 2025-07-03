
# (0) javaWeb概述

## 什么是javaweb？

Javaweb主要是使用各种java企业级技术来解决相关web互联网领域的技术总和

*简而言之，Javaweb用来写网站！*


---


# (1) 网络

## 网络编程基础

利用通信线路，将地理位置不同的、功能独特的计算机互联起来，以功能完善的网络软件来实现资源共享与信息传递就构成了**计算机网络**。

路由器连接到互联网上，而我们的设备又连接到了路由器，这样我们的设备就可以访问互联网了。

通过网络，我们可以直接访问互联网上的另一台主机。

……既然如此，如何区别不同的计算机呢？通过 **IP地址** 就可以了。每一台电脑在同一个互联网上都有一个自己的IP地址，用于区别其他的电脑，可以通过对方主机的IP地址对其进行访问。（ **如果不属于同一网络，就无法进行互联！** 比如手机连移动流量，电脑连宽带，它们就不能互联。）

而我们的电脑上可能运行着大量的程序，每一个程序可能都需要网络来访问其他计算机，那这时又该如何区分程序呢？可以通过 **端口号** 来区分。

因此，我们一般看到的是类似于`192.168.0.11:8000`这样的就是通过 IP:端口 的形式来访问目标主机上的一个应用服务程序。

**（注意：端口号只能是0-65535之间的值！）**

IP地址分为ipv4与ipv6，以上提到的例子用的都是ipv4，它一共有四组数字，每组数字占8个bit（最大的地址是255.255.255.255）。

实际上，ipv4能够表示的地址，早就已经被用完了。ipv6能保存128个bit，因此它也可以表示更多的IP地址，目前也正在向ipv6的阶段过渡。

*网络通信*
	将数据通过网络从一台设备传输到另一台设备。

java.net 包下提供了一系列的用于实现网络通信的类或接口。

### 两种不同传输层协议：TCP, UDP

**传输协议**：用以商定我们该如何传输

**TCP** : 当一台计算机想要和另一台计算机通讯时，两台计算机之间的通信需要畅通且可靠（连接时会进行三次握手，断开时也会进行四次挥手），这样才确保正确收发数据，所以它 **更适用于一些可靠的数据传输场景**

**UDP** : 一种无连接协议，数据想发就发，而且不会建立可靠传输，也就是说传输过程中可能会导致部分数据丢失，但比TCP更简单高效，适合视频直播之类的

## socket技术

通过 **socket技术** （它是计算机之间进行通信的一种方式），我们就可以实现两台计算机之间的通信。`socket` 也被翻译为“套接字”，是操作系统底层提供的一套通信技术，支持TCP与UDP。java就对socket底层进行了一套完整的封装，可以通过java来实现socket通信

要实现socket通信，必须创建一个数据发送者和数据接收者，即 **客户端与服务端**。我们需要提前启动服务端来等待客户端的通信，而客户端只需要随时启动去连接服务端即可。

```
ServerSocket构造方法：
1. 无参
2. 参数int port
```

```java
package Socket_;

import java.net.ServerSocket;
import java.net.Socket;

// 服务端(记得先开启)

public class Server {
    public static void main(String[] args) {
        try {
            ServerSocket server = new ServerSocket(8080);
            System.out.println("正在等待客户端连接……");
            Socket socket = server.accept(); // 阻涉整个线程，等待客户端的连接，获取客户端的连接
            System.out.println("客户端已连接,IP地址为" + socket.getInetAddress().getHostAddress());
            server.close(); //如果服务器不关闭的话，这个端口会一直占用着，所以用完后切记close!!
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

```

```java
package Socket_;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

//客户端,只要连接同一台路由器的电脑就可以访问客户端

public class Client {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 8080);// 因为是本地运行，Host填本地地址即可，否则填服务器IP地址
            System.out.println("连接成功！！");
            socket.close();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } 

    }
}

```

实质上这就是一个TCP连接的建立过程

一旦TCP连接建立，服务端就能和客户端之间相互发送数据，直到客户端主动关闭连接。**当然，服务端不仅仅只可以让一个客户端进行连接，我们可以尝试让服务端一直运行来不断接受客户端的连接**

```java
package Socket_;

import java.net.ServerSocket;
import java.net.Socket;

// 服务端(记得先开启)

public class Server {
    public static void main(String[] args) {
        try (ServerSocket server = new ServerSocket(8080);){
            System.out.println("正在等待客户端连接……");
            Socket socket = null;
            while (true) {
                socket = server.accept(); // 阻涉整个线程，等待客户端的连接，获取客户端的连接
                System.out.println("客户端已连接,IP地址为" + socket.getInetAddress().getHostAddress());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

```

## 使用socket进行数据传输


## 使用socket传输文件