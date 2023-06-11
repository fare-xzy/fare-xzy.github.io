MongoDB Study
=
* 数据库操作
    * 数据库创建：use DataBase_Name  如果数据库不存在，则创建数据库，否则切换到指定数据库。
    * 查看所有：show dbs  空数据库不显示
    * 数据库删除：db.dropDatabase() 删除当前数据库
    * 新建用户：
    ```
        db.createUser(
           {
             user: "root",
             pwd: "root",
             roles: [ { role: "readWrite", db: "attest" } ]
           }
         )
    ```
* 集合操作
    * 新增集合：db.createCollection(name, options) 
        * name: 要创建的集合名称
        * options: 可选参数, 指定有关内存大小及索引的选项(如下)
            * capped（布尔）：（可选）如果为 true，则创建固定集合。固定集合是指有着固定大小的集合，当达到最大值时，它会自动覆盖最早的文档。
                     当该值为 true 时，必须指定 size 参数。
            * autoIndexId（布尔）：（可选）如为 true，自动在 _id 字段创建索引。默认为 false。
            * size（数值）：（可选）为固定集合指定一个最大值（以字节计）。如果 capped 为 true，也需要指定该字段。
            * max（数值）：（可选）指定固定集合中包含文档的最大数量。（可选）指定固定集合中包含文档的最大数量。
    * 查看所有集合：show collections
    * 删除集合：db.collection.drop()
* 文档操作
    * 新建文档：db.COLLECTION_NAME.insert(document) // 还可以使用save函数
        * 插入一台文档信息：ObjectId("571a218011a82a1d94c02333")}
        * 插入多条文档信息 db.collection.insertMany([{"b": 3}, {'c': 4}])
    * 更新文档：
      ```
      db.collection.update(
         <query>,
         <update>,
         {
           upsert: <boolean>,
           multi: <boolean>,
           writeConcern: <document>
         }
      )
      ```
        * query : update的查询条件，类似sql update查询内where后面的。
        * update : update的对象和一些更新的操作符（如$,$inc...）等，也可以理解为sql update查询内set后面的
        * upsert : 可选，这个参数的意思是，如果不存在update的记录，是否插入objNew,true为插入，默认是false，不插入。
        * multi : 可选，mongodb 默认是false,只更新找到的第一条记录，如果这个参数为true,就把按条件查出来多条记录全部更新。
        * b.collection.updateOne() 向指定集合更新单个文档
        * db.collection.updateMany() 向指定集合更新多个文档
        * writeConcern :可选，抛出异常的级别。
            * OWriteConcern.NONE:没有异常抛出
            * WriteConcern.NORMAL:仅抛出网络错误异常，没有服务器错误异常
            * WriteConcern.SAFE:抛出网络错误异常、服务器错误异常；并等待服务器完成写操作。
            * WriteConcern.MAJORITY: 抛出网络错误异常、服务器错误异常；并等待一个主服务器完成写操作。
            * WriteConcern.FSYNC_SAFE: 抛出网络错误异常、服务器错误异常；写操作等待服务器将数据刷新到磁盘。
            * WriteConcern.JOURNAL_SAFE:抛出网络错误异常、服务器错误异常；写操作等待服务器提交到磁盘的日志文件。
            * WriteConcern.REPLICAS_SAFE:抛出网络错误异常、服务器错误异常；等待至少2台服务器完成写操作。
    * 删除文档
        ```
        db.collection.remove(
           <query>,
           {
             justOne: <boolean>,
             writeConcern: <document>
           }
        )
        ```   
        * query :（可选）删除的文档的条件。
        * justOne : （可选）如果设为 true 或 1，则只删除一个文档。
        * writeConcern :（可选）抛出异常的级别。
        * 如果要删除所有可以使用db.col.remove({})
        * db.COLLECTION_NAME.remove(DELETION_CRITERIA,1) 如果你只想删除第一条找到的记录可以设置 justOne 为 1
        * remove 已经过时可以使用以下两种
            * 删除所有：db.inventory.deleteMany({})
            * 删除多个符合条件的文档：db.inventory.deleteMany({ status : "A" })
            * 删除一个符合条件的文档：db.inventory.deleteOne( { status: "D" } )
    * 查询文档  
        * db.collection.find(query, projection)
            * query ：可选，使用查询操作符指定查询条件
            * projection ：可选，使用投影操作符指定返回的键。查询时返回文档中所有键值， 只需省略该参数即可（默认省略）
            * PS: projection使用方法
                * db.collection_name.find(query, {title: 1, by: 1}) // inclusion模式 指定返回的键，不返回其他键
                * db.collection_name.find(query, {title: 0, by: 0}) // exclusion模式 指定不返回的键,返回其他键
                * _id 默认输出 除非指定_id:0
                * 可以不指定查询条件db.collection_name.find({}, {title: 1})
