<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="shortcut icon" href="/static/img/favicon.ico" />
		<title>{{i18n .Lang "app title"}} - {{.seo.Title}}</title>
		<link rel="stylesheet" type="text/css" href="/static/css/snow.css" />
		<link rel="stylesheet" type="text/css" href="/static/css/app.css" />
		<script src="/static/js/jquery-2.1.1.min.js"></script>
		<script src="/static/js/global.js"></script>
		<script src="/static/js/app.js"></script>
	</head>
	<body class="snow">
		<header class="rel bg-dark fg-white" style="height: 36px;">
			<div class="abs" style="margin-top:7px;margin-left:25px;">
				<a href="/"><img src="/static/img/logo_28.png" alt="{{i18n .Lang "app title"}}" style="vertical-align:middle;">
				<span>{{i18n .Lang "app title"}}</span></a>
			</div>
			<div class="abs margin-right-20" style="left:auto;right:0;margin-top:10px;">
				<a href="">{{i18n .Lang "login"}}</a>
				<a href="/help">{{i18n .Lang "help"}}</a>
			</div>
		</header>
		<div class="wrap center" style="margin: 100px auto 50px;">
			<img src="/static/img/logo_0.png" alt="{{i18n .Lang "app title"}}">
		</div>
		<div id="main" class="wrap">
			{{.LayoutContent}}
		</div>
		<footer id="footer" class="fixed-bottom center bg-dark fg-white">
		<span>{{i18n .Lang "app title"}}</span>
		<span> - {{loadtimes .PageStartTime}}ms</span>
		</footer>
	</body>
</html>