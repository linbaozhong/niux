package main

import (
	"time"
)

// 引用自beego官网,获取请求响应时间(ms毫秒)
func loadtimes(t time.Time) int {
	return int(time.Now().Sub(t).Nanoseconds() / 1e6)
}
