#!/bin/bash

# 还原可能被误修改的 Patch 文件
git checkout target/linux/ 2>/dev/null || true

# 仅对编译解压后的实际 C 源码进行修改（不触碰任何 .patch 或 Makefile）
find target/linux/ -name "sysctl_net_core.c" -o -name "sysctl.c" | while read -r file; do
    sed -i '/netdev_budget_usecs/s/20000/100/g' "$file"
done || true
