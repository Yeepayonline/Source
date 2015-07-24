<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" import="java.util.HashMap" import="java.text.SimpleDateFormat" import="com.yeepay.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String formatString(String text){
		return text==null ? "" : text.trim();
	}
%>
<%
	request.setCharacterEncoding("UTF-8");

	String cardno              			= formatString(request.getParameter("cardno"));
	
	Map<String, String> result	 		= InstantPayService.bankCardCheck(cardno);
	String merchantaccount				= formatString(result.get("merchantaccount")); 
	String cardnoFromYeepay				= formatString(result.get("cardno"));
	String cardtype						= formatString(result.get("cardtype"));
	String bankname						= formatString(result.get("bankname"));
	String bankcode						= formatString(result.get("bankcode"));
	String isvalid						= formatString(result.get("isvalid"));
	String sign							= formatString(result.get("sign"));
	String error_code					= formatString(result.get("error_code"));
	String error_msg					= formatString(result.get("error_msg"));
	String customError					= formatString(result.get("customError"));
	
	if(!"".equals(error_code)) {
		out.println("error_code : " + error_code);
		out.println("<br>error : " + error_msg);
		return;
	} else if(!"".equals(customError)) {
		out.println("customError : " + customError);
		return;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>银行卡信息查询结果</title>
</head>
	<body>
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" 
							style="word-break:break-all; border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					银行卡信息查询结果
				</th>
		  	</tr>

			<tr>
				<td width="25%" align="left">&nbsp;商户编号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=merchantaccount%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">merchantaccount</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行卡号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=cardnoFromYeepay%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">cardno</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行卡类型</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=cardtype%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">cardtype</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行名称</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bankname%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bankname</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行编码</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bankcode%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bankcode</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;该卡是否有效</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=isvalid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">isvalid</td> 
			</tr>

		</table>

	</body>
</html>
