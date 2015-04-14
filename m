Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E52BC5298F
	for <meta-arago@arago-project.org>;
	Tue, 14 Apr 2015 11:39:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3EBdvPW003692
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 06:39:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EBdunv003981
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 06:39:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 06:39:55 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EBdtlZ003029;
	Tue, 14 Apr 2015 06:39:55 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YhzC7-0003Wk-DQ;
	Tue, 14 Apr 2015 07:39:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Apr 2015 07:39:54 -0400
Message-ID: <1429011594-13528-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libloki: Add recipe for version 0.1.7
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
X-List-Received-Date: Tue, 14 Apr 2015 11:39:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-support/loki/libloki_0.1.7.bb          |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb

diff --git a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
new file mode 100644
index 0000000..2d48561
--- /dev/null
+++ b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Loki C++ Library"
+HOMEPAGE = "http://sourceforge.net/projects/loki-lib/"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://README;md5=5f7c1a2bebe34fc290234984d5845b03"
+
+SRC_URI="http://libloki.sourcearchive.com/downloads/${PV}-3/${PN}_${PV}.orig.tar.gz;name=libloki"
+
+SRC_URI[libloki.md5sum] = "af532c24a7f2e12d0829be8201934d92"
+SRC_URI[libloki.sha256sum] = "0c2094ce916b106731c8be61c32f538a22e1c0f8398bd5d6295b13d08e0c41a3"
+
+S = "${WORKDIR}/${PN}-${PV}.orig"
+
+do_configure () {
+    sed -i -e 's|^prefix.*$|prefix := ${D}${prefix}|g' ${S}/Makefile.common
+}
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    oe_runmake install
+}
-- 
1.7.9.5


