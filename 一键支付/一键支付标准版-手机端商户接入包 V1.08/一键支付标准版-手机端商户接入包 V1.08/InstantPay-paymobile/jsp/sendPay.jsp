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
	String productcatalog       = formatString(request.getParameter("productcatalog"));
	String productname          = formatString(request.getParameter("productname"));
	String identityid           = formatString(request.getParameter("identityid"));
	String userip               = formatString(request.getParameter("userip"));
	String terminalid           = formatString(request.getParameter("terminalid"));
	String userua               = formatString(request.getParameter("userua"));
	String transtime            = formatString(request.getParameter("transtime"));
	String amount               = formatString(request.getParameter("amount"));
	String identitytype         = formatString(request.getParameter("identitytype"));
	String terminaltype         = formatString(request.getParameter("terminaltype"));
	String productdesc          = formatString(request.getParameter("productdesc"));
	String fcallbackurl         = formatString(request.getParameter("fcallbackurl"));
	String callbackurl          = formatString(request.getParameter("callbackurl"));
	String paytypes             = formatString(request.getParameter("paytypes"));
	String currency             = formatString(request.getParameter("currency"));
	String orderexpdate         = formatString(request.getParameter("orderexpdate"));
	String version              = formatString(request.getParameter("version"));
	String cardno               = formatString(request.getParameter("cardno"));
	String idcardtype           = formatString(request.getParameter("idcardtype"));
	String idcard               = formatString(request.getParameter("idcard"));
	String owner                = formatString(request.getParameter("owner"));

	Map<String, String> params 	= new HashMap<String, String>();
	params.put("orderid", 			orderid);
	params.put("productcatalog", 	productcatalog);
	params.put("productname", 		productname);
	params.put("identityid", 		identityid);
	params.put("userip", 			userip);
	params.put("terminalid", 		terminalid);
	params.put("userua", 			userua);
	params.put("transtime", 		transtime);
	params.put("amount", 			amount);
	params.put("identitytype", 		identitytype);
	params.put("terminaltype", 		terminaltype);
	params.put("productdesc", 		productdesc);
	params.put("fcallbackurl", 		fcallbackurl);
	params.put("callbackurl", 		callbackurl);
	params.put("paytypes", 			paytypes);
	params.put("currency", 			currency);
	params.put("orderexpdate", 		orderexpdate);
	params.put("version", 			version);
	params.put("cardno", 			cardno);
	params.put("idcardtype", 		idcardtype);
	params.put("idcard", 			idcard);
	params.put("owner", 			owner);

	String payurl		= InstantPayService.getPaymobileRequestURL(params);

	if(payurl.startsWith("error") || "".equals(payurl)) {
		out.println("支付链接生成失败-payulr " + payurl);
	} else {
		response.sendRedirect(payurl);
	}
	
%>
