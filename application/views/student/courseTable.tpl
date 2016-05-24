<div class="container" style="background-color:rgba(255,255,255,0.5);">
  <div class="row-fluid">
    <div class="span12">
      <h3 align=center>
        学生课表
      </h3>
      <table class="table table-bordered"
             data-show-export="true"
             data-click-to-select="true"
             data-toolbar="#toolbar"
             >
        <tbody>
          <{$valueA = Controller_StudentApi::getCourseTable()}>
          <{for $i=1;$i<8;$i++}>
          <{for $j=1;$j<14;$j++}>
          <{$b[$i][$j]=0}>
          <{/for}>
          <{/for}>
          <{foreach from=$valueA item=tt}>
            <{for $x=$tt['startsection'];$x<$tt['endsection']+1;$x++}>
            <{$b[$tt['weeknum']][$x]=1}>
            <{/for}>
          <{/foreach}>

        <tr>
          <td colspan="2">
            时间
          </td>
          <td>
            星期一
          </td>
          <td>
            星期二
          </td>
          <td>
            星期三
          </td>
          <td>
            星期四
          </td>
          <td>
            星期五
          </td>
          <td>
            星期六
          </td>
          <td>
            星期日
          </td>
        </tr>
        <tr>
          <td colspan="2">
            早晨
          </td>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
        </tr>
        <tr>
          <td rowspan="5">
            上午
          </td>
          <td>
            第<br /> 1<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][1]==1}>
          <{foreach from=$valueA item=tt}>
             <{if $tt['weeknum']==$k && $tt['startsection']==1}>
             <{$a=$tt['endsection']-$tt['startsection']+1}>
             <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
             <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][1]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>


        </tr>
        <tr>
          <td>
            第<br /> 2<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][2]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==2}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][2]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>

        </tr>
        <tr>
          <td>
            第<br /> 3<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][3]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==3}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][3]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 4<br /> 节
            <{for $k=1;$k<8;$k++}>

            <{if $b[$k][4]==1}>
            <{foreach from=$valueA item=tt}>
            <{if $tt['weeknum']==$k && $tt['startsection']==4}>
            <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][4]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 5<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][5]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==5}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][5]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>


        <tr>
          <td rowspan="5">
            下午
          </td>
          <td>
            第<br /> 6<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][6]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==6}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][6]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 7<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][7]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==7}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][7]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 8<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][8]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==8}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][8]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 9<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][9]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==9}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][9]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 10<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][10]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==10}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][10]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>


        <tr>
          <td rowspan="3">
            晚上
          </td>
          <td>
            第<br /> 11<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][11]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==11}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][11]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 12<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][12]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==12}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][12]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>
        <tr>
          <td>
            第<br /> 13<br /> 节
          </td>
          <{for $k=1;$k<8;$k++}>

          <{if $b[$k][13]==1}>
          <{foreach from=$valueA item=tt}>
          <{if $tt['weeknum']==$k && $tt['startsection']==13}>
          <{$a=$tt['endsection']-$tt['startsection']+1}>
          <td rowspan="<{$a}>" align=center> <{$tt['name']}>  <br> <{$tt['classname']}> <br> <{$tt['startsection']}>~<{$tt['endsection']}><br><{$tt['teachername']}><br><{$tt['startweek']}>~<{$tt['endweek']}>周</td>
          <{/if}>
          <{/foreach}>
          <{/if}>

          <{if $b[$k][13]==0}>
          <td>  </td>
          <{/if}>

          <{/for}>
        </tr>

        </tbody>
      </table>
    </div>
  </div>
</div>
