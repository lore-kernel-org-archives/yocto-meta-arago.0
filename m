Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D72BD529F2
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 20:44:29 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7TKiTa7001305
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 15:44:29 -0500
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TKiT7v009420
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 15:44:29 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 15:44:28 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7TKiSc1001945;	Wed, 29 Aug 2012 15:44:28 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6pM7-00089S-8t; Wed, 29 Aug 2012 15:59:19 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 15:59:15 -0500
Message-ID: <1346273955-31300-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] recipes: Convert from svn to git
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
X-List-Received-Date: Wed, 29 Aug 2012 20:44:30 -0000
Content-Type: text/plain

* Converting svn repository to git.
* Primary reason was the fact that gforge required https to be used when
  checking out files from svn repositories. This issue is discussed here:
  http://bugs.openembedded.net/show_bug.cgi?id=2501

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |   10 ++++---
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |   26 ++++++++++++++++++++
 .../recipes-core/am-sysinfo/am-sysinfo_svn.bb      |   25 -------------------
 3 files changed, 32 insertions(+), 29 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
 delete mode 100644 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index e1f700e..9fda6b0 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,12 +4,14 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-SRCREV = "76"
-PR = "r1+svnr${SRCPV}"
+PR = "r2"
 
-SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;protocol=https;user=anonymous;pswd=''"
+BRANCH ?= "master"
+SRCREV = "e9fbf7990e93d97e7471e509626969d244cca214"
 
-S = "${WORKDIR}/trunk"
+SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
 
 do_compile() {
 	export CROSS_COMPILE=${TARGET_PREFIX}
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
new file mode 100644
index 0000000..2ec4e92
--- /dev/null
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "AM SysInfo"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_sysinfo/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
+
+SECTION = "system"
+
+PACKAGE_STRIP = "no"
+PR = "r5"
+
+BRANCH ?= "master"
+SRCREV = "f2b325741ebcd440c4b2fc91a65270391224426e"
+
+SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
+}
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
deleted file mode 100644
index 78d8a97..0000000
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "AM SysInfo"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_sysinfo/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
-
-SECTION = "system"
-
-PACKAGE_STRIP = "no"
-
-SRCREV = "17"
-PV = "1.0"
-PR = "r4+svnr${SRCPV}"
-
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-S = "${WORKDIR}/trunk"
-
-do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
-}
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
-}
-- 
1.7.0.4


