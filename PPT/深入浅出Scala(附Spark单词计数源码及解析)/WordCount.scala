//val conf = new SparkConf()
//conf.setAppName("Wow, My First Spark Programe")//Set a name for your application. Shown in the Spark web UI.
//conf.setMaster("local")//The master URL to connect to, such as "local" to run locally with one thread, "local[4]" to run locally with 4 cores, or "spark://master:7077" to run on a Spark standalone cluster.
//val sc = new SparkContext(conf)
//在REPL方式下执行spark代码，以上三行写了会报错，因为会自动生成
val lines = sc.textFile("/Users/monologue/Downloads/xiaoshuo/theBible.txt",1)//Read a text file from HDFS, a local file system (available on all nodes), or any Hadoop-supported file system URI, and return it as an RDD of Strings.
val words = lines.flatMap(line => line.split(" "))//Return a new RDD by first applying a function to all elements of this RDD, and then flattening the results.
//			lines.flatMap((line: String)=> line.split(" "))
val pairs = words.map(word => (word,1))//Return a new RDD by applying a function to all elements of this RDD.
//			words.map((word: String)=> (word,1)) //(word,1)是元组Tuple
val wordCounts = pairs.reduceByKey(_+_)//reduceByKey就是对元素为KV对的RDD中Key相同的元素的Value进行binary_function的reduce操作，因此，Key相同的多个元素的值被reduce为一个值，然后与原RDD中的Key组成一个新的KV对。
//				 pairs.reduceByKey((_: Int) + (_: Int))	//https://my.oschina.net/leejun2005/blog/405305
wordCounts.foreach(wordNumberPair => println(wordNumberPair._1 + " : " +wordNumberPair._2))//Applies a function f to all elements of this RDD.
//		   (wordNumberPair: Tuple) => println(wordNumberPair._1 + " : " +wordNumberPair._2) //wordNumberPair._1和wordNumberPair._2分别表示访问wordNumberPair这个元组的第一个和第二个元素
//sc.stop()//Shut down the SparkContext.
//stop方法执行后需要自行创建sc才可以执行新的spark，注释的目的是方便大家直接执行下面两段代码


/*
//REPL方式执行下面两行代码以便理解_+_这个函数的意义
val a = Array(20, 12, 6, 15, 2, 9)
a.reduceLeft(_ + _)

//REPL方式执行下面两行代码以便理解._的元组访问方式
val t = (4,3,2,1)
val sum = t._1 + t._2 + t._3 + t._4
*/


//统计A或a或B或b开头的英文单词个数
val lines = sc.textFile("/Users/monologue/Downloads/xiaoshuo/theBible.txt",1)
val words = lines.flatMap(line => line.split(" "))
val pairs = words.map(word => (word.substring(0, 1),1))
val wordCounts = pairs.reduceByKey(_+_)
var firstAB = wordCounts.filter(wordNumberPair => wordNumberPair._1.equalsIgnoreCase("A")||wordNumberPair._1.equalsIgnoreCase("B"))
firstAB.foreach(wordAB => println(wordAB._1 + " : " +wordAB._2))


//统计英文单词中出现某连续字符的单词个数
val lines = sc.textFile("/Users/monologue/Downloads/xiaoshuo/theBible.txt",1)
val words = lines.flatMap(linestr => linestr.split(" "))
//var hasDB = words.filter(wordstr => ("[Dd][Bb]".r() findFirstIn wordstr)!=None)//使用正则表达式统计包含DB或Db或dB或db的单词个数
var hasDB = words.filter(wordstr => (wordstr.contains("db")))//使用String方法contains统计包含db的单词个数
val pairs = hasDB.map(hasdbstr => ('DB,1))
val dbCounts = pairs.reduceByKey(_+_)
dbCounts.foreach(dbtuple => println(dbtuple._1.name + " : " +dbtuple._2))

//若有疑问欢迎联系本人QQ1219953432


