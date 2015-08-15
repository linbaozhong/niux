<div class="chouti" style="height:100%;">
	<div class="frame">
		<header>
			<form class="doc user-input native" style="display:none;">
				<input type="hidden" name="id" id="doc-id" value="" />
				<input type="hidden" name="moreId" id="doc-moreId" value="" />
				<input type="hidden" name="parentId" id="doc-parentId" value="" />
				<input type="hidden" name="documentId" id="doc-documentId" value="" />
				<input type="hidden" name="position" id="doc-position" value="" />
				<textarea id="myEditor" name="content">

				</textarea>
				<div class="form-actions right" style="margin-top: 10px;">
					<button name="btn-save" type="button" data-role="0" class="button primary">保存</button>
					<button name="btn-cancel" type="button" data-role="0" class="button">取消</button>
				</div>
			</form>
			<div class="doc-add center">
				<a>拖拽文档到这里 或者</a><a href="javascript:;" class="doc-plus"><i class="fa fa-plus-circle on-right-more on-left"></i>新建</a>
			</div>

		</header>

		<footer>
			<div class="mask" />
		</footer>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		// accordion插件
		snow.chouti = snow.main.find('div.chouti').accordion({
			horizontal: true
		});

	});
</script>