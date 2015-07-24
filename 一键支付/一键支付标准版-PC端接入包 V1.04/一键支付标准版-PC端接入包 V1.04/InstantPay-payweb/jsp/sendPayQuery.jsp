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

	String orderid              = formatString(request.getParameter("orderid"));

	Map<String, String> result	= InstantPayService.payQuery(orderid);
	String merchantaccount		= formatString(result.get("merchantaccount"));
	String orderidFromYeepay   	= formatString(result.get("orderid"));
	String yborderid        	= formatString(result.get("yborderid"));
	String amount           	= formatString(result.get("amount"));
	String currency         	= formatString(result.get("currency"));
	String sourcefee        	= formatString(result.get("sourcefee"));
	String targetfee        	= formatString(result.get("targetfee"));
	String sourceamount     	= formatString(result.get("sourceamount"));
	String targetamount     	= formatString(result.get("targetamount"));
	String ordertime        	= formatString(result.get("ordertime"));
	String closetime        	= formatString(result.get("closetime"));
	String type             	= formatString(result.get("type"));
	String status           	= formatString(result.get("status"));
	String refundtotal      	= formatString(result.get("refundtotal"));
	String productcatalog   	= formatString(result.get("productcatalog"));
	String productname      	= formatString(result.get("productname"));
	String productdesc      	= formatString(result.get("productdesc"));
	String bank             	= formatString(result.get("bank"));
	String bankcardtype      	= formatString(result.get("bankcardtype"));
	String bankcode            	= formatString(result.get("bankcode"));
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
<title>订单单笔查询结果</title>
</head>
	<body>
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" 
							style="word-break:break-all; border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					订单单笔查询结果
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
				<td width="25%" align="left">&nbsp;商户订单号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=orderidFromYeepay%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">orderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;易宝流水号</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=yborderid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">yborderid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;订单金额「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=amount%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">amount</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;交易币种</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=currency%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">currency</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;付款方手续费「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=sourcefee%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">sourcefee</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;收款方手续费「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=targetfee%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">targetfee</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;付款方实付金额「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=sourceamount%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">sourceamount</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;收款方实收金额「分」</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=targetamount%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">targetamount</td> 
			</tr>


			<tr>
				<td width="25%" align="left">&nbsp;下单时间</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=ordertime%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">ordertime</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;交易时间</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=closetime%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">closetime</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;支付类型</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=type%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">type</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行名称</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bank%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bank</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行编码</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bankcode%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bankcode</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;银行卡类别</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=bankcardtype%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">bankcardtype</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;订单状态</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=status%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">status</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;累计退款金额</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=refundtotal%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">refundtotal</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;商品类别码</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=productcatalog%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">productcatalog</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;商品名称</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=productname%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">productname</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;商品描述</td>
				<td width="5%"  align="center"> : </td> 
				<td width="50%" align="left"> <%=productdesc%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="15%" align="left">productdesc</td> 
			</tr>

		</table>

	</body>
</html>
