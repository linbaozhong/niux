<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="shortcut icon" href="/static/img/favicon.ico" />
		<title>{{i18n .Lang "app title"}} - {{.seo.Title}}</title>
		<link rel="stylesheet" type="text/css" href="/static/css/jquery-ui.css" />
		<link rel="stylesheet" href="/static/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="/static/css/snow.css" />
		<link rel="stylesheet" type="text/css" href="/static/css/app.css" />
		<script src="/static/js/jquery-2.1.1.min.js"></script>
		<script src="/static/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/static/js/jquery.mousewheel.js" type="text/javascript"></script>
		<!--滚动条-->
		<link rel="stylesheet" type="text/css" href="/static/css/jquery.mCustomScrollbar.min.css" />
		<script src="/static/js/jquery.accordion.0.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="/static/js/global.js"></script>
		<script src="/static/js/app.js"></script>
	</head>
	<body class="snow">
		<header class="rel bg-dark fg-white">
			<div class="abs" style="margin-top:7px;margin-left:25px;">
				<a href="/"><img src="/static/img/logo_28.png" alt="{{i18n .Lang "app title"}}" style="vertical-align:middle;">
				<span>{{i18n .Lang "app title"}}</span></a>
			</div>
			<div id="nav" class="">
				<dl>
					<dt>常用</dt>
					<dd>
						<a href="/html">html</a>
						<a href="/css">css</a>
						<a href="/javascript">javascript</a>
					</dd>
				</dl>
				{{range $index,$channelTag := .channelTags}}
					<dl>
						<dt>{{$channelTag.Channel.CnName}}</dt>
						<dd>
						{{range $key,$tag := $channelTag.Tags }}
							<a href="/{{$tag.Name}}">{{$tag.ViewName}}</a>
						{{end}}
						</dd>
					</dl>
				{{end}}
				<div class="inline margin-left-20">
					<label for=""><input type="text" name="" id="" value=""/><a href="javascript:;"><i class="fa fa-search"></i></a></label>
				</div>
			</div>
			<div class="abs margin-right-20" style="left:auto;right:0;margin-top:10px;">
				<a href="">{{i18n .Lang "login"}}</a>
				<a href="/help">{{i18n .Lang "help"}}</a>
			</div>
		</header>

		<div id="main" class="fixed" style="top: 36px;right:0;bottom:56px;left: 0;">
			{{.LayoutContent}}
		</div>
		<footer id="footer" class="fixed-bottom center bg-dark fg-white">
		<span>{{i18n .Lang "app title"}}</span>
		<span> - {{loadtimes .PageStartTime}}ms</span>
		</footer>
		<!--滚动条-->
		<div id="scrollbar_vertical">
			<div id="scrollbar" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;z-index: 20;">
				<div class="mCSB_draggerContainer">
					<div id="dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; height: 416px; top: 49px; display: block; max-height: 455px;" oncontextmenu="return false;">
						<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
					</div>
					<div class="mCSB_draggerRail"></div>
				</div>
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
	snow.main = $("#main");
	snow.scrollbar = $('#scrollbar_vertical');
	
	// 滚动条拖拽块事件
	snow.scrollbar.drager = snow.scrollbar.find('#dragger_vertical').draggable({
		axis: "y",
		containment: "parent",
		drag: function(e, ui) {
			var _this = $(this).css('left', 0).closest('.frame'),
				_height = snow.left.height(),
				_maxHeight = _this.outerHeight(),
				_step = _height / _maxHeight,
				_top = ui.position.top / _step * (-1);
			_this.css({
				top: _top
			});
		}
	});
	
	// resize事件
	snow.autoScroll = function(_this) {
		//滚动条
		_this.append(
			snow.scrollbar.css({
				left:_this.offset().left + _this.outerWidth()
			})
		);
		var _height = snow.main.height(); //_this.outerHeight(),
			_maxHeight = _this.outerHeight(),
			_step = _height / _maxHeight,
			_top = _this.position().top;
			
		if (_maxHeight <= _height) {
			snow.scrollbar.find('#scrollbar').hide();
			
			snow.scrollbar.drager.css({
				maxHeight: _height,
				height: _height * _step,
				top: 0
			});
		} else {
			snow.scrollbar.find('#scrollbar').show();
			snow.scrollbar.drager.css({
				maxHeight: _height,
				height: _height * _step,
				top: _top * _step * (-1)
			});
		}
	};
	// 滚动条事件
	snow.main.on('mousewheel', '.frame', function(e, delta) {
		// 只有滚动条才可滚动
		if (snow.scrollbar.find('#scrollbar').is(':hidden')) {
			return;
		}
		var _this = $(this),
			_height = snow.main.height(),
			_maxHeight = _this.outerHeight(),
			_step = _height / _maxHeight,
			_top = _this.position().top + (delta * 100);
			
		// 向上
		if (delta > 0 && _top > 0) {
			_top = 0;
		} else if (delta < 0 && _maxHeight + _top < _height) {
			_top = _height - _maxHeight;
		}
		
		_this.css({
			top: _top
		});
		snow.scrollbar.drager.css({
			top: _top * _step * -1
		});
	});

</script>