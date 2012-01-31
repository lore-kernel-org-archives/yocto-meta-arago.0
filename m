Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DF68D52A7D
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 20:07:29 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0VK7Rav003082
	for <meta-arago@arago-project.org>; Tue, 31 Jan 2012 14:07:28 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VK7R0u025649
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2012 01:37:27 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 1 Feb 2012 01:37:27 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VK7Php025671;
	Wed, 1 Feb 2012 01:37:26 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Jan 2012 14:07:23 -0600
Message-ID: <1328040443-28869-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] am-sysinfo: add latest version from old arago
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
X-List-Received-Date: Tue, 31 Jan 2012 20:07:30 -0000
Content-Type: text/plain

* ported the latest version from the old arago overlay.
* Based on the am-sysinfo recipe from meta-texasinstruments which
  will be replaced by this recipe

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_svn.bb      |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
new file mode 100644
index 0000000..a5922dc
--- /dev/null
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "AM SysInfo"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_sysinfo/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
+
+SECTION = "system"
+
+PACKAGE_STRIP = no
+
+SRCREV = "16"
+PV = "1.0"
+PR = "r2+svnr${SRCPV}"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o oprofile_example/Debug/signal_parent oprofile_example/signal_parent.c
+    ${CC} ${CFLAGS} -DUSE_SIGNALS ${LDFLAGS} -o oprofile_example/Debug1/signal_parent.opt oprofile_example/signal_parent.c
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
+    install -m 0755 ${S}/oprofile_example/Debug/signal_parent ${D}/${bindir}
+    install -m 0755 ${S}/oprofile_example/Debug1/signal_parent.opt ${D}/${bindir}
+}
-- 
1.7.0.4


