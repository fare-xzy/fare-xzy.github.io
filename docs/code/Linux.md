# Linux 代码片段

## 自己的函数

```shell
# 输出并执行命令
cs (){
    echo $1
    eval $1
}

# 举例

cs 'mkdir 1'
```

```shell
# shell 判断命令是否存在异常退出返回 1 返回码 （目前有点问题）

isExist (){
    if ! command -v $1 >/dev/null 2>&1; then
     echo 'Error: '$1' is not installed.'
     exit 1
    fi
}

# 举例
isExist git
```

```shell
# shell 判断

## 判断文件是否存在
if [ ! -e ''$1'backup.sql' ] 
    then
        echo -e "文件不存在"
        exit 1
fi

## 判断文件大小是否不为0
if [ ! -s $1'backup.sql' ]
    then
        echo -e "文件内容为空"
        exit 1
fi
```

```shell
# 根据进程查pid 并杀死
ID=`ps -ef | grep java | grep -v grep | awk '{print $2}'`
kill -9 $ID
```

```shell
# 
```



## sed

## 用法

```shell
sed [options] 'command' file(s)

# -f 将sed命令内容写在一个文件中，执行命令
sed -f scriptfile file(s)  

# -i 直接对文件原地修改
sed -i 'command' file(s) # 默认sed只是通过内存临时修改文件，源文件无影响
```

## 常用选项（options）

- -n∶使用安静(silent)模式。默认sed会输出读取文档的全部内容。但如果加上 -n 参数后，则只有经过sed特殊处理的那一行(或者动作)才会被列出来。
- -e∶多点编辑 让一条sed可以执行多条指令
- -f∶直接将 sed 的动作写在一个脚本文件内， -f filename 则可以执行 filename 内的sed动作；
- -r∶让sed支持扩展正则 若与其它选项一起使用,应放作为首选项
- -i∶直接修改读取的档案内容，而不是由屏幕输出。

## 常用命令（command）：

- a∶新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
- c∶替换， c 的后面可以接字串，这些字串可以取代n1,n2 之间的行！
- d∶删除，因为是删除，所以 d后面通常不接任何内容
-  i∶插入， i的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
- p∶打印，就是将某个选择的资料显示。通常 p 会与参数 sed-n 一起运作
- s∶替换，可以直接进行替换！通常这个 s的动作可以搭配正则表达式

## 示例

### 显示文件中的指定内容

```shell
# 显示file文件第一行
sed -n '1p' /path/to/file

# 显示file文件最后一行
sed -n '$p' /path/fo/file

# 显示file文件第1-2行
sed -n '1,2p' /pah/to/file

# 显示file文件第2到最后一行
sed -n '2,$p' abc.file
```

### 关键字模式查询

```shell
# 查询关键词包含test的所有行
sed -n '/test/p' /path/to/file

# 查询包括关键字$所在所有行，使用反斜线\屏蔽特殊含义
sed -n '/\$/p' /path/to/file
```

### 删除文件中的内容

```shell
# 删除file文件的第2行
sed '2d'/path/to/file

# 删除file文件的第2行到末尾所有行
sed '2,$d' /path/to/file

# 删除file文件的最后一行
sed '$d' /path/to/file

# 删除file文件所有包含test的行
sed '/test/'d /path/to/file
```

### 对行进行插入

```shell
# 第一行后增加字符串"XXX"
sed '1a XXX' /path/to/file
# 第一行到第3行，每行后面都增加字符串"XXX"
sed '1,3a XXX' /path/to/file
# 在所有行后插入
sed  'a  xxxx'    nssw.txt

# 第二行前插入xxxx
sed  '2i  xxxx'    nssw.txt  
# 在所有行前插入xxxx
sed  'i  xxxx'    nssw.txt   
```

### 对行进行替换

```shell
# 第一行代替为XXX
sed '1c XXX' /path/to/file

# 第一行到第2行代替为XXX
sed '1,2c XXX' /path/to/file
```

### 对行模式匹配替换

```shell
# 对一行内匹配到的字符都进行替换
sed 's/要被替换的字符串/新的字符串/g' filename  # 在整行范围内把old替换为new 

# 对一行内第一个匹配到的字符进行替换
sed 's/要被替换的字符串/新的字符串/' filename   # 如果没有g标记，则只有每行第一个匹配的old被替换成new

# 删除一行内指定列的字符
sed 's/.//2' filename   # 通过.匹配任意字符，然后将第二个匹配的字符替换为空，则删除了第二个字符

# 互换行内的字符位置
sed -r 's/^(.)(.*)(.)$/\3\2\1/' nssw.txt  # 通过-r参数，扩展正则操作

# 范围内的行操作
sed '4,7s/^/#/'   a.txt         //将第4~7行注释掉（行首加#号）
```

### 保存修改文件

```shell
# 对替换内容后的文件，进行直接修改保存 
sed -i 's/old/new/g' /path/to/file        # 使用-i参数对文件进行直接修改

# 通过重定向符>进行保存，注意sed后没有-n参数
sed 's/old/new/g' /path/to/file  > newfile_path     # 使用>对文件进行直接修改

# 通过sed的-w参数进行保存，注意sed后有-n参数
sed -n '1,3w c.txt' a.txt   # 把1到3行存储为新文件c.txt
sed -n '/^ii/w d.txt' a.txt  # 把ii开头的行保存为d.txt
```
