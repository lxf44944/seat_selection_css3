/**
 * 座位选择处理
 * 
 * @author 刘向峰
 */
// 显示详细信息悬浮窗
$(function() {
			dx = 10;
			dy = -90;
			$("a").hover(function(e) {
				otitle = this.title;
				oclassName = this.className;
				if (oclassName == "list-item") {
					status = "可购买";
				} else if (oclassName == "bought-item") {
					status = "已销售";
				} else if (oclassName == "locked-item") {
					status = "已锁定";
				} else if (oclassName == "selected-item") {
					status = "已选择";
				}

				titles = otitle.split("-");
				this.title = "";
				var ndiv = "<div id='leo'>" + "区域：" + titles[0] + "<br>价格：￥"
						+ titles[1] + "<br>排数：" + titles[2] + "<br>号数："
						+ titles[3] + "<br>状态：" + status + "</div>";
				$("body").append(ndiv);
				$("#leo").css({
							"top" : (e.pageY + dy) + "px",
							"left" : (e.pageX + dx) + "px"
						}).show(1000);
				$(this).mousemove(function(e) {
							$("#leo").css({
										"top" : (e.pageY + dy) + "px",
										"left" : (e.pageX + dx) + "px"
									}).show(1000);
						});
			}, function() {
				this.title = otitle;
				$("#leo").remove();
			});
		});
// 选座
var count = 1;
function changeSelect(obj) {
	var classname = obj.className;
	// 最多选择5张
	if (count > 5 && classname == "list-item") {
		// 显示限购提醒
		ax = -100;
		ay = -50;
		// js获取坐标方法
		offset = obj.getBoundingClientRect();
		// jquery获取坐标
		// offset = obj.offset();
		$('#top_alert').remove();
		$("<div>", {
					id : 'top_alert',
					align : 'center',
					text : '一次最多只能选择5个座位！'
				}).appendTo('body');

		$('#top_alert').css({
					"top" : (offset.top + ay) + "px",
					"left" : (offset.left + ax) + "px"
				}).fadeOut(3000);

	} else {
		// 改变已选座位的样式名
		if (classname == "selected-item") {
			count--;
			obj.className = "list-item";
			// 删除结算购物车
			$('#pbtn_' + otitle).remove();
			// 删除表单
			$('#input_' + otitle).remove();
		} else if (classname == "list-item") {
			count++;
			obj.className = "selected-item";
			// 加入结算购物车
			var cardiv = "<div id='pbtn_" + otitle + "' class='pbtn'>" + "区域："
					+ titles[0] + "<br>排数：" + titles[2] + "<br>号数：" + titles[3]
					+ "<br>价格：" + titles[1] + "</div>";
			$("#car").append(cardiv);
			// 加入表单
			 var carinput = "<input id='input_" + otitle +"' type='hidden' name='seats' value='"+titles[2]+"-"+titles[3]+"' />";
			$("#inputForm").append(carinput);

		}
		// 设置数量和总价
	
		$("#countSp").text(count - 1);
		$("#priceSp").text('￥' + (count - 1) * titles[1]);

		// 判断是否显示提交
		if (count > 1) {
			$("#sbtn").css({
						"hidden" : false
					}).fadeIn(1000);
		} else {
			$("#sbtn").css({
						"hidden" : true
					}).fadeOut(1000);
		}
	}
}

$(function() {
			$("#sbtn").click(function() {
						$("#seatsForm").submit();
					});
		});