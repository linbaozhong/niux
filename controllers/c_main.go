package controllers

import (
	"github.com/beego/i18n"
)

type Main struct {
	Base
}

func (c *Main) Prepare() {
	c.Base.Prepare()

	c.allowRequest()

	c.Data["index"] = ""
	c.Data["account"] = c.currentUser

	c.Layout = "_layout.tpl"
	c.LayoutSections = make(map[string]string)
	// c.LayoutSections["Head"] = "_head.tpl"
	// c.LayoutSections["Footer"] = "_footer.tpl"
}

func (c *Main) Finish() {
	c.Base.Finish()
}

//首页
func (c *Main) Get() {
	c.setTplNames("index")
}

//帮助
func (c *Main) Help() {
	c.seo.Title = i18n.Tr(c.Lang, "help")
	c.setTplNames("help")
}

//标签页
func (c *Main) Tags() {
	c.seo.Title = c.Ctx.Input.Param(":tag")
	c.setTplNames("index")
}
