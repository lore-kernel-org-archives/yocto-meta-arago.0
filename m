Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 275935298A
	for <meta-arago@arago-project.org>;
	Fri, 29 Jul 2016 18:10:21 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB3004V49585O90@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Jul 2016 13:10:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=-HWDxB5gfVnT3iBLleIA:9
Received: by 100.15.86.14 with SMTP id 21fb5395; Fri, 29 Jul 2016 18:10:19 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id E4E66161B38;	Fri, 29 Jul 2016 14:10:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Jul 2016 14:10:18 -0400
Message-id: <1469815818-5705-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] switch-config: make machine-agnostic, use new libc headers
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2016 18:10:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since new custom linux-libc-headers now contains necessary files, update
switch-config to be machine-agnostic.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index cf2ccdd..2fd9d3b 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -2,12 +2,8 @@ DESCRIPTION = "Ethernet Switch configuration management"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://switch-config.c;beginline=1;endline=14;md5=659ff9658cbaba3110b81804af60de75"
 
-DEPENDS = "virtual/kernel"
-
 PV = "2.0"
-PR = "r0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r1"
 
 BRANCH ?= "v4.1"
 SRCREV = "669334329dff132c4a093351d48252b12e995b6c"
@@ -19,9 +15,6 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_configure() {
-	mkdir -p ${S}/linux
-	cp ${STAGING_KERNEL_DIR}/include/uapi/linux/net_switch_config.h ${S}/linux
-	cp ${STAGING_KERNEL_DIR}/include/uapi/linux/sockios.h ${S}/linux
 	sed 's|-I$(KBUILD_OUTPUT)/usr/include|${TOOLCHAIN_OPTIONS} -I.|' -i ${S}/Makefile
 }
 
-- 
2.7.4


