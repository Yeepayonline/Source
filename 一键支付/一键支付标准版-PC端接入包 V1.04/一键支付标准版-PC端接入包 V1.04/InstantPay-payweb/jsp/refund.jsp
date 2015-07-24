<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	SimpleDateFormat dateFormat		= new SimpleDateFormat("yyMMdd_HHmmssSSS");
	String orderid					= "YJZFREFUND" + dateFormat.format(new Date());
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>退款接口演示</title>
</head>
	<body>
		<br>
		<br>
		<table width="80%" border="0" align="center" cellpadding="5" cellspacing="0" style="border:solid 1px #107929">
			<tr>
		  		<th align="center" height="20" colspan="5" bgcolor="#6BBE18">
					请输入退款请求参数	
				</th>
		  	</tr> 

			<form method="post" action="../jsp/sendRefund.jsp" target="_blank" accept-charset="UTF-8">
				<tr >
					<td width="25%" align="left">&nbsp;退款请求号</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="50%" align="left"> 
						<input size="60" type="text" name="orderid" value="<%=orderid%>"/>
						<span style="color:#FF0000;font-weight:100;">*</span>
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">orderid</td> 
				</tr>

				<tr >
					<td width="25%" align="left">&nbsp;将被退款订单的易宝流水号</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="50%" align="left"> 
						<input size="60" type="text" name="origyborderid" value="" />
						<span style="color:#FF0000;font-weight:100;">*</span>
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">origyborderid</td> 
				</tr>

				<tr >
					<td width="25%" align="left">&nbsp;退款金额「分」</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="50%" align="left"> 
						<input size="60" type="text" name="amount" value="" />
						<span style="color:#FF0000;font-weight:100;">*</span>
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">amount</td> 
				</tr>

				<tr >
					<td width="25%" align="left">&nbsp;交易币种</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="50%" align="left"> 
						<input size="60" type="text" readonly="readonly" name="currency" value="156" />
						<span style="color:#FF0000;font-weight:100;">*</span>
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">currency</td> 
				</tr>

				<tr >
					<td width="25%" align="left">&nbsp;退款说明</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="50%" align="left"> 
						<input size="60" type="text" name="cause" value="" />
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">cause</td> 
				</tr>

				<tr >
					<td width="25%" align="left">&nbsp;</td>
					<td width="5%"  align="center">&nbsp;</td> 
					<td width="50%" align="left"> 
						<input type="submit" value="提交退款请求" />
					</td>
					<td width="5%"  align="center">&nbsp;</td> 
					<td width="15%" align="left">&nbsp;</td> 
				</tr>

			</form>
		</table>
</body>
</html>