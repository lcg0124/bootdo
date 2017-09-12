$().ready(function() {

	$('.summernote').summernote({
		height : '220px',
		lang : 'zh-CN'
	});
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save(1);
	}
});
function save(status) {
	$("#status").val(status);
	var content_sn = $("#content_sn").code();
	$("#content").val(content_sn);
	$.ajax({
		cache : true,
		type : "POST",
		url : "/blog/bContent/save",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(r) {
			if (r.code == 0) {
				parent.layer.msg(r.msg);
				parent.reLoad();
				$("#cid").val(r.cid);
				 var index = parent.layer.getFrameIndex(window.name); //
				 获取窗口索引
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
		rules : {
			title : "required",
			author : "required",
			content :"required"
		},
		messages : {
			title : "请填写文章标题",
			author : "请填写文章作者",
			content :"请填写文章内容"
		}
	});
}

function returnList(){
	 var index = parent.layer.getFrameIndex(window.name);
	 alert(index);
	 获取窗口索引
	 parent.layer.close(index);
//	parent.layer.close(layer.index);
}