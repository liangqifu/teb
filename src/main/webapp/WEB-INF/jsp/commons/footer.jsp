<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- 页脚 -->
<footer>
	<div class="ym-wrapper">
		<div class="ym-wbox">
			<p>
				<spring:message code="global.copyright" />
				<!-- <script type="text/javascript">
				// 百度统计
				var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
				document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F40795d29f7efcc8ec34719108875ab7e' type='text/javascript'%3E%3C/script%3E"));
				</script> -->
				<script src="http://s25.cnzz.com/stat.php?id=4772523&web_id=4772523&show=pic1" language="JavaScript"></script>
			</p>
		</div>
	</div>
</footer>
<script type="text/javascript">
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = "//platform.twitter.com/widgets.js";
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, "script", "twitter-wjs");
</script>