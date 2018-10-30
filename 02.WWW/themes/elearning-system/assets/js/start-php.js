var ELEARNING = ELEARNING || {};
var block_answer = 1;
$(document).ready(function () {
    $(window).on('ajaxErrorMessage', function (event, message) {
        // This can be any custom JavaScript you want
        console.log('Something bad happened, mate, here it is: ' + message);
        // This will stop the default alert() message
        event.preventDefault();
    });
    $("#province").on('change', function () {
        var province = $(this).val();
        $.request('account_elearning::onLoadDistrict', {
            data: {province: province},
            success: function (data) {
                var status = data.status;
                if (status == 1)
                {
                    var option_district = ""
                    var district = data.districts;
                    for (var i = 0; i < district.length; i++) {
                        option_district += "<option value='" + district[i]['id'] + "'>" + district[i]['name'] + "</option>";
                    }
                    $("#district").html(option_district);
                } else
                {
                    return;
                }
            }
        })
    });

    $(".delete-record").on('click', function () {
        var record_id = $(this).attr('data-id');
        var type = $(this).attr('data-type');
        var request = "";
        if(type == "course")
        {
            request = 'management_course::onDelete';
        }
        else if(type == "subject")
        {
            request = 'management_subject::onDelete';
        }
        else{
            request = 'management_lesson::onDelete';
        }
        swal({
            title: "Xóa dữ liệu!",
            text: "Bạn có chắc là muốn xóa dữ liệu này không?",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Xóa",
            closeOnConfirm: false
        },
        function () {
            $.request(request, {
                data: {record_id: record_id},
                success: function (data) {
                    var status = data.status;
                    if (status == 1)
                    {
                        swal({
                            title: "Xóa dữ liệu!",
                            text: "Dữ liệu đã được xóa thành công!",
                            type: "success"
                        }, function () {
                            window.location.reload();
                        });
                    } else
                    {
                        return;
                    }
                }
            })
        });
    });


    $(".join-course").on('click', function () {
        var course_id = $(this).attr('data-course');        
        $.request('account_elearning::onJoinCourse', {
            data: {course_id: course_id},
            success: function (data) {
                var status = data.status;
                if (status == 1)
                {
                    swal({
                        title: "Thông báo!",
                        text: "Tham gia khóa học thành công!",
                        type: "success"
                    }, function () {
                        window.location.reload();
                    });
                } else
                {
                    return;
                }
            }
        });
    });

    $("body").delegate('.add-answer','click', function () {
        block_answer++;
        $("#total-answer").val(block_answer);
        $.request('management_question_bank::onAddBlockAnswer', {
            data: {block_answer: block_answer},
            update: {'management_question_bank::block-answer': '@.block-answer' }
        })
    });
	
	$("body").delegate('.lesson_type','change', function () {
        var type = $(this).val();
		if(type == "1"){			
			$(".type-document").show();
			$(".type-h5p").hide();
		}
		else{
			$(".type-document").hide();
			$(".type-h5p").show();
		}
			
    });
});

ELEARNING.errorSignin = function (jqXHR)
{
    $('.error-signin').show();
}
ELEARNING.errorRegister = function (jqXHR)
{
    $('.error-register').show();
}

ELEARNING.registerSubjectSuccess = function (style) {
    if (style == "new")
    {
        swal({
            title: "Thành công!!",
            text: "Môn học của bạn đã được tạo thành công!",
            type: "success"
        }, function () {
            $("#form_khoahoc")[0].reset();
        });
    } else
    {
        swal({
            title: "Thành công!!",
            text: "Môn học của bạn đã được cập nhật thành công!",
            type: "success"
        });
    }
}
ELEARNING.registerCourseSuccess = function (style) {
    if (style == "new")
    {
        swal({
            title: "Thành công!!",
            text: "Khóa học của bạn đã được tạo thành công!",
            type: "success"
        }, function () {
            $("#form_coach_learn")[0].reset();
        });
    } else
    {
        swal({
            title: "Thành công!!",
            text: "Khóa học của bạn đã được cập nhật thành công!",
            type: "success"
        });
    }
}

ELEARNING.registerLessonSuccess = function (style) {
    if (style == "new")
    {
        swal({
            title: "Thành công!!",
            text: "Bài học của bạn đã được tạo thành công!",
            type: "success"
        }, function () {
            $("#form_coach_learn")[0].reset();
        });
    } else
    {
        swal({
            title: "Thành công!!",
            text: "Bài học của bạn đã được cập nhật thành công!",
            type: "success"
        });
    }
}

ELEARNING.registerBankSuccess = function (style) {
    if (style == "new")
    {
        swal({
            title: "Thành công!!",
            text: "Câu hỏi của bạn đã được tạo thành công!",
            type: "success"
        }, function () {
            $("#nganhang")[0].reset();
        });
    } else
    {
        swal({
            title: "Thành công!!",
            text: "Câu hỏi của bạn đã được cập nhật thành công!",
            type: "success"
        });
    }
}

ELEARNING.registerQuizzSuccess = function (style) {
    if (style == "new")
    {
        swal({
            title: "Thành công!!",
            text: "Đề thi của bạn đã được tạo thành công!",
            type: "success"
        }, function () {
            $("#quizz")[0].reset();
        });
    } else
    {
        swal({
            title: "Thành công!!",
            text: "Đề thi của bạn đã được cập nhật thành công!",
            type: "success"
        });
    }
}