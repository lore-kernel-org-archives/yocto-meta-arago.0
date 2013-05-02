Return-Path: <a0221004@ares-ubuntu>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E743352A47
	for <meta-arago@arago-project.org>;
	Thu,  2 May 2013 18:36:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42IaP09020306
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 13:36:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42IaPXK032458
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 13:36:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 13:36:25 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r42IaPRe010898;	Thu, 2 May 2013 13:36:25 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UXyMj-00082x-7z;
	Thu, 02 May 2013 14:36:25 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 May 2013 14:36:22 -0400
Message-ID: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: zhoujt@ti.com
Subject: [PATCH] added mounting debugfs recipe
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
X-List-Received-Date: Thu, 02 May 2013 18:36:27 -0000
Content-Type: text/plain

From: Jingting Zhou <a0221004@ares-ubuntu>

---
 .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
 .../initscript-debugfs/files/debugfs.sh            |    8 ++++++++
 .../initscript-debugfs/initscript-debugfs.bb       |   17 +++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100755 meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
 create mode 100755 meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 46db7c2..ba618b2 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -66,7 +66,7 @@ RDEPENDS_${PN} = "\
     ptpd \
     vsftpd \
     syslog-ng \	
-	syslog-ng-plugins \
+    syslog-ng-plugins \
     dtc \
     strongswan \ 
     strongswan-plugins \ 
@@ -95,4 +95,5 @@ RDEPENDS_${PN} = "\
     ti-netapi \
     ti-ipc \
     ebtables \
+    initscript-debugfs \
 	"
diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
new file mode 100755
index 0000000..17e2474
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+if ! [ -e /debug ] ; then
+  mkdir -p /debug
+fi
+mount -t debugfs debugfs /debug
+
+exit 0
diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb
new file mode 100755
index 0000000..c9cb7d0
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Initscripts for debugfs"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://debugfs.sh;md5=ecbae24c97c0fa80c5977bf22eec1f32"
+
+PR ="r1"
+
+SRC_URI = "file://debugfs.sh"
+
+S = "${WORKDIR}"
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d/
+	install -d ${D}${sysconfdir}/rcS.d/
+	install -c -m 755 ${WORKDIR}/debugfs.sh ${D}${sysconfdir}/init.d/debugfs.sh
+	ln -sf ../init.d/debugfs.sh ${D}${sysconfdir}/rcS.d/S09debugfs
+}
-- 
1.7.9.5


