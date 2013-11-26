### 接口

#### GET /v1/pictures

服务器时间戳

输入：

	user_id: 用户标示(*)

输出：

正常返回：

    {
    	"status": 1,
    	"data": [
        	{
        		"title": "我的班级我的家",
        		"pictures": [
        			{
        				"src": "http://xxx/uploads/xxx.jpg",
        				"used": 2
        			},
        			{
        				"src": "http://xxx/uploads/yyy.jpg",
        				"used": 0
        			}
        		]
        	},
        	{
        		"title": "我的第一次",
        		"pictures": [
        			{
        				"src": "http://xxx/uploads/xxx.jpg",
        				"used": 0
        			},
        			{
        				"src": "http://xxx/uploads/yyy.jpg",
        				"used": 0
        			}
        		]
        	}
        ]
    }


#### POST /v2/request_verifycode

获取短信验证码

输入：

	username: 用户名（13位的手机号码，下同） *

输出：

正常返回：

    {
    	"status": 1
    }

异常返回：

	{
		"status": 0,
		"error": <errno>
	}

	444: 输入参数不正确
	104: 短信发送失败