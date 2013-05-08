Return-Path: <a0756824@ares-ubuntu>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 906EE529D4
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 00:28:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r480SEoU000795
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:28:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r480SDHJ006199
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:28:14 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 19:28:13 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r480SDtJ017902;	Tue, 7 May 2013 19:28:13 -0500
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1UZsEv-0003lZ-Fy;
	Tue, 07 May 2013 20:28:13 -0400
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 May 2013 20:28:08 -0400
Message-ID: <1367972890-14439-2-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367972890-14439-1-git-send-email-sajesh@ti.com>
References: <1367972890-14439-1-git-send-email-sajesh@ti.com>
MIME-Version: 1.0
Subject: [PATCH] added test package to ti-ipc recipe
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
X-List-Received-Date: Wed, 08 May 2013 00:28:14 -0000
Content-Type: text/plain

---
 .../recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb           |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
index 1e87abc..deb0356 100644
--- a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
+++ b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
@@ -10,8 +10,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
 SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
+TARGET_PLATFORM = "tci6638"
 
-PR = "r11"
+PR = "r18"
 
 BRANCH ?= "master"
 SRCREV = "3.00.00.15_eng"
@@ -20,8 +21,16 @@ SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-export PLATFORM = "tci6638"
+export PLATFORM = "${TARGET_PLATFORM}"
 
 export PARALLEL_MAKE = "-j 1"
 
-inherit autotools
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/NameServerApp_${TARGET_PLATFORM} \
+					${bindir}/MessageQApp_${TARGET_PLATFORM} \
+					${bindir}/MessageQMulti_${TARGET_PLATFORM} \
+					${bindir}/MessageQBench_${TARGET_PLATFORM} \
+					${bindir}/ping_rpmsg"
+
+inherit autotools
\ No newline at end of file
-- 
1.7.9.5


