# yangzuo0621.github.io

### GIT

    npm install hexo-deployer-git --save
    npm generate
    hexo deploy
    hexo clean
    
### 全局配置 _config.yml

hexo3.0（必须这样配置，否则后果自负）
deploy:
type: git
repository: http://github.com/tanzongpei/tanzongpei.github.io.git//改成自己的用户名
branch: master
最新的写法，http不用加s，type类型为git，后面也多了个.git。
    
    
