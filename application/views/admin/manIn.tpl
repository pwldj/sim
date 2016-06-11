<div class="container-fluid" >
    <div class="row-fluid">
        <div class="span12">
            <table  id="table1"
                    class="table">
                <tr>
                    <td>
                        <span> <b> &nbsp 手动录入 &nbsp</b>  </span>
                    </td>
                    <td>
                        <input id="snum" type="text" class="form-control input-lg" placeholder="学号">
                    </td>
                    <td>
                        <input id="cnum" type="text" class="form-control input-lg" placeholder="课程号">
                    </td>
                    <td>
                        <button id="sCourse" type="button" class="btn btn-primary" onclick="sCourse()">选择课程</button>
                    </td>
                    <td>
                        <button id="dCourse" type="button" class="btn btn-primary" onclick="dCourse()">退选课程</button>
                    </td>
                </tr>
            </table>
            <table   id="table"
                     data-toggle="table"
                     data-pagination="true"
                     data-click-to-select="true"
                     data-toolbar="#toolbar"
                     data-search="true"
                     data-show-toggle="true"
                     class="table table-condensed table-bordered">
                <thead>
                 <tr>
                     <th >
                         课程代码
                     </th>
                     <th >
                         课程名称
                     </th>
                     <th>
                         余量
                     </th>
                 </tr>
                </thead>
                <tbody>
                   <{$value = Course::manSelCour()}>
                    <{foreach from=$value item=t}>
                   <tr>
                       <td>
                           <{$t['courseId']}>
                       </td>
                       <td>
                           <{$t['name']}>
                       </td>
                       <td>
                           <{$t['margin']}>
                       </td>
                   </tr>
                    <{/foreach}>
                </tbody>
            </table>
        </div>

    </div>
    <script>
        function goBack() {
            window.location.href='Admin';
        }
        function sCourse()
        {
            var data ={
                snum:document.getElementById('snum').value,
                cnum:document.getElementById('cnum').value
            };
            $.ajax({
                url: "/adminapi/manselectCourse",
                type:"post",
                data:data,
                success: successCallback,
                error: errorCallback
            });

            function successCallback(res){
                alert('yes');
            }
            function errorCallback(){
                alert('no');
            }

        }
        function dCourse()
        {
            var data ={
                snum:document.getElementById('snum').value,
                cnum:document.getElementById('cnum').value
            };
            $.ajax({
                url: "/adminapi/mandeleteCourse",
                type:"post",
                data:data,
                success: successCallback,
                error: errorCallback
            });
            function successCallback(res){
                alert('yes');
            }
            function errorCallback(){
                alert('no');
            }
        }

        //陈晨代码
    </script>
</div>