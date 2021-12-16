<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>알림 목록 화면</title>
</head>
<style>
    .alarm{
        width: 1000px;
        height: auto;
        background-color: rgb(222, 222, 222);
        margin: 10px;
        padding: 5px;
    }

    #icon{
        width: 30px;
        margin-left: 30px;
        font-size: 40px;
        text-align: center;
    }

    #content{
        width: 1000px;
    }

    #title{
        margin-top: 5px;
        font-size: 1.7rem;
        font-weight: bold;
    }

    #date{
        margin-top: 12px;
        text-align: center;
        font-size: 1.3rem;
    }

    #delbtn{
        color: rgb(54, 54, 54);
        font-size: 20px;
		margin: 10px;
    }

    table p{
        margin-left: 5px;
    }

</style>
<body>
    <div>
        <h1>전체 알림</h1>
        <p style="float: left;">알림메시지는 일주일간 보관됩니다.</p><p style="margin-left: 950px;">전체 #개</p>
        <hr>
    
        <div class="alarm">
            <table id="content">
                <tr>
                    <td rowspan="2"><span id="icon" class="glyphicon glyphicon-circle-arrow-down" aria-hidden="true"></span></td>
                    <td><p id="title">신짱구 사원</p></td>
                    <td rowspan="2"><p id="date">2021-11-22<br>10:23:00</p></td>
                    <td rowspan="2"><span id="delbtn" class="glyphicon glyphicon-trash" aria-hidden="true"></span></td>
                </tr>
                <tr>
                    <td><p id="message">~~에 대한 ~~업무 기안서 에 대한 1건의 결재요청이 있습니다.</p></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>