* 比较运算符
    ```
            等于	    {<key>:<value>}	        db.col.find({"by":"菜鸟教程"}).pretty()	    where by = '菜鸟教程'
            小于	    {<key>:{$lt:<value>}}	db.col.find({"likes":{$lt:50}}).pretty()	where likes < 50
            小于或等于	{<key>:{$lte:<value>}}	db.col.find({"likes":{$lte:50}}).pretty()	where likes <= 50
            大于	    {<key>:{$gt:<value>}}	db.col.find({"likes":{$gt:50}}).pretty()	where likes > 50
            大于或等于	{<key>:{$gte:<value>}}	db.col.find({"likes":{$gte:50}}).pretty()	where likes >= 50
            不等于	    {<key>:{$ne:<value>}}	db.col.find({"likes":{$ne:50}}).pretty()	where likes != 50
    ```
    * 运算符英文释义
    ```
            $gt -------- greater than  >
            $gte --------- gt equal  >=
            $lt -------- less than  <
            $lte --------- lt equal  <=
            $ne ----------- not equal  !=
    ```
* 逻辑运算符
    * AND：db.col.find({key1:value1, key2:value2}).pretty()  即在两个条件之间加逗号进行分割就可以实现and的效果
    * OR：MongoDB中的Or条件使用了关键字  $or
        ```
        db.col.find(
           {
              $or: [
                {key1: value1}, {key2:value2}
              ]
           }
        ).pretty()
        ```
* $type 操作符
    
                |数据类型  | 替代数字 | 状态|
                |:--------:|:--------:|:---:|
                |Double    | 1        |
                |String    | 2 |
                |Object    | 3 |
                |Array     | 4 |
                |Binary data  | 5 |
                |Undefined  | 6 |已废弃|
                |Object id  | 7 |
                |Boolean  | 8 |
                |Date  | 9 |
                |Null  | 10 |
                |Regular Expression  | 11 |
                |Symbol  | 14 |
                |JavaScript (with scope)  | 15 |
                |32-bit integer  | 16 |
                |Timestamp  | 17 |
                |64-bit integer  | 18 |
                |Min key  | 255 |Query with -1|
                |Max key  | 127 |
    
    * 使用方法(做的是类型匹配查询)
        * db.col.find({"title" : {$type : 2}})
        * db.col.find({"title" : {$type : 'string'}})
* Limit And Skip方法
    * Limit 
        * db.COLLECTION_NAME.find().limit(NUMBER) 查询该文档中的Number 条记录
    * Skip
        * db.COLLECTION_NAME.find().limit(NUMBER1).skip(NUMBER2) 查询跳过Nnumber2条数据后的前Number1数据
        * PS：调换limit 与 skip的顺序不影响结果，skip在前会更好理解不会被误认为 先取钱Number1 条数据在跳过Number2条数据获得Limit结果中从Number2-Number1的数据
    * PS ：当查询时同时使用sort,skip,limit，无论位置先后，最先执行顺序 sort再skip再limit。
    * PS2：轻易不要使用skip 因为skip是一条一条数据数过去的
* MongoDB 排序
    * db.COLLECTION_NAME.find().sort({KEY:1})  根据Key 排序 1位为升序 -1为降序
