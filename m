Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id DEDEB52A5C
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2013 00:51:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXZ00FS590YWX00@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 Dec 2013 18:51:14 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9753A200AC; Tue,
	17 Dec 2013 19:50:58 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 17 Dec 2013 19:50:57 -0500
Message-id: <1387327857-11944-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] matrix-gui-crypto-demos: remove module manipulation from openssl_perf.sh
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
X-List-Received-Date: Wed, 18 Dec 2013 00:51:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...penssl_perf.sh-remove-module-manipulation.patch | 107 +++++++++++++++++++++
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |   4 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch
new file mode 100644
index 0000000..f538a86
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch
@@ -0,0 +1,107 @@
+From 04607c9d12330f72e96733582734155cb1a32a37 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 17 Dec 2013 19:43:16 -0500
+Subject: [PATCH] openssl_perf.sh: remove module manipulation
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ .../openssl_perf_scripts/openssl_perf.sh           | 71 ----------------------
+ 1 file changed, 71 deletions(-)
+
+diff --git a/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh b/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
+index 9da9ae2..1334274 100644
+--- a/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
++++ b/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
+@@ -1,13 +1,7 @@
+ #!/bin/sh
+ 
+-
+-CRYPTOMOD=/lib/modules/2.6.37/kernel/crypto/ocf/cryptodev.ko
+-OCFMOD=/lib/modules/2.6.37/crypto/ocf/ocf_omap3_cryptok.ko
+-
+-
+ OPENSSL=/usr/bin/openssl
+ 
+-
+ cat /proc/cpuinfo | grep OMAP3 > /dev/null 2> /dev/null
+ if [ `echo $?` = "0" ]
+ then
+@@ -16,69 +10,6 @@ else
+ 	export CPU=other
+ fi
+ 
+-
+-
+-
+-if [ $CPU = "OMAP3" ]
+-then
+-ls -l /dev/crypto > /dev/null 2> /dev/null
+-if [ `echo $?` = "1" ]
+-then
+-	if [ -r $CRYPTOMOD ]
+-	then
+-		echo "Installing cryptodev module"
+-		insmod $CRYPTOMOD
+-		if [ `echo $?` = "1" ]
+-		then
+-			echo "Cryptodev failed.  Test will run in SW only mode."
+-		else
+-			lsmod | grep ocf_omap3_cryptok >/dev/null
+-			if [ `echo $?` = "1" ]
+-			then
+-				if [ -r $OCFMOD ]
+-				then
+-					echo "Installing ocf_omap3_crypto module"
+-					insmod $OCFMOD ocf_omap3_crypto_dma=1
+-					if [ `echo $?` = "1" ]
+-					then
+-						echo "Removing cryptodev.  Running test in SW only mode."
+-						rmmod cryptodev
+-					fi
+-				else
+-					echo "Can't find OCF driver.  Running test in SW only mode."
+-					rmmod cryptodev
+-				fi
+-			else
+-				echo "ocf_omap3_crypto module is already installed"
+-			fi
+-		fi
+-	fi
+-else
+-	echo "Cryptodev module is already installed"
+-	lsmod | grep ocf_omap3_cryptok >/dev/null
+-	if [ `echo $?` = "1" ]
+-	then
+-		if [ -r $OCFMOD ]
+-		then
+-			echo "Installing ocf_omap3_crypto module"
+-			insmod $OCFMOD ocf_omap3_crypto_dma=1
+-			if [ `echo $?` = "1" ]
+-			then
+-				echo "Removing cryptodev.  Running test in SW only mode."
+-				rmmod cryptodev
+-			fi
+-		else
+-			echo "Can't find OCF driver.  Running test in SW only mode."
+-			rmmod cryptodev
+-		fi
+-	else
+-		echo "ocf_omap3_crypto module is already installed"
+-	fi
+-fi
+-fi
+-
+-
+-
+ if [ -r $OPENSSL ]
+ then
+ 	$OPENSSL version
+@@ -123,5 +54,3 @@ time -v $OPENSSL speed -evp md5 -engine cryptodev > $TEMP 2>&1
+ egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+ 
+ rm $TEMP
+-
+-
+-- 
+1.8.3.2
+
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index ad9be99..698749c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -13,6 +13,8 @@ S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
 S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
 S_dra7xx-evm = "${WORKDIR}/git/cryptos_apps_program"
 
+SRC_URI += "file://0001-openssl_perf.sh-remove-module-manipulation.patch;striplevel=2"
+
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
-- 
1.8.3.2


