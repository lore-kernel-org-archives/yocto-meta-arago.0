Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 18B2A5299A
	for <meta-arago@arago-project.org>;
	Mon, 16 Nov 2015 15:38:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAGFcA0P008421
	for <meta-arago@arago-project.org>; Mon, 16 Nov 2015 09:38:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAGFcAI8010548
	for <meta-arago@arago-project.org>; Mon, 16 Nov 2015 09:38:10 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Nov 2015 09:38:10 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAGFc9Po025338;
	Mon, 16 Nov 2015 09:38:09 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZyLr7-0003Yu-Ct; Mon, 16 Nov 2015 10:38:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Nov 2015 10:38:06 -0500
Message-ID: <1447688286-13653-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447688286-13653-1-git-send-email-j-stiffler@ti.com>
References: <1447688286-13653-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] matrix-gui-crypto-demos: Remove openssl_perf patch
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
X-List-Received-Date: Mon, 16 Nov 2015 15:38:11 -0000
Content-Type: text/plain

* The patch has been upstreamed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...penssl_perf.sh-remove-module-manipulation.patch | 107 ---------------------
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |   4 +-
 2 files changed, 1 insertion(+), 110 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch
deleted file mode 100644
index f538a86..0000000
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos/0001-openssl_perf.sh-remove-module-manipulation.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 04607c9d12330f72e96733582734155cb1a32a37 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 17 Dec 2013 19:43:16 -0500
-Subject: [PATCH] openssl_perf.sh: remove module manipulation
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- .../openssl_perf_scripts/openssl_perf.sh           | 71 ----------------------
- 1 file changed, 71 deletions(-)
-
-diff --git a/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh b/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
-index 9da9ae2..1334274 100644
---- a/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
-+++ b/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
-@@ -1,13 +1,7 @@
- #!/bin/sh
- 
--
--CRYPTOMOD=/lib/modules/2.6.37/kernel/crypto/ocf/cryptodev.ko
--OCFMOD=/lib/modules/2.6.37/crypto/ocf/ocf_omap3_cryptok.ko
--
--
- OPENSSL=/usr/bin/openssl
- 
--
- cat /proc/cpuinfo | grep OMAP3 > /dev/null 2> /dev/null
- if [ `echo $?` = "0" ]
- then
-@@ -16,69 +10,6 @@ else
- 	export CPU=other
- fi
- 
--
--
--
--if [ $CPU = "OMAP3" ]
--then
--ls -l /dev/crypto > /dev/null 2> /dev/null
--if [ `echo $?` = "1" ]
--then
--	if [ -r $CRYPTOMOD ]
--	then
--		echo "Installing cryptodev module"
--		insmod $CRYPTOMOD
--		if [ `echo $?` = "1" ]
--		then
--			echo "Cryptodev failed.  Test will run in SW only mode."
--		else
--			lsmod | grep ocf_omap3_cryptok >/dev/null
--			if [ `echo $?` = "1" ]
--			then
--				if [ -r $OCFMOD ]
--				then
--					echo "Installing ocf_omap3_crypto module"
--					insmod $OCFMOD ocf_omap3_crypto_dma=1
--					if [ `echo $?` = "1" ]
--					then
--						echo "Removing cryptodev.  Running test in SW only mode."
--						rmmod cryptodev
--					fi
--				else
--					echo "Can't find OCF driver.  Running test in SW only mode."
--					rmmod cryptodev
--				fi
--			else
--				echo "ocf_omap3_crypto module is already installed"
--			fi
--		fi
--	fi
--else
--	echo "Cryptodev module is already installed"
--	lsmod | grep ocf_omap3_cryptok >/dev/null
--	if [ `echo $?` = "1" ]
--	then
--		if [ -r $OCFMOD ]
--		then
--			echo "Installing ocf_omap3_crypto module"
--			insmod $OCFMOD ocf_omap3_crypto_dma=1
--			if [ `echo $?` = "1" ]
--			then
--				echo "Removing cryptodev.  Running test in SW only mode."
--				rmmod cryptodev
--			fi
--		else
--			echo "Can't find OCF driver.  Running test in SW only mode."
--			rmmod cryptodev
--		fi
--	else
--		echo "ocf_omap3_crypto module is already installed"
--	fi
--fi
--fi
--
--
--
- if [ -r $OPENSSL ]
- then
- 	$OPENSSL version
-@@ -123,5 +54,3 @@ time -v $OPENSSL speed -evp md5 -engine cryptodev > $TEMP 2>&1
- egrep 'Doing|User|System|Percent|Elapsed' $TEMP
- 
- rm $TEMP
--
--
--- 
-1.8.3.2
-
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 36e26bc..4607c3c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,8 +12,6 @@ S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
 S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
 S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
 
-SRC_URI += "file://0001-openssl_perf.sh-remove-module-manipulation.patch;striplevel=2"
-
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
-- 
1.9.1