* MongoDB 索引
    * db.collection.createIndex(keys, options) 
        * 语法中 Key 值为你要创建的索引字段，1 为指定按升序创建索引，如果你想按降序来创建索引指定为 -1 即可。
        * 例如：db.col.createIndex({"title":1})
        * 多索引：db.col.createIndex({"title":1,"description":-1})
        * options
        
            |索引属性  | 数据类型 | 描述|
            |:--------:|:--------:|:---|
            |background|Boolean	|建索引过程会阻塞其它数据库操作，background可指定以后台方式创建索引，即增加 "background" 可选参数。 "background" 默认值为false。|
            |unique|Boolean	|建立的索引是否唯一。指定为true创建唯一索引。默认值为false.|
            |name	|string	|索引的名称。如果未指定，MongoDB的通过连接索引的字段名和排序顺序生成一个索引名称。|
            |dropDups	|Boolean	|在建立唯一索引时是否删除重复记录,指定 true 创建唯一索引。默认值为 false.|
            |sparse	|Boolean	|对文档中不存在的字段数据不启用索引；这个参数需要特别注意，如果设置为true的话，在索引字段中不会查询出不包含对应字段的文档.。默认值为 false.|
            |expireAfterSeconds|integer	|指定一个以秒为单位的数值，完成 TTL设定，设定集合的生存时间。|
            |v	|index version	|索引的版本号。默认的索引版本取决于mongod创建索引时运行的版本。|
            |weights	|document	|索引权重值，数值在 1 到 99,999 之间，表示该索引相对于其他索引字段的得分权重。|
            |default_language	|string	|对于文本索引，该参数决定了停用词及词干和词器的规则的列表。 默认为英语|
            |language_override	|string	|对于文本索引，该参数指定了包含在文档中的字段名，语言覆盖默认的language，默认值为 language.|
            
* MongoDB 聚合
    * MongoDB中聚合(aggregate)主要用于处理数据(诸如统计平均值,求和等)，并返回计算后的数据结果。有点类似sql语句中的 count(*)
    * db.COLLECTION_NAME.aggregate(AGGREGATE_OPERATION)
    * 例如：；db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : 1}}}])
        *  $group 是分组标志  _id 是分组依据  num_tutorial 是分组条件
        
            |聚合条件  | 聚合说明 | 举例|
            |:--------:|:--------:|:----|
            |$sum	|计算总和。	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : "$likes"}}}])|
            |$avg	|计算平均值	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$avg : "$likes"}}}])|
            |$min	|获取集合中所有文档对应值得最小值。	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$min : "$likes"}}}])|
            |$max	|获取集合中所有文档对应值得最大值。	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$max : "$likes"}}}])|
            |$push	|在结果文档中插入值到一个数组中。	|db.mycol.aggregate([{$group : {_id : "$by_user", url : {$push: "$url"}}}])|
            |$addToSet	|在结果文档中插入值到一个数组中，但不创建副本。	|db.mycol.aggregate([{$group : {_id : "$by_user", url : {$addToSet : "$url"}}}])|
            |$first	|根据资源文档的排序获取第一个文档数据。	|db.mycol.aggregate([{$group : {_id : "$by_user", first_url : {$first : "$url"}}}])|
            |$last	|根据资源文档的排序获取最后一个文档数据	|db.mycol.aggregate([{$group : {_id : "$by_user", last_url : {$last : "$url"}}}])|
            |$sum	|计算总和。	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : "$likes"}}}])|
            |$avg	|计算平均值	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$avg : "$likes"}}}])|
            |$min	|获取集合中所有文档对应值得最小值。	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$min : "$likes"}}}])|
            |$max	|获取集合中所有文档对应值得最大值。	|db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$max : "$likes"}}}])|
            |$push	|在结果文档中插入值到一个数组中。	|db.mycol.aggregate([{$group : {_id : "$by_user", url : {$push: "$url"}}}])|
            |$addToSet	|在结果文档中插入值到一个数组中，但不创建副本。	|db.mycol.aggregate([{$group : {_id : "$by_user", url : {$addToSet : "$url"}}}])|
            |$first	|根据资源文档的排序获取第一个文档数据。	|db.mycol.aggregate([{$group : {_id : "$by_user", first_url : {$first : "$url"}}}])|
            |$last	|根据资源文档的排序获取最后一个文档数据	|db.mycol.aggregate([{$group : {_id : "$by_user", last_url : {$last : "$url"}}}])|
    
    * 管道符：将当前命令的输出结果作为下一个命令的参数
        * $project：修改输入文档的结构。可以用来重命名、增加或删除域，也可以用于创建计算结果以及嵌套文档。
        ```
            db.article.aggregate(
                { $project : {
                    title : 1 ,  // 1 title元素不去除，0 或者不写则代表去除该元素。PS：只是结果中会去掉
                    author : 1 ,
                }}
        ```
        * $match：用于过滤数据，只输出符合条件的文档。$match使用MongoDB的标准查询操作。
        ```
                db.articles.aggregate( [
                    { $match : { score : { $gt : 70, $lte : 90 } } },
                    { $group: { _id: null, count: { $sum: 1 } } }
                ] );
        ```
        * $limit：用来限制MongoDB聚合管道返回的文档数。
        ```
                db.article.aggregate(
                     { $skip : 5 }
                );
       ```
        * $skip：在聚合管道中跳过指定数量的文档，并返回余下的文档。
        ```
                db.article.aggregate(
                    { $skip : 5 }
                );
       ```
        * $unwind：将文档中的某一个数组类型字段拆分成多条，每条包含数组中的一个值。
        ```
            db.article.aggregate(
                {$unwind:"$tags"}
            )
        ```
        * $group：将集合中的文档分组，可用于统计结果。
        * $sort：将输入文档排序后输出。
            ```
                db.article.aggregate(
                    {$sort:{
                        _id : 1   // 1是正序，-1 是倒叙
                    }}
                )
            ```
        * $geoNear：输出接近某一地理位置的有序文档
