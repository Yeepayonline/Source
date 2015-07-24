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

	String orderid              = formatString(request.getParameter("orderid"));
	String origyborderid		= formatString(request.getParameter("origyborderid"));
	String amount               = formatString(request.getParameter("amount"));
	String currency				= formatString(request.getParameter("currency"));
	String cause				= formatString(request.getParameter("cause"));

	Map<String, String> params 	= new HashMap<String, String>();
	params.put("orderid", 		orderid);
	params.put("origyborderid",	origyborderid);
	params.put("amount", 		amount);
	params.put("currency", 		currency);
	params.put("cause", 		cause);
	
	Map<String, String> result	 		= InstantPayService.refund(params);
	String merchantaccountFromYeepay	= formatString(result.get("merchantaccount")); 
	String orderidFromYeepay			= formatString(result.get("orderid"));
	String yborderid					= formatString(result.get("yborderid"));
	String origyborderidFromYeepay		= formatString(result.get("origyborderid"));
	String amountFromYeepay				= formatString(result.get("amount"));
	String fee							= formatString(result.get("fee"));
	String currencyFromYeepay			= formatString(result.get("currency"));
	String timestamp					= formatString(result.get("timestamp"));
	String remain						= formatString(result.get("remain"));
	String signFromYeepay				= formatString(result.get("sign"));
	String error_code					= formatString(result.get("error_code"));
	String error						= formatString(result.get("error"));
	String customError					= formatString(result.get("customError"));
	
	if(!"".equals(error_code)) {
		out.println("error_code : " + error_code);
		out.println("<br>error : " + error);
		return;
	} else if(!"".equals(customError)) {
		out.println("customError : " + customError);
		return;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退款结果演示</title>
</head>
	<body>
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" 
							style="word-break:break-all; border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					单笔退款结果
				</th>
		  	</tr>

			<tr>
				<td width="25%" align="left">&nbsp;商户编号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=merchantaccountFromYeepay%> </td>
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
				<td width="25%" align="left">&nbsp;订单的退款流水号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=yborderid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">yborderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;订单的支付流水号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=origyborderidFromYeepay%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">origyborderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款金额「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=amountFromYeepay%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">amount</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;已退手续费</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=fee%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">fee</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;交易币种</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=currencyFromYeepay%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">currency</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;退款时间戳</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=timestamp%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">timestamp</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;剩余金额</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=remain%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">remain</td> 
			</tr>
		</table>

	</body>
</html>
