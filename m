Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 11BFE529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 15:48:23 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DFmNK4025017
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:48:23 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DFmNkV020251
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:48:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 10:48:22 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DFmM69015032;	Mon, 13 Aug 2012 10:48:22 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T0x0v-000216-UA; Mon, 13 Aug 2012 10:57:09 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 10:57:06 -0500
Message-ID: <1344873428-7710-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] oprofile-example: Create oprofile-example application
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
X-List-Received-Date: Mon, 13 Aug 2012 15:48:25 -0000
Content-Type: text/plain

* This application was split from am-sysinfo.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../oprofile-example/oprofile-example_git.bb       |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb

diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
new file mode 100644
index 0000000..79278fb
--- /dev/null
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "OProfile Example"
+HOMEPAGE = "https://gitorious.org/oprofile-example"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://signal_parent.c;beginline=1;endline=37;md5=3c72149bb458105db5d2e6fbcb2da66e"
+
+SECTION = "system"
+
+PACKAGE_STRIP = "no"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "875147fcaf0706f91b1bcbf9d80821de78257955"
+
+SRC_URI = "git://gitorious.org/oprofile-example/oprofile-example.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    install -d  ${S}/Debug
+    install -d  ${S}/Debug1
+	${CC} ${CFLAGS} ${LDFLAGS} -o Debug/signal_parent signal_parent.c
+	${CC} ${CFLAGS} -DUSE_SIGNALS ${LDFLAGS} -o Debug1/signal_parent.opt signal_parent.c
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/Debug/signal_parent ${D}/${bindir}
+	install -m 0755 ${S}/Debug1/signal_parent.opt ${D}/${bindir}
+}
-- 
1.7.0.4


