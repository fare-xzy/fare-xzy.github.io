o Web编程
=
* 接收http post 参数 
    * r *http.Request 请求参数  
    * r.ParseForm() 解析参数
    * 通过r.form可以获取参数map 可以通过for 遍历取出
* 设置访问路由
    ```
    http.HandleFunc("/", sayhelloName)   // "/" 为路由 后面为访问该地址所调用的方法
    ```
* 设置文件跳转
    ```
    t, _ := template.ParseFiles("src/web/main.html")
    t.Execute(w,nil)
    ```
* 数据库操作（关键函数）
    * sql.Open() 打开数据库连接，Go-MySQL-Driver中注册了mysql这个数据库驱动，第二个参数是DNS(Data Source Name)，它是Go-MySQL-Driver定义的一些数据库链接和配置信息
    ```
    user@unix(/path/to/socket)/dbname?charset=utf8
    user:password@tcp(localhost:5555)/dbname?charset=utf8
    user:password@/dbname
    user:password@tcp([de:ad:be:ef::ca:fe]:80)/dbname
    ```
    * db.Prepare()函数用来返回准备要执行的sql操作，然后返回准备完毕的执行状态。
    * db.Query()函数用来直接执行Sql返回Rows结果。
    * stmt.Exec()函数用来执行stmt准备好的SQL语句
* 文件操作
    * XML操作
        * 解析格式
        
    ```
    // 结构体中每一个属性后面跟随的内容为 strcut tag 存在的目的是为了辅助反射
    package main
    
    import (
    	"encoding/xml"
    	"fmt"
    	"io/ioutil"
    	"os"
    )
    type Recurlyservers struct {
    	XMLName xml.Name `xml:"servers"`
    	Version string `xml:"version,attr"`
    	Svs []server `xml:"server"`
    	Tes []test `xml:"test"`
    	Description string `xml:",innerxml"`
    }
    type server struct {
    	XMLName xml.Name `xml:"server"`
    	Version string `xml:"version,attr"`
    	ServerName string `xml:"serverName"`
    	ServerIP string `xml:"serverIP"`
    }
    
    type test struct {
    	TestValue xml.Name `xml:"test"`
    	Version string `xml:"version,attr"`
    	TestName string `xml:"testName"`
    	TestIP string `xml:"testIp"`
    }
    func main() {
    	file, err := os.Open("src/web/EvidencePackage.xml")
    	if err != nil {
    		fmt.Printf("error: %v", err)
    		return
    	}
    	defer file.Close()
    	bytes, _ := ioutil.ReadAll(file)
    	v :=Recurlyservers{}
    	unmarshal := xml.Unmarshal(bytes, &v)
    	if unmarshal != nil {
    		fmt.Printf("error: %v", unmarshal)
    		return
    	}
    	fmt.Println(v)
    }
    ```
    * 规则
        * 如果struct的一个字段是string或者[]byte类型且它的tag含有",innerxml"，Unmarshal将会将此字段所对应的元素内所有内嵌的原始xml累加到此字段上
        * 如果struct中有一个叫做XMLName，且类型为xml.Name字段，那么在解析的时候就会保存这个element的名字到该字段,如上面例子中的servers。
        * 如果某个struct字段的tag定义中含有XML结构中element的名称，那么解析的时候就会把相应的element值赋值给该字段，如上servername和serverip定义。
        * 如果某个struct字段的tag定义了中含有",attr"，那么解析的时候就会将该结构所对应的element的与字段同名的属性的值赋值给该字段，如上version定义。
        * 如果某个struct字段的tag定义 型如"a>b>c",则解析的时候，会将xml结构a下面的b下面的c元素的值赋值给该字段。
        * 如果某个struct字段的tag定义了"-",那么不会为该字段解析匹配任何xml数据。
        * 如果struct字段后面的tag定义了",any"，如果他的子元素在不满足其他的规则的时候就会匹配到这个字段。
        * 如果某个XML元素包含一条或者多条注释，那么这些注释将被累加到第一个tag含有",comments"的字段上，这个字段的类型可能是[]byte或string,如果没有这样的字段存在，那么注释将会被抛弃。
    * xml输出
        * XMLName不会被输出
        * tag中含有"-"的字段不会输出
        * tag中含有"name,attr"，会以name作为属性名，字段值作为值输出为这个XML元素的属性，如上version字段所描述
        * tag中含有",attr"，会以这个struct的字段名作为属性名输出为XML元素的属性，类似上一条，只是这个name默认是字段名了。
        * tag中含有",chardata"，输出为xml的 character data而非element。
        * tag中含有",innerxml"，将会被原样输出，而不会进行常规的编码过程
        * tag中含有",comment"，将被当作xml注释来输出，而不会进行常规的编码过程，字段值中不能含有"--"字符串
        * tag中含有"omitempty",如果该字段的值为空值那么该字段就不会被输出到XML，空值包括：false、0、nil指针或nil接口，任何长度为0的array, slice, map或者string
        * tag中含有"a>b>c"，那么就会循环输出三个元素a包含b，b包含c，例如如下代码就会输出
            
    ```
        FirstName string `xml:"name>first"`
        LastName string `xml:"name>last"`
        <name>
        <first>Asta</first>
        <last>Xie</last>
        </name>
    ```