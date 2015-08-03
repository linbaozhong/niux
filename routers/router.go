package routers

import (
	"github.com/astaxie/beego"
	"niux/controllers"
)

func init() {
	main := &controllers.Main{}
	beego.Router("/", main)
	beego.Router("/help", main, "get:Help")
	beego.Router("/:tag", main, "get:Tags")
}
