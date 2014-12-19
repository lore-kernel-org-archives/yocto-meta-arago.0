Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2658B52079
	for <meta-arago@arago-project.org>;
	Fri, 19 Dec 2014 19:17:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBJJHv4G024843
	for <meta-arago@arago-project.org>; Fri, 19 Dec 2014 13:17:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBJJHvtB026842
	for <meta-arago@arago-project.org>; Fri, 19 Dec 2014 13:17:57 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 13:17:56 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBJJHuFN031660;	Fri, 19 Dec 2014 13:17:56 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id sBJJHs1o012744;	Sat, 20 Dec 2014 00:47:54 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Dec 2014 13:17:52 -0600
Message-ID: <1419016672-11537-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] u-boot-ti-staging: Add SDK env args missing from git tree
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
X-List-Received-Date: Fri, 19 Dec 2014 19:17:58 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* This patch has been upstreamed and was accidently committed to the incorrect git
  tree for am57xx-evm.
* Locally apply this patch now until it is committed to the right branch.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...0001-omap5-Add-netargs-and-netboot-option.patch |   54 ++++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2014.07.bbappend      |    5 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch
new file mode 100644
index 0000000..44cb9ee
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging/0001-omap5-Add-netargs-and-netboot-option.patch
@@ -0,0 +1,54 @@
+From ae58ce41dcd9e6c213e57abf46ec2680eab9cd34 Mon Sep 17 00:00:00 2001
+From: Franklin S Cooper Jr <fcooper@ti.com>
+Date: Thu, 4 Dec 2014 11:27:05 -0600
+Subject: [PATCH] omap5: Add netargs and netboot option
+
+* Add netargs and netboot option.
+* This enables tftp and nfs booting
+* This puts omap5 devices inline with other devices such as am335x and am437x
+
+Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+---
+ include/configs/ti_omap5_common.h |   15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/ti_omap5_common.h b/include/configs/ti_omap5_common.h
+index c47651d..925cb42 100644
+--- a/include/configs/ti_omap5_common.h
++++ b/include/configs/ti_omap5_common.h
+@@ -85,10 +85,16 @@
+ 		"vram=${vram} " \
+ 		"root=${mmcroot} " \
+ 		"rootfstype=${mmcrootfstype}\0" \
++	"netargs=setenv bootargs console=${console} " \
++		"${optargs} " \
++		"root=/dev/nfs " \
++		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
++		"ip=dhcp\0" \
+ 	"loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr\0" \
+ 	"bootscript=echo Running bootscript from mmc${mmcdev} ...; " \
+ 		"source ${loadaddr}\0" \
+-	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} uEnv.txt\0" \
++	"bootenv=uEnv.txt\0" \
++	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
+ 	"importbootenv=echo Importing environment from mmc${mmcdev} ...; " \
+ 		"env import -t ${loadaddr} ${filesize}\0" \
+ 	"loadimage=load mmc ${bootpart} ${loadaddr} ${bootdir}/${bootfile}\0" \
+@@ -110,6 +116,13 @@
+ 				"bootz ${loadaddr} - ${fdtaddr}; " \
+ 			"fi;" \
+ 		"fi;\0" \
++	"netboot=echo Booting from network ...; " \
++		"set env autoload no; " \
++		"dhcp; " \
++		"tftp ${loadaddr} ${bootfile}; " \
++		"tftp ${fdtaddr} ${fdtfile}; " \
++		"run netargs; " \
++		"bootz ${loadaddr} - ${fdtaddr}\0" \
+ 	"findfdt="\
+ 		"if test $board_name = omap5_uevm; then " \
+ 			"setenv fdtfile omap5-uevm.dtb; fi; " \
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index 872d0b2..35ad282 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,4 +1,6 @@
-PR_append = "-arago5"
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+
+PR_append = "-arago6"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
@@ -12,3 +14,4 @@ SRC_URI_am57xx-evm := "${@oe_filter_out('git://git.ti.com/ti-u-boot/ti-u-boot.gi
 BRANCH_am57xx-evm = "beaglex15"
 
 SRC_URI_am57xx-evm += "git://github.com/felipebalbi/u-boot.git;protocol=git;branch=${BRANCH}"
+SRC_URI_am57xx-evm += "file://0001-omap5-Add-netargs-and-netboot-option.patch"
-- 
1.7.9.5