* mongodb 的复制（副本集）
    * ![image](../../../../pic/replication.png)
    * mongodb的复制至少需要两个节点。其中一个是主节点，负责处理客户端请求，其余的都是从节点，负责复制主节点上的数据。
    * mongodb各个节点常见的搭配方式为：一主一从、一主多从。
    * 主节点记录在其上的所有操作oplog，从节点定期轮询主节点获取这些操作，然后对自己的数据副本执行这些操作，从而保证从节点的数据与主节点一致。
    * 副本集特征：
        * N 个节点的集群
        * 任何节点可作为主节点
        * 所有写入操作都在主节点上
        * 自动故障转移
        * 自动恢复
    * 创建副本集：                                                                                                                                                                                         
        * 启动实例：mongod --port 27017 --dbpath "D:\set up\mongodb\data" --replSet rs0     // rs0是实例名
        * 新建副本集：rs.initiate()
        * 查看副本集配置： rs.conf()
        * 查看副本集状态： rs.status()
        * 将数据库实例添加到副本集：rs.add(HOST_NAME:PORT)
    * Primary 选举
        * 复制集通过replSetInitiate命令（或mongo shell的rs.initiate()）进行初始化，初始化后各个成员间开始发送心跳消息，并发起Priamry选举操作，获得『大多数』成员投票支持的节点，会成为Primary，其余节点成为Secondary。
        * 『大多数』的定义
            * 假设复制集内投票成员（后续介绍）数量为N，则大多数为 N/2 + 1，当复制集内存活成员数量不足大多数时，整个复制集将无法选举出Primary，复制集将无法提供写服务，处于只读状态。假设复制集内投票成员（后续介绍）数量为N，则大多数为 N/2 + 1，当复制集内存活成员数量不足大多数时，整个复制集将无法选举出Primary，复制集将无法提供写服务，处于只读状态。
            * 通常建议将复制集成员数量设置为奇数，从上表可以看出3个节点和4个节点的复制集都只能容忍1个节点失效，从『服务可用性』的角度看，其效果是一样的。（但无疑4个节点能提供更可靠的数据存储）
