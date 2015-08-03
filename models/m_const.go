package models

const (
	Role_System        = 0 //超级管理员
	Role_Administrator = 1 //网站管理员
	Role_Auditor       = 2 //内容审核人
	Role_Editor        = 3 //网站编辑
	Role_Author        = 4 //网站客户
	Role_Reader        = 5 //读者
	Role_Guest         = 6 //游客

	Open_Alipay = 0 //支付宝用户
	Open_QQ     = 1 //qq用户
	Open_Weibo  = 2 //微博用户

	Private  = 0 //私有的
	Internal = 1 //内部的
	Public   = 2 //公开的
	Free     = 3 //自由的

	Undelete = 0 //未删除
	Deleted  = 1 //删除

	Unlock = 0 //未锁定
	Locked = 1 //锁定

	Audit_Normal = 0  //未审核
	Audit_No     = -1 //未通过
	Audit_Ing    = 1  //审核中
	Audit_Yes    = 2  //通过
)
