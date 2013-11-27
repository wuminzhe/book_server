
## 照片书flash接口

> 输入参数带星标(*)的必填参数，其他为可选参数

### 1. 前端接口

进入编辑主页面时，传入user_id，以下接口都是在编辑界面里面调用的，用于获取数据和保存数据

#### GET /front/pictures

获取图片

输入：

    user_id: 用户标示 *

输出：

正常返回：

    {
        "status": 1,
        "data": {
            "stickers": [
                {
                    "id": 1,
                    "src": "http://xxx/uploads/xxx.jpg"
                },
                {
                    "id": 2,
                    "src": "http://xxx/uploads/xxx.jpg"
                }
            ],
            "pictures": [
                {
                    "title": "我的班级我的家",
                    "items": [
                        {
                            "id": 1,
                            "src": "http://xxx/uploads/xxx.jpg"
                        },
                        {
                            "id": 2,
                            "src": "http://xxx/uploads/yyy.jpg"
                        }
                    ]
                },
                {
                    "title": "我的第一次",
                    "items": [
                        {
                            "id": 3,
                            "src": "http://xxx/uploads/xxx.jpg"
                        },
                        {
                            "id": 4,
                            "src": "http://xxx/uploads/yyy.jpg"
                        }
                    ]
                }
            ]
    	}
    }
    
异常返回：

    {
        "status": 0,
        "error": <errno>
    }
    
    errno:
        404: 用户不存在

#### GET /front/template

获取照片书模板

输入：

    user_id: 用户标示 *

输出：

正常返回：

    {
        "status": 1,
        "data": {
            "content": "xml or json"
        }
    }

异常返回：

    {
        "status": 0,
        "error": <errno>
    }
    
    errno:
        404: 用户不存在
        
#### POST /front/template

保存照片书模板

输入：

    user_id: 用户标示 *
    content: 模板内容 *

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
    
    errno:
        404: 用户不存在
        405: 模板内容不合法


***
       

### 2. 后端接口

后端接口用于模板编辑器，进入编辑器时，如果传入了模板id，就是修改模板，需要加载已有模板文件，如果未传入模板id，就是新建模板

#### GET /back/template

获取模板

输入：

    admin_id: 管理员标示 *
    template_id: 模板表示 *

输出：

正常返回：

    {
        "status": 1,
        "data": {
            "content": "xml or json"
        }    
    }
    
异常返回：

    {
        "status": 0,
        "error": <errno>
    }
    
    errno:
        404: 管理员不存在或者模板不存在
        
#### POST /back/template

保存模板

输入：

    admin_id: 管理员标示 *
    content: 模板内容 *
    template_id: 模板id，如果没有表示新建，如果有表示修改

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
    
    errno:
        404: 管理员不存在
        405: 模板内容不合法      
