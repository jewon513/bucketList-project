$(function() {

	$(".btn-writer").click(function() {

		let b_subject = $(this).parents("form").find(".input-subject").val()
		let b_text = $(this).parents("form").find(".input-text").val()

		if (b_subject == "") {
			alert("제목은 반드시 입력해야합니다.")
			return false;
		}
		
		if (b_subject.length > 100){
			alert("제목은 100자 이하로 작성하세요.\n현재 제목 길이 :" + b_subject.length)
			return false;
		}

		if (b_text == "") {
			alert("본문은 반드시 입력해야합니다.")
			return false;
		}
		
		if (b_text.length > 1000){
			alert("본문은 1000자 이하로 작성하세요.\n현재 본문 길이 :" + b_text.length)
			return false;
		}

		$(this).parents("form").submit()

	})

	$(".btn-delete").click(function() {

		let b_id = $(this).attr("data-id")

		if (confirm("삭제하시겠습니까?")) {
			$.ajax({

				url : "/delete",
				type : "POST",
				data : {
					b_id : b_id
				},
				success : function(result) {
					alert("삭제되었습니다.")
					location.reload()
				},
				error : function(result) {
					alert("서버통신오류")
				}

			})
		}

	})

	$(".btn-complete").click(function() {

		let b_id = $(this).attr("data-id")

		$.ajax({

			url : "/completeUpdate",
			data : {
				b_id : b_id
			},
			type : "POST",
			success : function(result) {
				alert("변경되었습니다.")
				location.reload()
			},
			error : function(error) {
				alert("서버통신오류")
			}

		})

	})

})