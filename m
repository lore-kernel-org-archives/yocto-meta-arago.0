Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 91EBA529C6
	for <meta-arago@arago-project.org>;
	Mon, 13 Apr 2015 14:31:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3DEVScv001496
	for <meta-arago@arago-project.org>; Mon, 13 Apr 2015 09:31:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3DEVRQZ004258
	for <meta-arago@arago-project.org>; Mon, 13 Apr 2015 09:31:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 13 Apr 2015 09:31:27 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3DEVRAC003645;
	Mon, 13 Apr 2015 09:31:27 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YhfOY-0002mh-Th;
	Mon, 13 Apr 2015 10:31:27 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Apr 2015 10:31:21 -0400
Message-ID: <1428935481-10673-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am43x: Set devtype to mmc to boot from SD card.
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
X-List-Received-Date: Mon, 13 Apr 2015 14:31:31 -0000
Content-Type: text/plain

* The 'loadimage' u-boot routine for am43x requires that the variable
  'devtype' is set to the device from which to load the kernel image.
* In the case of booting from the sdcard, devtype should be 'mmc'.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am43x.sh |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 282ffc1..ab65eb5 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -152,6 +152,7 @@ else
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run loadimage; run findfdt; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
@@ -159,6 +160,7 @@ else
 		#SD and SD boot.
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run loadimage; run findfdt; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
-- 
1.7.9.5


