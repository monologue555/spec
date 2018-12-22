var http 		    = require ('http');
var fs 			    = require ('fs');//读写文件
var url 		    = require ('url');
var querystring = require ('querystring');//解析URL参数
//var xml2js 		  = require('xml2js');//xml与json转化
var mysql      	= require('mysql');//连接mysql
var session     = require('express-session')//session
//var async       = require('async');//异步（阻塞）
var express 	  = require ('express');//express框架

var app 		    = express();

//侦听80端口http请求
var server = app.listen(8080, function() {
//  var host = server.address().address;
//  var port = server.address().port;
  console.log("服务器已启动！");
})


app.use(session({
    secret: 'monologue', //secret的值建议使用随机字符串
    cookie: {maxAge: 60 * 1000 * 30} // 过期时间（毫秒）
}));

//请求静态文件时自动响应
app.use('/static', express.static(__dirname + '/public'));

app.get('/session', function(req, res) {
  if (req.session.sign) {
    console.log(req.session);
    res.send(req.session.student_id);
  }else
    res.send("fail");
})

//访问首页自动返回index.html文件
app.get('/', function(req, res) {
	var fileName = __dirname + "/" + "index.html";
   res.sendFile(fileName, function(err) {
        if (err) {
            console.log(err);
            res.status(err.status).end();
        }
        else {
            console.log('sent' + fileName);
        }
        console.log('IP:' + req.ip);
    });
})

//注册，数据库插入
app.get('/signUp', function(req, res) {
	var student_id = req.query.student_id;
	var password   = req.query.password;
	var connection = mysql.createConnection({     
	  	host     : 'localhost',       
  		user     : 'root',              
  		password : '121995',       
  		port: '3306',                   
  		database: 'VOTE', 
  		charset:'UTF8_GENERAL_CI',
	}); 
	 
	connection.connect();
	 
	var  addSql = 'INSERT INTO vote.user(student_id, password) VALUES(?, ?)';
	var  addSqlParams = [student_id, password];

	connection.query(addSql, addSqlParams, function (err, result) {
	        if(err){
	         console.log('[INSERT ERROR] - ',err.message);
	         res.status(err.status).end();
	         return;
	        }     
          req.session.sign=true;
          req.session.student_id=student_id;
          req.session.password=password;     
	        console.log('INSERTresult:',result);   
	        res.send("success");     
	});
	 
	connection.end();
})

//登陆，数据库查询
app.get('/login', function(req, res) {
	console.log(req.query);
	var student_id = req.query.student_id;
	var password   = req.query.password;
	var connection = mysql.createConnection({     
  		host     : 'localhost',       
  		user     : 'root',              
  		password : '121995',       
  		port: '3306',                   
  		database: 'VOTE', 
  		charset:'UTF8_GENERAL_CI',
	}); 
 
	connection.connect();
 
	var  querySql = 'SELECT * FROM vote.user WHERE student_id=? AND password=?';
	var  querySqlParams = [student_id, password];
	console.log(querySql+querySqlParams);

	connection.query(querySql, querySqlParams, function (err, results) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        if(results.length==0){
        	console.log(results);
        	res.send("fail");
        	return;
        }
        req.session.sign=true;
        req.session.student_id=student_id;
        req.session.password=password;
        res.send("success");
    });
	connection.end();
}) 


//发起投票，数据库插入*将数据先后插入两张表，且后一张表同时插入了多个数据
app.get('/newPoll', function(req, res) {


 
	console.log(req.query);
	var student_id = req.query.student_id;
	var title   = req.query.title;
  var returnId = 0;
   if (student_id==null||title==null){
      res.send("fail");
      return;
  }
	var connection = mysql.createConnection({     
  		host     : 'localhost',       
  		user     : 'root',              
  		password : '121995',       
  		port: '3306',                   
  		database: 'VOTE', 
  		charset:'UTF8_GENERAL_CI',
	}); 
 
	connection.connect();
 
	var  addSql = 'INSERT INTO vote.maintab(student_id, title) VALUES(?, ?)';
	var  addSqlParams = [student_id, title];
	console.log(addSql+addSqlParams);

	connection.query(addSql, addSqlParams, function (err, result) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        returnId = result.insertId;
        console.log('INSERTresult:',result);


        var maintab_id = returnId;  
  
        var connection = mysql.createConnection({     
            host     : 'localhost',       
            user     : 'root',              
            password : '121995',       
            port: '3306',                   
            database: 'VOTE', 
            charset:'UTF8_GENERAL_CI',
            multipleStatements: true ,
        }); 
       
        connection.connect();

        var  addSql='';
       
        var index=-2;

        for(var option in req.query){
          index++;
          if (index<1) {
            continue;
          }
          addSql += "INSERT INTO vote.minortab(maintab_id,options) VALUES("+maintab_id+",'"+ req.query['option' + index]+"'); ";
        }
         
        //var  addSqlParams = [maintab_id, option];
        console.log(addSql);

        connection.query(addSql, function (err, result) {
              if(err){
                console.log('[SELECT111111111111111 ERROR] - ',err.message);
                res.status(err.status).end();
                return;
              }
              console.log('INSERTresult:',result);
              res.send("success");
          });

        connection.end();

  });

	connection.end();


  

})


