/**
 * Created by DanielOwen on 2016-05-15.
 */

//成绩统计变量
var A,B,C,D,F,sum,average,max,min,credit_sum,GPA;
var charts_name;
var Data,statistic_data;

//学院与专业获取
$(function() {
    college_option();
    major_option();
});
//学院查询
function college_option()
{
    var data={ sql:'select name,collegeId from college'};
    $.ajax({
        url: "/adminapi/getall",
        type:"post",
        data:data,
        success: function successCallback(json) {
            json = $.parseJSON(json);
            $("#college").append("<option value=''>请选择</option>");
            for (var i = 0; i < json.length; i++) {
                $("#college").append("<option value=" + json[i].collegeId + ">" + json[i].name + "</option>");
            }
        },
        error: function errorCallback(){
            alert("学院查询出现错误!");
        }
    });
}
//专业查询
function major_option()
{
    var SQL='select name,majorId from major';
    if(document.getElementById("college").value!="")
        SQL+=' where collegeId=\''+document.getElementById("college").value+'\'';
    var data={ sql:SQL };
    $.ajax({
        url: "/adminapi/getall",
        type:"post",
        data:data,
        success: function successCallback(json) {
            json = $.parseJSON(json);
            //清空所有选项
            $("#major").empty();//Jquery 清空选项
            $("#major").append("<option value=''>请选择</option>");
            for (var i = 0; i < json.length; i++) {
                $("#major").append("<option value=" + json[i].majorId + ">" + json[i].name + "</option>");
            major=json[i].name;
            }
        },
        error: function errorCallback(){
            alert("专业查询出现错误!");
        }
    });
}
//根据成绩查询
function score_search() {
    //每次查询变量赋初值
    A=B=C=D=F=sum=average=max=min=credit_sum=GPA=0;

    charts_name="";
    Data=[],Name=[],statistic_data=[];

    var flag=true;

    var Sql='select student.studentId as SId,student.name as Sname,' +
        'course.courseId as CId, course.name as Cname,score, ' +
        'course.credit as credit ' +
        'from student,course,courseselection_stu,major,college ' +
        'where course.courseId=courseselection_stu.courseId and ' +
        'student.studentId=courseselection_stu.studentId and' +
        ' student.majorId = major.majorId and' +
        ' major.collegeId = college.collegeId '
    if(document.getElementById("college").value!="")
        Sql+='and major.collegeId=\''+document.getElementById("college").value+'\'';
    if(document.getElementById("major").value!="")
        Sql+='and student.majorId=\''+document.getElementById("major").value+'\'';

    var sid=document.getElementById("studentId").value;
    var cid=document.getElementById("courseId").value;
    if(sid!="")
        Sql+='and student.studentId=\''+sid+'\'';
    if(cid!="")
        Sql+='and course.courseId=\''+cid+'\'';

    var data={ sql:Sql};
    $.ajax({
        url: "/adminapi/getall",
        type:"post",
        data:data,
        success: function successCallback(json) {
            var $table = $('#table');
            json = $.parseJSON(json);
            $table.bootstrapTable('load', json);
            for (var i = 0; i < json.length; i++) {
                if(json[i].score!=null)
                {
                    var score=parseInt(json[i].score);
                    var credit=parseInt(json[i].credit);
                    var GPA_;
                    Data.push(score);
                    if(i==0)
                    {
                        min=max=score;
                    }
                    sum++;
                    average+=score;
                    if( score>=90 && score<=100 ) A++;
                    else if( score>=80 && score<=89 ) B++;
                    else if( score>=70 && score<=79 ) C++;
                    else if( score>=60 && score<=69 ) D++;
                    else F++;
                    if( max < score ) max=score;
                    if( min > score ) min=score;

                    if( score>=95 && score<=100 ) GPA_=4.33;
                    else if( score>=90 && score<=94 ) GPA_=4.33;
                    else if( score>=85 && score<=89 ) GPA_=4.00;
                    else if( score>=82 && score<=84 ) GPA_=3.67;
                    else if( score>=78 && score<=81 ) GPA_=3.33;
                    else if( score>=75 && score<=77 ) GPA_=3.00;
                    else if( score>=72 && score<=74 ) GPA_=2.67;
                    else if( score>=68 && score<=71 ) GPA_=2.33;
                    else if( score>=64 && score<=67 ) GPA_=1.67;
                    else if( score>=61 && score<=63 ) GPA_=1.33;
                    else if( score==60 ) GPA_=1.00;
                    else GPA_=0;
                    credit_sum+=credit;
                    GPA+=credit*GPA_;
                }
            }
            if(sum!=0)
            {
                A/=sum;
                B/=sum;
                C/=sum;
                D/=sum;
                F/=sum;
                average/=sum;
                GPA/=credit_sum;
                statistic_data =[{
                    name:"条数",
                    arr:sum
                },{
                    name:"平均分",
                    arr:average.toFixed(2)
                },{
                    name:"最高分",
                    arr: max
                },{
                    name:"最低分",
                    arr:min
                },{
                    name:"GPA",
                    arr:GPA.toFixed(2)
                }];

                charts_name+="北京化工大学 ";
                if(document.getElementById("college").value!="")
                    charts_name+=" "+$("#college").find("option:selected").text()+"  <br>";
                if(document.getElementById("major").value!="")
                    charts_name+=" "+$("#major").find("option:selected").text()+"专业  ";
                //获得
                charts_name+="学生成绩统计图";
            }
            else flag=false;
            statistic();
            charts(flag);
            lines(flag);
        },
        error: function errorCallback(){
            alert("成绩查询出现错误!");
        }
    });
}
//统计表信息
function statistic()
{
    var $statistic_table = $('#statistic');
    $statistic_table.bootstrapTable('load', statistic_data);
}
//统计图
function charts(flag)
{
    if(!flag) document.getElementById("container").style.visibility="hidden";
    else {
        document.getElementById("container").style.visibility = "visible";
        $(function () {
            $('#container').highcharts({
                credits: {
                    href: 'https://www.baidu.com',
                    text: 'Writen By DanielOwen'
                },
                chart: {
                    plotBackgroundColor: '#FFFFFF',
                    borderColor: '#FFFFFF',
                    plotBorderWidth: null,
                    plotShadow: true,
                    type: 'pie'
                },
                title: {
                    text: charts_name,
                    style: {
                        fontWeight: 'bold',
                        fontSize: '20px'
                    }
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Brands',
                    colorByPoint: true,
                    data: [{
                        name: '90-100',
                        y: A
                    }, {
                        name: '80-89',
                        y: B,
                        sliced: true,
                        selected: true
                    }, {
                        name: '70-79',
                        y: C
                    }, {
                        name: '60-69',
                        y: D
                    }, {
                        name: '60以下',
                        y: F
                    }]
                }]
            });
        });
    }
}
//统计表
function lines(flag)
{
    $(function () {
        if(!flag) document.getElementById("container1").style.visibility="hidden";
        else {
            document.getElementById("container1").style.visibility="visible";
            $('#container1').highcharts({
                title: {
                    text: charts_name
                },
                xAxis: {
                    categories: []
                },
                yAxis: {
                    title: {
                        text: 'grade'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: 'grade'
                },
                series: [{
                    name: 'Scores',
                    data: Data
                },]
            })
        }
    });
}