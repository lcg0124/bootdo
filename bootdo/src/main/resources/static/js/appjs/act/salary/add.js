$().ready(function () {
    validateRule();

});

$.validator.setDefaults({
    submitHandler: function () {
        save();
    }
});

$("#userName").click(function () {
    layer.open({
        type: 2,
        title: '选择人员',
        area: ['300px', '450px'],
        content: "/sys/user/treeView"
    })
});

function loadUser(id,name){
    console.log(id+name);
    $("#userId").val(id);
    $("#userName").val(name);
}

function save() {
    $.ajax({
        cache: true,
        type: "POST",
        url: "/act/salary/save",
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
                required: icon + ""
            }
        }
    })
}