//新加一个投票选项，数据库插入
app.get('/newOption', function(req, res) {
	console.log(req.query);
	var maintab_id = req.query.maintab_id;
	var option   = req.query.option;
	
  var connection = mysql.createConnection({     
  		host     : 'localhost',       
  		user     : 'root',              
  		password : '121995',       
  		port: '3306',                   
  		database: 'VOTE', 
  		charset:'UTF8_GENERAL_CI',
	}); 
 
	connection.connect();

	var  addSql = 'INSERT INTO vote.minortab(maintab_id,options) VALUES(?, ?)';
	var  addSqlParams = [maintab_id, option];
	console.log(addSql+addSqlParams);

	connection.query(addSql, addSqlParams, function (err, result) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        console.log('INSERTresult:',result);
        res.send("success");
    });

	connection.end();
})


//查询所有投票，数据库查询
app.get('/queryMainTab', function(req, res) {

	var connection = mysql.createConnection({     
  		host     : 'localhost',       
  		user     : 'root',              
  		password : '121995',       
  		port: '3306',                   
  		database: 'VOTE', 
  		charset:'UTF8_GENERAL_CI',
	}); 
 
	connection.connect();
 
	var  querySql = 'SELECT * FROM vote.maintab';
	console.log(querySql);

	connection.query(querySql, function (err, results) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        if(results.length==0){
        	console.log(results);
        	res.send("fail");
        	return;
        }
        //var builder = new xml2js.Builder();
  		//var xmlResults 	=  builder.buildObject(results);
  		  console.log(results);
        res.send(results);
    });
	connection.end();
})


//查询投票选项，数据库查询
app.get('/queryMinorTab', function(req, res) {
	console.log(req.query);
	var maintab_id = req.query.maintab_id;
	var connection = mysql.createConnection({     
  		host     : 'localhost',       
  		user     : 'root',              
  		password : '121995',       
  		port: '3306',                   
  		database: 'VOTE', 
  		charset:'UTF8_GENERAL_CI',
	}); 
 
	connection.connect();
 
	var  querySql = 'SELECT * FROM vote.minortab WHERE maintab_id=?';
	var  querySqlParams = [maintab_id];
	console.log(querySql+querySqlParams);

	connection.query(querySql, querySqlParams, function (err, results) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        if(results.length==0){
          console.log(results);
          res.send("fail");
          return;
        }
  		  console.log(results);
        res.send(results);
    });
	connection.end();
})


//更新投票选项票数（每次+1），数据库更新
app.get('/updateOption', function(req, res) {
  var id = req.query.id;
	var connection = mysql.createConnection({     
      host     : 'localhost',       
      user     : 'root',              
      password : '121995',       
      port: '3306',                   
      database: 'VOTE', 
      charset:'UTF8_GENERAL_CI',
  }); 
 
  connection.connect();
 
  var modSql = 'UPDATE vote.minortab SET count = count+1 WHERE id = ?';
  var modSqlParams = [id];

  connection.query(modSql, modSqlParams, function (err, results) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        console.log(results);
        res.send(results);
    });
  connection.end();
})


app.get('/deletePoll', function(req, res) {
  var id = req.query.id;
  var connection = mysql.createConnection({     
      host     : 'localhost',       
      user     : 'root',              
      password : '121995',       
      port: '3306',                   
      database: 'VOTE', 
      charset:'UTF8_GENERAL_CI',
  }); 
 
  connection.connect();
 
  var delSql = 'DELETE FROM vote.maintab WHERE id = ?';
  var delSqlParams = [id];

  connection.query(delSql, delSqlParams, function (err, results) {
        if(err){
          console.log('[SELECT ERROR] - ',err.message);
          res.status(err.status).end();
          return;
        }
        console.log(results);
        res.send("success");
    });
  connection.end();
})