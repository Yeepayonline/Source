<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" import="java.util.HashMap" import="com.yeepay.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String formatString(String text){
		return text==null ? "" : text.trim();
	}
%>
<%
	String data				= formatString(request.getParameter("data"));
	String encryptkey		= formatString(request.getParameter("encryptkey"));
	
	Map<String, String>	callbackResult	= InstantPayService.decryptCallbackData(data, encryptkey);
	String merchantaccount				= formatString(callbackResult.get("merchantaccount"));
	String yborderid					= formatString(callbackResult.get("yborderid"));
	String orderid						= formatString(callbackResult.get("orderid"));
	String bankcode						= formatString(callbackResult.get("bankcode"));
	String bank							= formatString(callbackResult.get("bank"));
	String lastno						= formatString(callbackResult.get("lastno"));
	String cardtype						= formatString(callbackResult.get("cardtype"));
	String amount						= formatString(callbackResult.get("amount"));
	String status						= formatString(callbackResult.get("status"));
	String sign							= formatString(callbackResult.get("sign"));
	String customError					= formatString(callbackResult.get("customError"));

	if(!"".equals(customError)) {
		out.println("customError : " + customError);
		return;
	} else {
		out.println("success");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一键支付-通知回调</title>
</head>
	<body>
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" 
							style="word-break:break-all; border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					支付成功-通知回调
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
				<td width="25%" align="left">&nbsp;易宝流水号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=yborderid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">yborderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;商户订单号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=orderid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">orderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行编码</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bankcode%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bankcode</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行名称</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bank%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bank</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;卡号后4位</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=lastno%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">lastno</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行卡类型</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=cardtype%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">cardtype</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;订单金额「单位：分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=amount%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">amount</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;订单状态</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=status%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">status</td> 
			</tr>

		</table>

	</body>
</html>
