package models

import (
// "errors"
//"fmt"
//"github.com/astaxie/beego/validation"
)

type Channel struct {
	Id      int    `json:"id"`
	CnName  string `json:"cnName"`
	EnName  string `json:"enName"`
	Status  int    `json:"status"`
	Deleted int    `json:"deleted"`
}

type ChannelTag struct {
	ChannelId int    `json:"channelId"`
	TagId     int64  `tagId`
	Updator   int64  `json:"updator"`
	Updated   int64  `json:"updated"`
	Ip        string `json:"ip" valid:"MaxSize(23)"`
}

// 读取所有可见频道
func (this *Channel) GetChannels() (error, []Channel) {
	cs := make([]Channel, 0)
	err := db.Sql("select id,cnname,enname from channel where status = ? and deleted = ?", Unlock, Undelete).Find(&cs)
	return err, cs
}
