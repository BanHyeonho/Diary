$(document).ready(function() {
	$("#pwSearchAction").click(function() {
		var id = $('#id').val();
		var pwq = $('#pwq').val();
		var answer = $('#answer').val();

		if (id == '') {
			alert('아이디를 입력하세요');
			$('#id').focus();
			return false;
		}  else if (answer == '') {
			alert('답을 입력하세요');
			$('#answer').focus();
			return false;
		}

		var setting = {
			type : "post",
			url : "/pwSearchAction.do",
			dataType : "json",
			data : {
				"id" : id,
				"pwq" : pwq,
				"answer" : answer
			},
			success : function(data) {
				alert(data.result);
			},
			error : function() {
				alert('error');
			}
		};
		$.ajax(setting);

	});
});