* MongoDB 分片：
    *  ![image](../../../../pic/sharding.jpg)
        * Shard:
          用于存储实际的数据块，实际生产环境中一个shard server角色可由几台机器组个一个replica set承担，防止主机单点故障
        * Config Server:
          mongod实例，存储了整个 ClusterMetadata，其中包括 chunk信息。
        * Query Routers:
          前端路由，客户端由此接入，且让整个集群看上去像单一数据库，前端应用可以透明使用。
    *  分片的目的
        * 高数据量和吞吐量的数据库应用会对单机的性能造成较大压力,大的查询量会将单机的CPU耗尽,大的数据量对单机的存储压力较大,最终会耗尽系统的内存而将压力转移到磁盘IO上。
        * 为了解决这些问题,有两个基本的方法: 垂直扩展和水平扩展。
        * 垂直扩展：增加更多的CPU和存储资源来扩展容量。
        * 水平扩展：将数据集分布在多个服务器上。水平扩展即分片。
* MongoDB 数据备份
    * 在Mongodb中我们使用mongodump命令来备份MongoDB数据。该命令可以导出所有数据到指定目录中。
    * mongodump命令可以通过参数指定导出的数据量级转存的服务器。
    * 数据备份
        * mongodump -h dbhost -d dbname -o dbdirectory
            * -h：MongDB所在服务器地址，例如：127.0.0.1，当然也可以指定端口号：127.0.0.1:27017
            * -d：需要备份的数据库实例，例如：test
            * -o：备份的数据存放位置，例如：c:\data\dump，当然该目录需要提前建立，在备份完成后，系统自动在dump目录下建立一个test目录，这个目录里面存放该数据库实例的备份数据。        
            * 如果直接使用mongodump则会默认备份到temp下
    * 数据恢复
        * mongorestore -h <hostname><:port> -d dbname <path>
            * --host <:port>, -h <:port>： MongoDB所在服务器地址，默认为： localhost:27017
            * --db , -d ：需要恢复的数据库实例，例如：test，当然这个名称也可以和备份时候的不一样，比如test2
            * --drop：恢复的时候，先删除当前数据，然后恢复备份的数据。就是说，恢复后，备份后添加修改的数据都会被删除，慎用哦！
            * <path>：mongorestore 最后的一个参数，设置备份数据所在位置，例如：c:\data\dump\test。你不能同时指定 <path> 和 --dir 选项，--dir也可以设置备份目录。
            * --dir：指定备份的目录，你不能同时指定 <path> 和 --dir 选项。
            * 如果直接使用mongorestore则会默认从默认备份位置temp备份
* MongoDB 监控
    * mongostat
        * mongostat是mongodb自带的状态检测工具，在命令行下使用。它会间隔固定时间获取mongodb的当前运行状态，并输出。如果你发现数据库突然变慢或者有其他问题的话，你第一手的操作就考虑采用mongostat来查看mongo的状态。
    * mongotop  10
        * mongotop也是mongodb下的一个内置工具，mongotop提供了一个方法，用来跟踪一个MongoDB的实例，查看哪些大量的时间花费在读取和写入数据。 mongotop提供每个集合的水平的统计数据。默认情况下，mongotop返回值的每一秒。
        * 10 为等待参数可以为空
        * 参数 --locks
            * ns：包含数据库命名空间，后者结合了数据库名称和集合。
            * db：包含数据库的名称。名为 . 的数据库针对全局锁定，而非特定数据库。
            * total：mongod花费的时间工作在这个命名空间提供总额。
            * read： 提供了大量的时间，这mongod花费在执行读操作，在此命名空间。
            * write：提供这个命名空间进行写操作，这mongod花了大量的时间。
    * MongoDB 关系
        * MongoDB 的关系表示多个文档之间在逻辑上的相互联系。
        * 文档间可以通过嵌入和引用来建立联系。
        * MongoDB 中的关系可以是：
            * 1:1 (1对1)
            * 1: N (1对多)
            * N: 1 (多对1)
            * N: N (多对多)
