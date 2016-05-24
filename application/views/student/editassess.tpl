

      <h3 align="center">编辑课程评价</h3></br>
           <form align="center">
              <textarea id="text" rows="15" cols="80"></textarea></br></br></br>
              <input type="button" onclick="submittext()" value="提交" />
           </form>
      <p align="center">请单击提交按钮，保存评价。</p>
<script>
    /*$(function () {
        alert(getQueryString('courseId'));
    });*/
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    function submittext() {
        var data = {
            text:document.getElementById('text').value,
            courseId:getQueryString('courseId')
        };
        $.ajax({
            url: "/studentapi/submitapi",
            type:"post",
            data:data,
            success: successCallback,
            error: errorCallback
        });
        function successCallback(json){
            if (confirm("提交成功")){
                window.opener=null;
                window.open('','_self');
                window.close();
            }
        }
        function errorCallback(){
            alert('error');
        }
    }
</script>
