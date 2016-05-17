Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 3A251529E7
	for <meta-arago@arago-project.org>;
	Tue, 17 May 2016 18:19:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4HIJLNa003423
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 13:19:21 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HIJLMW023912
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 13:19:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 May 2016 13:19:21 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HIJLP5015715;
	Tue, 17 May 2016 13:19:21 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1b2jaS-0002AH-Ni; Tue, 17 May 2016 14:19:20 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 May 2016 14:19:18 -0400
Message-ID: <1463509158-8234-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env: Update for U-Boot 2016.05
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
X-List-Received-Date: Tue, 17 May 2016 18:19:22 -0000
Content-Type: text/plain

This addresses the following changes in U-Boot:
* U-Boot prompt changed from "U-Boot#" to "=>"
* "mmcargs" changed to "args_mmc"
* "stop autoboot" prompt changed to "abort autoboot" for am335x only.

This also disables the automatic upgrade of u-boot until a proper fix
can be implemented

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am335x.sh     | 75 ++++++++++++++++++++--------------------
 setup-uboot-env-am43x.sh      | 79 ++++++++++++++++++++++---------------------
 setup-uboot-env-am57xx-evm.sh | 71 +++++++++++++++++++-------------------
 setup-uboot-env-k2g-evm.sh    | 37 ++++++++++----------
 setup-uboot-env-keystone.sh   | 64 +++++++++++++++++++----------------
 setup-uboot-env-omap5.sh      |  2 +-
 6 files changed, 172 insertions(+), 156 deletions(-)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index d593c1c..1a65d5b 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -54,6 +54,9 @@ echo
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
 
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
@@ -171,54 +174,54 @@ check_for_beaglebone() {
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 
-do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
-do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"abort autoboot\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"abort autoboot\"" "send \" \"" $cwd/setupBoard.minicom
 
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
 		#TFTP and SD Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
 else
 	if [ "$fs" -eq "1" ]; then
 		#SD and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
 		#SD and SD boot.
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
 	fi
 fi
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 502af43..b93b371 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -54,6 +54,9 @@ echo
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
 
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
@@ -126,57 +129,57 @@ fi
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
 		#TFTP and SD Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
 else
 	if [ "$fs" -eq "1" ]; then
 		#SD and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
 		#SD and SD boot.
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
 	fi
 fi
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index ae95368..e1628b7 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -54,6 +54,9 @@ echo "--------------------------------------------------------------------------
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
 
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
@@ -132,53 +135,53 @@ check_for_board() {
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
 		#TFTP and SD Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
 else
 	if [ "$fs" -eq "1" ]; then
 		#SD and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
 		#SD and SD boot.
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
 	fi
 fi
diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
index 3e8c1db..f41d278 100755
--- a/setup-uboot-env-k2g-evm.sh
+++ b/setup-uboot-env-k2g-evm.sh
@@ -81,6 +81,9 @@ echo "--------------------------------------------------------------------------
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
 echo
@@ -172,40 +175,40 @@ fi
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
-do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 
-do_expect "\"U-Boot#\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode} run_mon run_kern'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode} run_mon run_kern'\"" $cwd/setupBoard.minicom
 
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
 if [ "$kernel" -eq "1" ]; then
 	#TFTP
-	do_expect "\"U-Boot#\"" "send \"setenv kern_mode net\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv kern_mode net\"" $cwd/setupBoard.minicom
 else
 	#SD
-	do_expect "\"U-Boot#\"" "send \"setenv kern_mode mmc\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv kern_mode mmc\"" $cwd/setupBoard.minicom
 fi
 
 if [ "$fs" -eq "1" ]; then
 	#NFS
-	do_expect "\"U-Boot#\"" "send \"setenv fs_mode net\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv fs_mode net\"" $cwd/setupBoard.minicom
 else
 	#SD
-	do_expect "\"U-Boot#\"" "send \"setenv fs_mode mmc\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv fs_mode mmc\"" $cwd/setupBoard.minicom
 fi
 
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
 echo "end:" >> $cwd/setupBoard.minicom
 #echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 750b8cf..7335758 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -81,6 +81,9 @@ echo "--------------------------------------------------------------------------
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
 echo
@@ -216,41 +219,42 @@ echo "timeout 1800" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
-if [ "$ubootupdate" != "y" ]; then
+# Disable upgrading major U-boot versions
+#if [ "$ubootupdate" != "y" ]; then
 	# If not updating U-Boot, refure to procede if running an old MCSDK version.
-	cat >> $cwd/setupBoard.minicom << '__EOF__'
+	cat >> $cwd/setupBoard.minicom << __EOF__
 expect {
-    "U-Boot#"
+    "$prompt"
     "# " goto uboot_update_required
     timeout 60 goto end
 }
 send " "
 __EOF__
-fi
+#fi
 
 # Reset to the default environment
-do_expect "\"# \"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-do_expect "\"# \"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
 # Reset incase any variables are set when u-boot initializes
-do_expect "\"# \"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 # Set vars required to flash u-boot
-do_expect "\"# \"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-do_expect "\"# \"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
-do_expect "\"# \"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 
 if [ "$ubootupdate" = "y" ]; then
 	# Use common "burn_uboot" command
-	do_expect "\"# \"" "send \"if test -n \$burn_uboot_spi; then setenv burn_uboot \$burn_uboot_spi; fi\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"if test -n \$burn_uboot_spi; then setenv burn_uboot \$burn_uboot_spi; fi\"" $cwd/setupBoard.minicom
 
 	# Create command to print a known message if u-boot update succeeds
 	update_uboot_success="U-Boot successfully updated"
 
 	# Create command to fetch and flash u-boot
-	do_expect "\"# \"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot; then echo $update_uboot_success; else echo U-boot update failed!; fi'\"" $cwd/setupBoard.minicom
-	do_expect "\"# \"" "send \"run update_uboot\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot; then echo $update_uboot_success; else echo U-boot update failed!; fi'\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"run update_uboot\"" $cwd/setupBoard.minicom
 
 	do_expect "\"$update_uboot_success\"" "send \"reset\"" $cwd/setupBoard.minicom
 
@@ -258,41 +262,41 @@ if [ "$ubootupdate" = "y" ]; then
 	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 	# Reset environment to the new U-Boot's defaults
-	do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-	do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
 	# Reset a second time incase any variables are set when u-boot initializes
-	do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 	# Reinitialize any variables previously set
-	do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-	do_expect "\"U-Boot#\"" "send setenv tftp_root '$tftproot'" $cwd/setupBoard.minicom
-	do_expect "\"U-Boot#\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send setenv tftp_root '$tftproot'" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 fi
 
-do_expect "\"U-Boot#\"" "send setenv nfs_root '$rootpath'" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send setenv nfs_root '$rootpath'" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
 if [ "$secondary_boot" -eq "1" ]; then
 	#TFTP and NFS Boot
-	do_expect "\"U-Boot#\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
 else
 	#SD and NFS Boot
-	do_expect "\"U-Boot#\"" "send \"run get_ubi_net\"" $cwd/setupBoard.minicom
-	do_expect "\"U-Boot#\"" "send \"run burn_ubi\"" $cwd/setupBoard.minicom
-	do_expect "\"U-Boot#\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"run get_ubi_net\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"run burn_ubi\"" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom
 fi
 
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
 cat >> $cwd/setupBoard.minicom << __EOF__
 goto end
 uboot_update_required:
-send echo; echo "*** U-boot is require to be updated before proceding!"; echo "*** Please re-run setup.sh and choose to update U-boot."; echo
+send echo; echo "*** U-boot is require to be updated before proceding!"; echo "*** The automatic upgrade of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
 end:
 __EOF__
 #echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
diff --git a/setup-uboot-env-omap5.sh b/setup-uboot-env-omap5.sh
index 94b246a..7b6f084 100644
--- a/setup-uboot-env-omap5.sh
+++ b/setup-uboot-env-omap5.sh
@@ -39,7 +39,7 @@ echo "This step will set up the u-boot variables for booting the EVM."
 
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
-prompt="U-Boot#"
+prompt="$prompt"
 
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
-- 
1.9.1


