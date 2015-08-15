package controllers

import (
	//"fmt"
	"github.com/beego/i18n"
	"niux/models"
)

type Main struct {
	Base
}

func (this *Main) Prepare() {
	this.Base.Prepare()

	this.allowRequest()

	this.Data["index"] = ""
	this.Data["account"] = this.currentUser

	this.Layout = "_layout.tpl"
	//this.LayoutSections = make(map[string]string)
	// this.LayoutSections["Head"] = "_head.tpl"
	// this.LayoutSections["Footer"] = "_footer.tpl"
}

func (this *Main) Finish() {
	this.Base.Finish()
}

//首页
func (this *Main) Get() {
	// 传参数
	this.Data["channelTags"] = this.getChannelTags()

	this.setTplNames("index")
}

//帮助
func (this *Main) Help() {
	this.seo.Title = i18n.Tr(this.Lang, "help")
	this.setTplNames("help")
}

//标签页
func (this *Main) Tags() {
	this.seo.Title = this.Ctx.Input.Param(":tag")
	// 传参数
	this.Data["channelTags"] = this.getChannelTags()

	this.Layout = "_tagLayout.tpl"
	this.setTplNames("tags")
}

///////////////////////////////////////
func (this *Main) getChannelTags() interface{} {
	channel_key := "channel_tags"
	// 从cache中读取所有可见频道和标签
	cache_val := BCache.Get(channel_key)

	// 如果cache不存在
	if cache_val == nil {
		// 创建一个临时struct
		type ChannelTags struct {
			Channel models.Channel
			Tags    []models.Tag
		}

		// 读取所有可见频道
		channel := new(models.Channel)
		err, chs := channel.GetChannels()

		// 根据chs的长度创建一个slice
		_channelTagSlice := make([]ChannelTags, len(chs))

		if err == nil {
			tag := new(models.Tag)

			// 遍历频道，读取频道标签
			for i, ch := range chs {
				_, tags := tag.GetTagsByChannelId(ch.Id)

				// 填充slice
				_channelTagSlice[i] = ChannelTags{Channel: ch, Tags: tags}
			}

		}
		// 缓存1小时
		BCache.Put(channel_key, _channelTagSlice, 3600)
		cache_val = _channelTagSlice
	}
	return cache_val
}
