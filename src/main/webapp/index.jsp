<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fast in</title>
    <script src="js/vuejs-2.5.16.js"></script>
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
        <li v-for="(value,index) in arr">{{value}}----{{index}}</li>
    </ul>
    <hr>
    <ul>
        <li v-for="(value,index) in list">{{value.username}}----{{value.age}}----{{index}}</li>
    </ul>

    <span v-if="flag">chuanzhi</span>
    <span v-show="flag">itcast</span>
    <button @click="toggle">change</button>
</div>
</body>
<script>
    //view model
    var vue1 = new Vue({
        el: "#app", // 表示当前vue对象接管了div区域
        data: {
            message: 10, //model
            message1: "",//model
            num: 1,
            message2: "<h1>hello world</h1>",
            arr: ['aaa', 'bbb', 'ccc'], //model
            list: [{username: "He", age: 18}, {username: "Biao", age: 22}],
            flag:false
        },
        methods: {
            fun: function (msg) {
                // this代表的是vue对象，或者使用vm
                this.message1 = msg;
            },
            toggle: function () {
                this.flag = !this.flag;
            }
        },
        created(){
            this.message1 = "Hello World!";
            console.log(this);// 浏览器 F12-console可查
        }
    });
</script>
</html>