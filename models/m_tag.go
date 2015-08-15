package models

import (
// "errors"
//"fmt"
//"github.com/astaxie/beego/validation"
)

type Tag struct {
	Id       int64  `json:"id"`
	Name     string `json:"name"`
	ViewName string `json:"viewName"`
	UseNum   int    `json:"useNum"`
	ClickNum int    `json:"clickNum"`
	Status   int    `json:"status"`
	Deleted  int    `json:"deleted"`
	Updator  int64  `json:"updator"`
	Updated  int64  `json:"updated"`
	Ip       string `json:"ip" valid:"MaxSize(23)"`
}

// 读取click最多的tag
func (this *Tag) GetClickTags(top int) {

}

// 读取指定channel的tag
func (this *Tag) GetTagsByChannelId(channelId int) (error, []Tag) {
	ts := make([]Tag, 0)
	err := db.Sql(`select tag.id,tag.name,tag.viewname 
		from channeltag left join tag on tag.id = channeltag.tagId 
		where tag.status = ? and tag.deleted = ? and channeltag.channelId = ?`, Unlock, Undelete, channelId).Find(&ts)

	return err, ts
}
