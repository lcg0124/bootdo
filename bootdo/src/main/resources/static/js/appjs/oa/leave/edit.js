$().ready(function () {
    validateRule();
    hisActivityByTaskId()
});

$.validator.setDefaults({
    submitHandler: function () {
        update();
    }
});

function hisActivityByTaskId() {
    $.ajax({
        type: "get",
        url: "/activiti/task/hisActivityByTaskId?taskId=" + taskId,
        success: function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                var e = data[i];
                html += "<li>" +e.user + "于" + e.date + "执行" + e.name + "</li>";
            }
            document.getElementById("hisActivity").innerHTML = html;
        }
    })
}

function update() {
    $.ajax({
        cache: true,
        type: "POST",
        url: "/oa/leave/update?taskId=" + taskId,
        data: $('#signupForm').serialize(),// 你的formid
        async: false,
        error: function (request) {
            parent.layer.alert("Connection error");
        },
        success: function (data) {
            if (data.code == 0) {
                parent.layer.msg("操作成功");
                parent.reLoad();
                var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                parent.layer.close(index);

            } else {
                parent.layer.alert(data.msg)
            }

        }
    });

}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules: {
            name: {
                required: true
            }
        },
        messages: {
            name: {
                required: icon + "请输入名字"
            }
        }
    })
}