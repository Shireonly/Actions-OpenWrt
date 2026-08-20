#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
# 自动强行将内核源码及其补丁文件中的 20000 限制全量修改为 100
#!/bin/bash
# 修改默认 IP（可选）
# sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# 允许 netdev_budget_usecs 修改为小数值（解锁下限）
find target/linux/ -name "sysctl_net_core.c" -exec sed -i 's/20000/100/g' {} + 2>/dev/null || true
find net/core/ -name "sysctl.c" -exec sed -i 's/20000/100/g' {} + 2>/dev/null || true