* MongoDB 数据库引用
    ```
        db.deps.insert({
            name: "CSL", 
            num: 15, 
            people: [ 
                DBRef("people", ObjectId("59b51b36a36f6ee8c75b0f68"), "test"), 
                DBRef("people", ObjectId("59b51b44a36f6ee8c75b0f69"), "test")
                ]
            })
    ```
* MongoDB 覆盖索引查询
    * 覆盖索引生效条件：
        * 所有的查询字段是索引的一部分
        * 所有的查询返回字段在同一个索引中
    * 如果是以下的查询，不能使用覆盖索引查询：
        * 所有索引字段是一个数组
        * 所有索引字段是一个子文档
* MongoDB 查询分析
    * MongoDB 查询分析常用函数有：explain() 和 hint()。
    * 使用 explain()
        * explain 操作提供了查询信息，使用索引及查询统计等。有利于我们对索引的优化。
        * db.users.find({gender:"M"},{user_name:1,_id:0}).explain()
            * indexOnly: 字段为 true ，表示我们使用了索引。
            * cursor：因为这个查询使用了索引，MongoDB 中索引存储在B树结构中，所以这是也使用了 BtreeCursor 类型的游标。如果没有使用索引，游标的类型是 BasicCursor。这个键还会给出你所使用的索引的名称，你通过这个名称可以查看当前数据库下的system.indexes集合（系统自动创建，由于存储索引信息，这个稍微会提到）来得到索引的详细信息。
            * n：当前查询返回的文档数量。
            * nscanned/nscannedObjects：表明当前这次查询一共扫描了集合中多少个文档，我们的目的是，让这个数值和返回文档的数量越接近越好。
            * millis：当前查询所需时间，毫秒数。
            * indexBounds：当前查询具体使用的索引。
    * 使用 hint()
        * 虽然MongoDB查询优化器一般工作的很不错，但是也可以使用 hint 来强制 MongoDB 使用一个指定的索引。
        * 这种方法某些情形下会提升性能。 一个有索引的 collection 并且执行一个多字段的查询(一些字段已经索引了)
        * db.users.find({gender:"M"},{user_name:1,_id:0}).hint({gender:1,user_name:1})
* MongoDB 原子操作
    * mongodb不支持事务，所以，在你的项目中应用时，要注意这点。无论什么设计，都不要要求mongodb保证数据的完整性。
    * 但是mongodb提供了许多原子操作，比如文档的保存，修改，删除等，都是原子操作。
    * 所谓原子操作就是要么这个文档保存到Mongodb，要么没有保存到Mongodb，不会出现查询到的文档没有保存完整的情况。
    * 原子操作常用命令
        * $set：用来指定一个键并更新键值，若键不存在并创建  { $set : { field : value } }
        * $unset：用来删除一个键。  { $unset : { field : 1} }
        * $inc 可以对文档的某个值为数字型（只能为满足要求的数字）的键进行增减的操作。 { $inc : { field : value } }
        * $push 把value追加到field里面去，field一定要是数组类型才行，如果field不存在，会新增一个数组类型加进去。
        * $pushAll 同$push,只是一次可以追加多个值到一个数组字段内。 { $pushAll : { field : value_array } }
        * $pull 从数组field内删除一个等于value值。  { $pull : { field : _value } }
        * $addToSe 增加一个值到数组内，而且只有当这个值不在数组内才增加
        * $pop { $pop : { field : 1 } }
        * $rename 修改字段名称{ $rename : { old_field_name : new_field_name } }
        * $bit 位操作，integer类型 {$bit : { field : {and : 5}}}
        * PS：类似于顺序操作，前面一个条件执行成功才可以进行下一步的操作。
            * 例如：
            ```
            db.books.findAndModify ( {
               query: {
                        _id: 123456789,
                        available: { $gt: 0 }
                      },
               update: {
                         $inc: { available: -1 },
                         $push: { checkout: { by: "abc", date: new Date() } }
                       }
            } )
            ```
            * 当查询数量大于0 的时候才可以进行更新操作
