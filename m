Return-Path: <a0756824@ares-ubuntu>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E0153529A8
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 22:52:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48MqwB2004661
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 17:52:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48Mqw8c010319
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 17:52:58 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 17:52:57 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r48Mquxl025195;	Wed, 8 May 2013 17:52:57 -0500
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1UaDEG-00080K-Cw;
	Wed, 08 May 2013 18:52:56 -0400
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 May 2013 18:52:54 -0400
Message-ID: <1368053574-30735-1-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: recipe update for external git and mpm changes
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
X-List-Received-Date: Wed, 08 May 2013 22:52:59 -0000
Content-Type: text/plain

the recipe is renamed to ti-multiprocmgr and updated to support
mpm daemon and kernel dependancies.

Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
---
 .../recipes-bsp/multiprocmgr/multiprocmgr_git.bb   |   20 ---------
 .../ti-multi-proc-manager_git.bb                   |   43 ++++++++++++++++++++
 2 files changed, 43 insertions(+), 20 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-multi-proc-manager/ti-multi-proc-manager_git.bb

diff --git a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb b/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
deleted file mode 100644
index 3f2e52c..0000000
--- a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "TI Multiproc Manager for KeyStone II"
-HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
-LICENSE = "BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
-SECTION = "console"
-COMPATIBLE_MACHINE = "keystone"
-
-PR = "r1"
-
-BRANCH ?= "master"
-SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
-
-SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
-}
diff --git a/meta-arago-extras/recipes-bsp/ti-multi-proc-manager/ti-multi-proc-manager_git.bb b/meta-arago-extras/recipes-bsp/ti-multi-proc-manager/ti-multi-proc-manager_git.bb
new file mode 100644
index 0000000..b09dfe5
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-multi-proc-manager/ti-multi-proc-manager_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "TI Multiproc Manager for KeyStone II"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-manager.git"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "libdaemon virtual/kernel"
+RDEPENDS = "syslog-ng"
+
+PR = "r6"
+
+BRANCH ?= "master"
+SRCREV = "5066b8e76d447224485fb4bf8f536c7ea2e56fa0"
+
+SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+CC += "-I${STAGING_KERNEL_DIR}/include"
+
+INITSCRIPT_NAME = "mpmsrv-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
+	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
+
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	install -d ${D}${sysconfdir}/mpm/
+	install -c -m 755 ${S}/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
+
+	install -d ${D}${includedir}/
+	install -c -m 755 ${S}/include/* ${D}${includedir}/
+
+	install -d ${D}${libdir}/
+	install -c -m 755 ${S}/lib/* ${D}${libdir}/
+}
+
-- 
1.7.9.5


