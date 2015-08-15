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
		<dt>{{.Channel.CnName}}</dt>
		<dd>
		{{range $key,$tag := .Tags }}
				
			<a href="/{{$tag.Name}}">{{$tag.ViewName}}</a>
			
		{{end}}
		</dd>
	</dl>

{{end}}