* MongoDB 高级索引

            ```
            {
               "address": {
                  "city": "Los Angeles",
                  "state": "California",
                  "pincode": "123"
               },
               "tags": [
                  "music",
                  "cricket",
                  "blogs"
               ],
               "name": "Tom Benzamin"
            }
            ```
            
    * 索引数组字段 
        * 在数组中创建索引，需要对数组中的每个字段依次建立索引。所以在我们为数组 tags 创建索引时，会为 music、cricket、blogs三个值建立单独的索引。
            * db.users.ensureIndex({"tags":1}) 创建数组索引
    * 索引子文档字段
        * 假设我们需要通过city、state、pincode字段来检索文档，由于这些字段是子文档的字段，所以我们需要对子文档建立索引。
            * db.users.ensureIndex({"address.city":1,"address.state":1,"address.pincode":1})
            * 一旦创建索引，我们可以使用子文档的字段来检索数据：
            * db.users.find({"address.city":"Los Angeles"})
* MongoDB 索引限制
    * 每个索引占据一定的存储空间，在进行插入，更新和删除操作时也需要对索引进行操作。所以，如果你很少对集合进行读取操作，建议不使用索引。
    * 由于索引是存储在内存(RAM)中,你应该确保该索引的大小不超过内存的限制。如果索引的大小大于内存的限制，MongoDB会删除一些索引，这将导致性能下降。
    * 索引不能被以下的查询使用：
        * 正则表达式及非操作符，如 $nin, $not, 等。
        * 算术运算符，如 $mod, 等。
        * $where 子句
        * 所以，检测你的语句是否使用索引是一个好的习惯，可以用explain来查看。
    * 从2.6版本开始，如果现有的索引字段的值超过索引键的限制，MongoDB中不会创建索引。
    * 如果文档的索引字段值超过了索引键的限制，MongoDB不会将任何文档转换成索引的集合。与mongorestore和mongoimport工具类似。
    * 索引最大范围
        * 集合中索引不能超过64个
        * 索引名的长度不能超过128个字符
        * 一个复合索引最多可以有31个字段
* MongoDB ObjectId
    * ObjectId 是一个12字节 BSON 类型数据，有以下格式：
        * 前4个字节表示时间戳
        * 接下来的3个字节是机器标识码
        * 紧接的两个字节由进程id组成（PID）
        * 最后三个字节是随机数。(但是本地显示的规律为16进制的递增三位数)
        * 可以通过使用ObjectId = ObjectId()的方式进行手动生成，同样可以手动赋予Id：myObjectId = ObjectId("5349b4ddd2781d08c09890f4")
        * ObjectId("id").getTimestamp();可以转化该ObjectId中的时间戳。
        * new ObjectId("id").str  可以吧id转换为字符串格式的
* MongoDB Map Reduce
    * Map-Reduce是一种计算模型，简单的说就是将大批量的工作（数据）分解（MAP）执行，然后再将结果合并成最终结果（REDUCE）。
    * MongoDB提供的Map-Reduce非常灵活，对于大规模数据分析也相当实用。
    
    ```
        db.collection.mapReduce(
           function() {emit(key,value);},  //map 函数
           function(key,values) {return reduceFunction},   //reduce 函数
           {
              out: collection,
              query: document,
              sort: document,
              limit: number
           }
        )
    ```  
    * 使用 MapReduce 要实现两个函数 Map 函数和 Reduce 函数,Map 函数调用 emit(key, value), 遍历 collection 中所有的记录, 将 key 与 value 传递给 Reduce 函数进行处理。
    * Map 函数必须调用 emit(key, value) 返回键值对。  
    * map ：映射函数 (生成键值对序列,作为 reduce 函数参数)。
    * 参数说明
        * reduce 统计函数，reduce函数的任务就是将key-values变成key-value，也就是把values数组变成一个单一的值value。。
        * out 统计结果存放集合 (不指定则使用临时集合,在客户端断开后自动删除)。
        * query 一个筛选条件，只有满足条件的文档才会调用map函数。（query。limit，sort可以随意组合）
        * sort 和limit结合的sort排序参数（也是在发往map函数前给文档排序），可以优化分组机制
        * limit 发往map函数的文档数量的上限（要是没有limit，单独使用sort的用处不大）        
        