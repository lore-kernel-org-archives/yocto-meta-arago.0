Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0B08652A32
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 14:34:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99EYIrv020751
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:34:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99EYHS0027762
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:34:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 09:34:18 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99EYHBH012139;
	Fri, 9 Oct 2015 09:34:17 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkYkT-0001BN-9B; Fri, 09 Oct 2015 10:34:17 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 10:34:14 -0400
Message-ID: <1444401255-4511-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 1/2] setup-uboot-env-{am335x, am43x, am57xx-evm}.sh: Config NFS over TCP.
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
X-List-Received-Date: Fri, 09 Oct 2015 14:34:26 -0000
Content-Type: text/plain

* This is to improve the stability of the root NFS mount.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am335x.sh     | 2 ++
 setup-uboot-env-am43x.sh      | 2 ++
 setup-uboot-env-am57xx-evm.sh | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index 6ba4993..d593c1c 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -184,6 +184,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
@@ -205,6 +206,7 @@ else
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 74c7c85..329e3d7 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -138,6 +138,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
@@ -159,6 +160,7 @@ else
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index f1dcc3d..ae95368 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -144,6 +144,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
@@ -165,6 +166,7 @@ else
 		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-- 
1.9.1


