Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 706C352995
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:28:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LSdsq024406
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LSdWZ003557
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:39 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:28:39 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LSV9a016143;
	Mon, 6 May 2013 16:28:38 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:28:24 -0500
Message-ID: <1367875707-8579-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367875707-8579-1-git-send-email-fcooper@ti.com>
References: <1367875707-8579-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/6] am-sysinfo: Grab CFLAGS from OE or Rules.make
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
X-List-Received-Date: Mon, 06 May 2013 21:28:40 -0000
Content-Type: text/plain

* When building from OE CFLAGS will be passed in.
* When building from within the sdk CFLAGS from Rules.make will be used.
* This insures the optimal CFLAGS are used which corrects optimization and also
  the correct toolchain settings (ie softfp/hardfp) are used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index a5e0afe..153d1f0 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e7
 SECTION = "system"
 
 PACKAGE_STRIP = "no"
-PR = "r6"
+PR = "r7"
 
 BRANCH ?= "master"
-SRCREV = "86e936b0a50e450089471b53ae8c68e933c15bbd"
+SRCREV = "30c1dd8da089da41cac5686a0bebacc8950a8805"
 
 SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
 
@@ -17,10 +17,13 @@ S = "${WORKDIR}/git"
 
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export CFLAGS='${TARGET_CC_ARCH}'
+	# build the release version
+	oe_runmake release
 }
 
 do_install() {
 	install -d ${D}/${bindir}
-	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
+	install -m 0755 ${S}/mem_util/Release/mem_util ${D}/${bindir}
 }
-- 
1.7.0.4


