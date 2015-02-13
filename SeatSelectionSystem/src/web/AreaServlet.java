package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AreaServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String areaName = request.getParameter("areaName");
		// 判断是否存在此区域
		boolean isArea = true;//从数据库中查询
		if (isArea) {
			// 如果存在，则查出此区域的对象
			request.getSession().setAttribute("area", areaName);//从数据库中获取
			request.getSession().setAttribute("price", 200);//从数据库中获取
			response.sendRedirect("seat.jsp");
		} else {
			// 如果不存在，则弹出提示窗并返回区域选择页面
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('请先选择一个区域！');location.href='area.jsp'</script>");
			out.flush();
			out.close();
		}

	}
}
