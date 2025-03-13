# 排序

# 数据结构

## 搜索二叉树

查：

（使用时调用 `TREE-SEARCH(T.root, key)`）

```
TREE-SEARCH(x, k)
	if x == NIL or k == x.key
		return x
	if k < x.key
		return TREE-SEARCH(x.left, k)
	return TREE-SEARCH(x.right, k)
```

（不使用递归）

```
TREE-SEARCH(x, k)
	while x != NIL and k != x.key
		if k < x.key
			x = x.left
		else
			x = x.right
	return x
```

```
TREE-MINIMUM(x)
	while x.left != NIL
		x = x.left
	return x
```

```
TREE-MAXIMUM(x)
	while x.right != NIL
		x = x.right
	return x
```



## 红黑树

插入：

```
RB-INSERT(T, z)
	y = T.nil
	x = T.root
	while x != T.nil
		y = x
		if z.key < x.key
			x = x.left
		else
			x = x.right
	z.p = y
	if y == nil
		T.root = z
	elseif z.key < y.key
		y.left = z
	else
		y.right = z
	z.left = T.nil
	z.right = T.nil
	z.color = RED
	RB-INSERT-FIXUP(T, z)
```

```
RB-INSERT-FIXUP(T, z)
	while z.p.color == RED
		if z.p == z.p.p.left
			y = z.p.p.right
			if y.color == RED
				z.p.color = BLACK
				y.color = BLACK
				z.p.p.color = RED
				z = z.p.p
			else
				if z == z.p.right
					z = z.p
					LEFT-ROTATE(T, z)
				z.p.color = BLACK
				z.p.p.color = RED
				RIGHT-ROTATE(T, z.p.p)
		else
			(same as then clause with "right" and "left" exchanged)
	T.root.color = BLACK
```

删除：

```
RB-TRANSPLANT(T, u, v)
	if u.p == T.nil
		T.Root = v
	elseif u == u.p.left
		u.p.left = v
	else
		u.p.right = v
	v.p = u.p
```

```

```

# 设计及分析技术

# 图论