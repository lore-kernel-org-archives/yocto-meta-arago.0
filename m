Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 70A2E529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 15:50:01 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DFo0g1027057
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:50:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DFo0ku021869
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:50:00 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 10:50:00 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DFo0qi016064;	Mon, 13 Aug 2012 10:50:00 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T0x2W-000224-4J; Mon, 13 Aug 2012 10:58:48 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 10:58:46 -0500
Message-ID: <1344873526-7772-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2] am-sysinfo: Remove oprofile-example
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
X-List-Received-Date: Mon, 13 Aug 2012 15:50:01 -0000
Content-Type: text/plain

* The application oprofile-example has been removed from within am-sysinfo

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_svn.bb      |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
index 40daafa..78d8a97 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
@@ -7,9 +7,9 @@ SECTION = "system"
 
 PACKAGE_STRIP = "no"
 
-SRCREV = "16"
+SRCREV = "17"
 PV = "1.0"
-PR = "r3+svnr${SRCPV}"
+PR = "r4+svnr${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
@@ -17,13 +17,9 @@ S = "${WORKDIR}/trunk"
 
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
-	${CC} ${CFLAGS} ${LDFLAGS} -o oprofile_example/Debug/signal_parent oprofile_example/signal_parent.c
-	${CC} ${CFLAGS} -DUSE_SIGNALS ${LDFLAGS} -o oprofile_example/Debug1/signal_parent.opt oprofile_example/signal_parent.c
 }
 
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
-	install -m 0755 ${S}/oprofile_example/Debug/signal_parent ${D}/${bindir}
-	install -m 0755 ${S}/oprofile_example/Debug1/signal_parent.opt ${D}/${bindir}
 }
-- 
1.7.0.4


