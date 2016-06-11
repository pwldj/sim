<div id="toolbar" class="btn-group">
    <button type="button" class="btn btn-default" onclick="addstudent()" data-toggle="modal" data-target="#modalTable" data-backdrop="static">
        <i class="glyphicon glyphicon-plus"></i>
    </button>

    <button type="button" class="btn btn-default" onclick="deletestudent()" >
        <i class="glyphicon glyphicon-trash"></i>
    </button>
</div>

<div class="container">
    <table id="table"
           class="col-lg-1"
           data-toggle="table"
           data-show-export="true"
           data-pagination="true"
           data-click-to-select="true"
           data-sort-name="studentId"
           data-sort-order="asc"
           data-search="true"
           data-show-toggle="true"
           data-unique-id="studentId"
           data-maintain-selected="true"
           data-toolbar="#toolbar">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="messageId" data-sortable="true">编号</th>
            <th data-field="text" data-sortable="true">通知信息</th>
            <th data-field="audiences" data-sortable="true">接受范围</th>
            <th data-field="useful" data-sortable="true">是否可用</th>
            <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
        </tr>
        </thead>
    </table>
</div>

<div class="container">
    <!-- Button trigger modal -->
    <div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" style="font-family:'microsoft yahei',Arial,sans-serif;font-style: italic">编辑</h3>
                </div>
                <div class="modal-body">
                    <form id="edit_form" class="form-horizontal">
                        <div class="form-group" id="sd">
                            <label class="col-sm-2 control-label" for="in_messageId">编号</label>
                            <div class="col-sm-9">
                                <input id="in_messageId" type="text" placeholder="" class="form-control" >
                            </div>
                        </div>

                        <div class="form-group">
                            <!-- Select Basic -->
                            <label for="in_audiences" class="col-sm-2 control-label">范围</label>
                            <div class="col-sm-9">
                                <select id="in_audiences" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- Select Basic -->
                            <label for="in_useful" class="col-sm-2 control-label">是否可用</label>
                            <div class="col-sm-9">
                                <select id="in_useful" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- Select Basic -->
                            <label for="in_text" class="col-sm-2 control-label">是否可用</label>
                            <div class="col-sm-9">
                                <textarea id="in_text" class="form-control"></textarea>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" id="edit_btn" class="btn btn-info"  onclick="submit()">提交</button>
                        <button type="button" id="add_btn" class="btn btn-info" onclick="add_submit()">添加</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
</div>