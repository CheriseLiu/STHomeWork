<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2021/4/24
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>输出</title>
</head>
<body>
<template>
    <div style="padding:20px;">
        <div class="search">
            <div>
                <span>姓名：</span>
                <input type="text" v-model="searchName" />
                <button @click="searchNameButton">搜索</button>
            </div>
        </div>
        <button @click="addNews">新增</button>
        <table>
            <thead>
            <tr>
                <th>姓名</th>
                <th>出生日期</th>
                <th>性别</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(item,index) in allStudents" :keys="index">
                <td>
                    <span @click="deletedUser(item.id)">删除</span>&nbsp;&nbsp;&nbsp;
                    <span @click="editUser(item.id)">修改</span>
                </td>
                <td>{{item.name}}</td>
                <td>{{item.age}}</td>
                <td>{{item.province}}</td>
                <td>{{item.city}}</td>
                <td>{{item.school}}</td>
                <td>{{item.score}}</td>
            </tr>
            </tbody>
        </table>
        <div class="addnews" v-show="displayshow">
            <span @click="closed">关闭</span>
            <div>
                姓名：
                <input type="text" v-model="addStudent.name" />
            </div>
            <div>
                年龄
                <input type="text" v-model="addStudent.age" />
            </div>
            <div>
                省：
                <input type="text" v-model="addStudent.province" />
            </div>
            <div>
                市：
                <input type="text" v-model="addStudent.city" />
            </div>
            <div>
                学校：
                <input type="text" v-model="addStudent.school" />
            </div>
            <div>
                分数：
                <input type="text" v-model="addStudent.score" />
            </div>
            <button @click="sureButton">确定</button>
        </div>
    </div>
</template>
<script>
    import { truncate } from "fs";
    export default {
        data() {
            return {
                operationType: 1, //由于新增和修改用的是同一个按钮，所以设置1，2来判断当前需要执行新增还是修改。1新增 2 修改
                allStudents: [],
                schools: [],
                searchName: "",
                displayshow: false,
                nowID: "",
                addStudent: {
                    name: "",
                    age: "",
                    province: "",
                    city: "",
                    school: "",
                    score: ""
                }
            };
        },
        methods: {
            //修改用户信息
            editUser(itemId) {
                this.operationType = 2;//设置operationType为2
                this.displayshow = true;//显示弹出层
                //从所有的学生中顾虑出id为当前选中的id的学生
                var pitchOn = this.allStudents.filter(item => {
                    return item.id == itemId;
                });
                //把当前行的学生的信息赋值给弹出层中的修改文本框中
                this.addStudent.name = pitchOn[0].name;
                this.addStudent.age = pitchOn[0].age;
                this.addStudent.province = pitchOn[0].province;
                this.addStudent.city = pitchOn[0].city;
                this.addStudent.school = pitchOn[0].school;
                this.addStudent.score = pitchOn[0].score;
                //存储当前修改的用户的id
                this.nowID = itemId;
            },
            //确定按钮，提交用户信息
            sureButton() {
                //当operationType等于1的时候，执行新增操作
                if (this.operationType == 1) {
                    this.axios
                        .post("/api/public/lisa/add", this.addStudent)
                        .then(res => {
                            this.findAll();//刷新表，从数据库中再获取一次数据学生信息
                            this.displayshow = false;
                        })
                        .catch(err => {
                            this.findAll();
                        });
                }
                //当operationType等于2的时候，执行修改操作
                else {
                    this.axios
                        .post("/api/public/lisa/editUser", {
                            //把对应的信息属性字段传递给后台，告诉后台改后的信息
                            id: this.nowID,
                            ...this.addStudent
                        })
                        .then(res => {
                            if (res.status == 200) {
                                this.findAll();//刷新表
                                this.displayshow = false;
                            } else {
                                console.log("失败",res);
                            }
                        });
                }
            },
            //关闭弹出框
            closed() {
                this.displayshow = false;
            },
            //新增学生
            addNews() {
                //将operationType转换为1，就是将确定按钮执行新增操作。
                this.operationType = 1;
                //显示弹出层
                this.displayshow = true;
                //将弹出层中的数据设置为空
                this.addStudent.name ="";
                this.addStudent.age = "";
                this.addStudent.province = "";
                this.addStudent.city = "";
                this.addStudent.school = "";
                this.addStudent.score = "";
            },
            //删除学生
            deletedUser(userid) {
                this.axios
                    .post("/api/public/lisa/deletedUser", { id: userid })//输入请求后台的地址，要删除的学生的id
                    .then(res => {
                        if (res.status == 200) {
                            this.findAll();
                            console.log("删除成功！");
                        } else {
                            this.findAll();
                            console.log(res);
                        }
                    });
            },
            //按姓名搜索学生
            searchNameButton() {
                this.axios
                    .post("/api/public/lisa/findByName", { name: this.searchName })
                    .then(res => {
                        if (res.status == 200) {
                            console.log(res.data);
                            this.news = res.data;
                        } else {
                            console.log(res);
                        }
                    });
            },
            //查询所有学生信息
            findAll() {
                this.axios.post("/api/public/lisa/findAll").then(res => {
                    this.allStudents = res.data;
                });
            },
            //搜索中，学校下拉框内容
            getSchoolOptions() {
                this.axios.post("/api/public/lisa/findAll").then(res => {
                    this.schools = Array.from(
                        new Set(
                            res.data.map(item => {
                                return item.school;
                            })
                        )
                    );
                });
            }
        },
        mounted() {
            this.findAll();
            this.getSchoolOptions();
        }
    };
</script>
<style lang="scss">
    .search {
        line-height: 40px;
        text-align: left;
        clear: both;
        overflow: hidden;

    span {
        margin-left: 20px;
    }
    }
    table {
        background-color: #eee;
        border: 1px solid #ddd;
        width: 100%;
    td {
        background-color: #fff;
        line-height: 40px;
        padding: 10px;
    }
    }
    .addnews {
        position: absolute;
        z-index: 100;
        background-color: #eee;
        border: 1px solid #ddd;
        top: 0px;
        left: 0px;
        width: 300px;
        height: 300px;
    }
</style>
</body>
</html>
