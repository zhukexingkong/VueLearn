<!--必须行，否则中文乱码-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>测试vue</title>
    <script src="../../js/vuejs-2.5.16.js"></script>
    <script src="../../js/axios-0.18.0.js"></script>
    <style type="text/css">
        .red{
            background-color: red;
        }
        .blue{
            background-color: blue;
        }
    </style>
</head>
<body>
<!--定义id=app的目的是：app定义的div标签中可以使用vue-->
<div id="app">
    <div v-text="message2"></div>
    <div v-html="message2"></div>
    <input type="text" v-model="num">
    <%--            <button v-on:click="num++">click</button>--%>
    <button @click="fun('good')">change</button>
    <h2>There are {{num}} men</h2>
    {{100+100+message}}<br>
    {{message>10?"ok":"fault"}}<br>
    {{message1}}

    <ul>
        <li v-for="(value,index) in arr" :key="index">{{value}}----{{index}}</li>
    </ul>
    <hr>
    <ul>
        <li v-for="(value,index) in list" :key="index">{{value.username}}----{{value.age}}----{{index}}</li>
    </ul>

    <span v-if="flag">chuanzhi</span>
    <span v-show="flag">itcast</span>
    <button @click="toggle">change</button>
    <br>
    <br>
    <button @click="color='red'">红色背景</button>
    <button @click="color='blue'">蓝色背景</button>
    <div :class="color">
        可改变的背景颜色
    </div>

    <br>
    <button @click="bool=!bool">改变背景颜色</button>
    <div :class="{red:bool, blue:!bool}">
        1个按钮改变的背景颜色
    </div>

    <button @click="findAll">http查找</button>
</div>
</body>
<script>
    //const axios = require('axios');
    var vue2 = new Vue({
        el: "#app", // 表示当前vue对象接管了div区域
        data: {
            message: 10, //model
            message1: "",//model
            num: 1,
            message2: "<h1>hello world</h1>",
            arr: ['aaa', 'bbb', 'ccc'], //model
            list: [],
            flag:false,
            color: "red",
            bool: true
        },
        methods: {
            fun: function (msg) {
                // this代表的是vue对象，或者使用vm
                this.message1 = msg;
            },
            toggle: function () {
                this.flag = !this.flag;
            },
            findAll: function () {
                // axios.get("data.json").then(function (res) {
                //     console.log(res);
                //     // 这里不能使用this,在axios中this表示窗口，不是vue实例
                //     vue2.list = res.data;
                // }).catch(function (err) {
                //     console.log(err);
                // });
                axios.get("http://localhost:8082/consumer/2").then(function (res) {
                    console.log(res);
                }).catch(function (err) {
                    alert(err);
                });
            }
        },
        created(){
            this.message1 = "Hello World!";
            console.log(this);// 浏览器 F12-console可查
        }
    });
</script>
</html>