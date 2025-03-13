# 网页架构（flask、django）

标签（空格分隔）： python 菜死了

---

# flask

## 涉及内容

- flask路由：用于匹配url
- request对象：用于请求参数
- abort函数等……
- 模板
- flask数据库
- 表单
- ajax……
- ……
- 小案例！

## helloworld!

```
from flask import Flask

app = Flask(__name__)

@app.route('/') # 路由 用于匹配url
def index():
    return "<h1>hello world!!</h1>"

app.run()
```

## flask路由

客户端（web浏览器）把请求发送给服务器，服务器就会将请求发送给falsk的应用实例，故flask的应用实例就要知道url需要运行哪些代码，这就要把url与python的代码形成一个映射关系，这个处理两者之间的关系的东西就叫**路由**

```python
from flask import Flask

app = Flask(__name__)

@app.route('/hello') # 从目录下匹配的是hello 
def hello():
    return "<h1>hello</h1>"

if __name__ == '__main__':
    app.run()
```

运行后，在浏览器中输入"127.0.0.1"出现404notfound，这是因为这个url是匹配到根目录下的，要输入"127.0.0.1/hello"，才会匹配到`hello()`

类似地：

```python
from flask import Flask

app = Flask(__name__)

@app.route('/hello') # 从目录下匹配的是hello 
def hellos():
    return "<h1>hello</h1>"

@app.route('/humou') # 从目录下匹配的是humou
def humou():
    return "<h1>buzenmoyangda</h1>"

if __name__ == '__main__':
    app.run()
```

@app.route()中还有一参数`method`，用于控制路由接收什么样的请求，主要有get与post。**用url直接访问的就是get请求，使用到表单的时候就会用post请求。**

```python
from flask import Flask

app = Flask(__name__)

@app.route('/hello', method=['GET', 'POST']) # get与post请求都能接收
def hello():
    return "<h1>hello</h1>"

@app.route('/humou', method=['POST']) # 只接收post请求，也就是说，无法通过url进行访问！
def humou():
    return "<h1>buzenmoyangda</h1>"

if __name__ == '__main__':
    app.run()
```

虽然在实际项目中应当避免重名的情况，但是……

### 如果重名了会怎么样呢？

路由匹配重名




