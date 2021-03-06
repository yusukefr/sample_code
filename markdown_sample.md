# Markdown sample

You can write notes in GitHub-flavored Markdown.

## Header

# H1
## H2
### H3
#### H4
##### H5
###### H6

```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

## Emphasis

**bold**

```markdown
**bold**
```

*italic*

```markdown
*italic*
```

**_あわせ技_**

```markdown
**_あわせ技_**
```

~~取り消し~~

```markdown
~~取り消し~~
```

## Link

### web urlへのリンク

[googleへのリンク](https://www.google.com)

```markdown
[googleへのリンク](https://www.google.com)
```

### ローカルファイルへのリンク（相対パス）

[AboutMe](/shellscript_sample.sh)

```markdown
[AboutMe](/shellscript_sample.sh)
```

## Image

![検索サイト画像](https://3.bp.blogspot.com/-mNXO3JFCD1k/XDXcUXoXq1I/AAAAAAABRJE/fz1eHX4BT54DPRWz1DpdmQYRbtJaZ9XvACLcBGAs/s400/website_kensaku_top.png "検索サイトのイラスト")

```markdown
![検索サイト画像](https://3.bp.blogspot.com/-mNXO3JFCD1k/XDXcUXoXq1I/AAAAAAABRJE/fz1eHX4BT54DPRWz1DpdmQYRbtJaZ9XvACLcBGAs/s400/website_kensaku_top.png "検索サイトのイラスト")
```

## Code and Syntax Highlighting

VSCodeの起動には、`code` コマンドが使用できます。

```markdown
VSCodeの起動には、`code` コマンドが使用できます。
```

```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

<pre>
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
</pre>

```python
s = "Python syntax highlighting"
print(s)
```

<pre>
```python
s = "Python syntax highlighting"
print(s)
```
</pre>

## Tables

コロン(:)で列内の表示位置を指定

| colA     | colB       | colC  |
| -------- |:----------:| -----:|
| Apple    | Pie        |   $12 |
| Orange   | **Cake**   |  $120 |
| Peach    | Juice      |    $1 |

```markdown
| colA     | colB       | colC  |
| -------- |:----------:| -----:|
| Apple    | Pie        |   $12 |
| Orange   | **Cake**   |  $120 |
| Peach    | Juice      |    $1 |
```

## Blockquote

> 引用文章  
> 引用文章
>
> > 引用文章  
> > 引用文章

```markdown
> 引用文章  
> 引用文章
>
> > 引用文章  
> > 引用文章
```


## Horizontal Line

---

```markdown
---
```
