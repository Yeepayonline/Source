<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" import="java.util.HashMap" import="com.yeepay.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String formatString(String text){
		return text==null ? "" : text.trim();
	}
%>
<%
	request.setCharacterEncoding("UTF-8");

	String orderid            = formatString(request.getParameter("orderid"));

	Map<String, String> result	= InstantPayService.refundQuery(orderid);
	String merchantaccount		= formatString(result.get("merchantaccount"));
	String orderidFromYeepay	= formatString(result.get("orderid"));
	String yborderid			= formatString(result.get("yborderid"));
	String origyborderid		= formatString(result.get("origyborderid"));
	String amount           	= formatString(result.get("amount"));
	String fee					= formatString(result.get("fee"));
	String currency         	= formatString(result.get("currency"));
	String ordertime        	= formatString(result.get("ordertime"));
	String closetime        	= formatString(result.get("closetime"));
	String status           	= formatString(result.get("status"));
	String cause     			= formatString(result.get("cause"));
	String sign             	= formatString(result.get("sign"));
	String error_code       	= formatString(result.get("error_code"));
	String error            	= formatString(result.get("error"));
	String customError        	= formatString(result.get("customError"));

	if(!"".equals(error_code)) {
		out.println("error_code : " + error_code + "<br><br>");
		out.println("error : " + error + "<br><br>");
		out.println("orderid : " + orderid);
		return;
	} else if(!"".equals(customError)) {
		out.println("customError : " + customError);
		return;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退款单笔查询结果</title>
</head>
	<body>
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" 
							style="word-break:break-all; border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					退款单笔查询结果
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
				<td width="25%" align="left">&nbsp;退款请求号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=orderidFromYeepay%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">orderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款流水号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=yborderid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">yborderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;支付流水号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=origyborderid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">origyborderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款金额「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=amount%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">amount</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款手续费「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=fee%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">fee</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;交易币种</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=currency%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">currency</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款请求时间</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=ordertime%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">ordertime</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款处理时间</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=closetime%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">closetime</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款状态</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=status%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">status</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款原因</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=cause%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">cause</td> 
			</tr>
		</table>

	</body>
</html>
