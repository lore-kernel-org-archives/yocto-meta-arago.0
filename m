Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 665615299C
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 16:13:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74GDCPj026234
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:13:12 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74GDCne028911
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:13:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 11:13:12 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74GDCa8029541;
	Tue, 4 Aug 2015 11:13:12 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMepz-0005Zi-TX; Tue, 04 Aug 2015 12:13:11 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 12:13:04 -0400
Message-ID: <1438704785-21392-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438704785-21392-1-git-send-email-j-stiffler@ti.com>
References: <1438704785-21392-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/3] setup-uboot-env-am*: Enhance minicom script to parse uEnv.txt
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
X-List-Received-Date: Tue, 04 Aug 2015 16:13:14 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am335x.sh     | 12 ++++++++----
 setup-uboot-env-am43x.sh      | 12 ++++++++----
 setup-uboot-env-am57xx-evm.sh | 12 ++++++++----
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index e3fb522..6ba4993 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -184,7 +184,8 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
@@ -192,7 +193,8 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
@@ -203,14 +205,16 @@ else
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run loadimage; run findfdt; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
 		#SD and SD boot.
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run loadimage; run findfdt; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 931b1d2..74c7c85 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -138,7 +138,8 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
@@ -146,7 +147,8 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
@@ -158,7 +160,8 @@ else
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run loadimage; run findfdt; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
@@ -166,7 +169,8 @@ else
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run loadimage; run findfdt; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index a3f4126..5beee26 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -134,7 +134,8 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
@@ -142,7 +143,8 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
@@ -153,14 +155,16 @@ else
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run loadimage; run findfdt; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
 		#SD and SD boot.
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run loadimage; run findfdt; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 
-- 
1.9.1


