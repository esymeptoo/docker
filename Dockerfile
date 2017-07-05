# #设置基础镜像,如果本地没有该镜像，会从Docker.io服务器pull镜像
# FROM node

# MAINTAINER esymeptoo "https://github.com/esymeptoo"

# #创建app目录,保存我们的代码
# RUN mkdir -p /usr/src/node
# #设置工作目录
# WORKDIR /usr/src/node

# #复制所有文件到 工作目录。
# COPY . /usr/src/node

# #编译运行node项目，使用npm安装程序的所有依赖,利用taobao的npm安装

# WORKDIR /usr/src/node/website
# RUN npm install --registry=https://registry.npm.taobao.org

# #暴露container的端口
# EXPOSE 5000

# #运行命令
# CMD ["npm", "start"]

FROM hub.c.163.com/nce2/nodejs:0.12.2
 
# Create app directory
RUN mkdir -p /home/Service
WORKDIR /home/Service
 
# Bundle app source
COPY . /home/Service
RUN npm install
 
EXPOSE 8888
CMD [ "npm", "start" ]