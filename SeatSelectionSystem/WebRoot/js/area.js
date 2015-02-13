/**
 * 区域选择处理
 * 
 * @author 刘向峰
 */
$(function() {
	$("div.area").each(function() {
		$(this).click(function() {
			$("#areaName").val($(this).text());
			$("#areaForm").submit();
		});
	});
});