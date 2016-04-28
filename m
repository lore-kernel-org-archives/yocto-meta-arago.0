Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 393B15299C
	for <meta-arago@arago-project.org>;
	Thu, 28 Apr 2016 15:40:45 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6C0069MOVVZ130@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 28 Apr 2016 10:40:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=n78T-hxAiIjoD5Op_3IA:9
Received: by 100.15.86.14 with SMTP id 4c3e6420; Thu, 28 Apr 2016 15:40:44 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4158161FAE;	Thu,
	28 Apr 2016 11:40:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 28 Apr 2016 11:40:42 -0400
Message-id: <1461858042-29103-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot: remove old bbappends
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
X-List-Received-Date: Thu, 28 Apr 2016 15:40:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-am33x_2013.01.01.bbappend        |  5 --
 ...0001-omap5-Add-netargs-and-netboot-option.patch | 54 ----------------------
 .../u-boot/u-boot-ti-staging_2013.01.01.bbappend   |  3 --
 .../u-boot/u-boot-ti-staging_2013.10.bbappend      |  3 --
 .../u-boot/u-boot-ti-staging_2014.07.bbappend      |  5 --
 5 files changed, 70 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend
deleted file mode 100644
index d849fb5..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago1"
-
-# PSPREL and UVER are used by arago-source-ipk.conf
-PSPREL = "06.00.00.00"
-UVER = "2013.01.01"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch
deleted file mode 100644
index 44cb9ee..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ae58ce41dcd9e6c213e57abf46ec2680eab9cd34 Mon Sep 17 00:00:00 2001
-From: Franklin S Cooper Jr <fcooper@ti.com>
-Date: Thu, 4 Dec 2014 11:27:05 -0600
-Subject: [PATCH] omap5: Add netargs and netboot option
-
-* Add netargs and netboot option.
-* This enables tftp and nfs booting
-* This puts omap5 devices inline with other devices such as am335x and am437x
-
-Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
-Signed-off-by: Felipe Balbi <balbi@ti.com>
----
- include/configs/ti_omap5_common.h |   15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/include/configs/ti_omap5_common.h b/include/configs/ti_omap5_common.h
-index c47651d..925cb42 100644
---- a/include/configs/ti_omap5_common.h
-+++ b/include/configs/ti_omap5_common.h
-@@ -85,10 +85,16 @@
- 		"vram=${vram} " \
- 		"root=${mmcroot} " \
- 		"rootfstype=${mmcrootfstype}\0" \
-+	"netargs=setenv bootargs console=${console} " \
-+		"${optargs} " \
-+		"root=/dev/nfs " \
-+		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
-+		"ip=dhcp\0" \
- 	"loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr\0" \
- 	"bootscript=echo Running bootscript from mmc${mmcdev} ...; " \
- 		"source ${loadaddr}\0" \
--	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} uEnv.txt\0" \
-+	"bootenv=uEnv.txt\0" \
-+	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc${mmcdev} ...; " \
- 		"env import -t ${loadaddr} ${filesize}\0" \
- 	"loadimage=load mmc ${bootpart} ${loadaddr} ${bootdir}/${bootfile}\0" \
-@@ -110,6 +116,13 @@
- 				"bootz ${loadaddr} - ${fdtaddr}; " \
- 			"fi;" \
- 		"fi;\0" \
-+	"netboot=echo Booting from network ...; " \
-+		"set env autoload no; " \
-+		"dhcp; " \
-+		"tftp ${loadaddr} ${bootfile}; " \
-+		"tftp ${fdtaddr} ${fdtfile}; " \
-+		"run netargs; " \
-+		"bootz ${loadaddr} - ${fdtaddr}\0" \
- 	"findfdt="\
- 		"if test $board_name = omap5_uevm; then " \
- 			"setenv fdtfile omap5-uevm.dtb; fi; " \
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
deleted file mode 100644
index 1fb654b..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago4"
-
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
deleted file mode 100644
index f015993..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago1"
-
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
deleted file mode 100644
index 2296ccd..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
-
-PR_append = "-arago7"
-
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-- 
2.2.0


