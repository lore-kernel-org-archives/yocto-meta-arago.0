Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 122415297D
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B68D920BBD;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Jri3K4XO0-gF; Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D63820BBE;
	Fri, 10 Mar 2017 21:10:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3E74D1623BA;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:09 -0500
Message-Id: <1489180211-138519-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180211-138519-1-git-send-email-denis@denix.org>
References: <1489180211-138519-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/6] wl18xx-target-scripts: moved to meta-ti, remove here
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wl18xx-target-scripts/wl18xx-target-scripts.bb | 26 ----------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb

diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
deleted file mode 100644
index 414ba0c..0000000
--- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
-
-PV = "R8.6+git${SRCPV}"
-
-PR = "r7"
-
-# Tag: R8.6
-SRCREV = "693f71c709abcaa9047835cf3903aea26a63fa94"
-BRANCH = "sitara-scripts"
-SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-FILES_${PN} += "${datadir}/wl18xx/"
-
-do_install() {
-	install -d ${D}${datadir}/wl18xx/
-
-	scripts=`find ./ -type f -name "*.*"`
-	for s in $scripts
-	do
-		install -m 0755 $s ${D}${datadir}/wl18xx/
-	done
-}
-- 
2.7.4


