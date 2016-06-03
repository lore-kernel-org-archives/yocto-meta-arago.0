Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1872352079
	for <meta-arago@arago-project.org>;
	Fri,  3 Jun 2016 14:00:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u53E0V1K024050
	for <meta-arago@arago-project.org>; Fri, 3 Jun 2016 09:00:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u53E0bpD025164
	for <meta-arago@arago-project.org>; Fri, 3 Jun 2016 09:00:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Jun 2016 09:00:37 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u53E0ZvP031378;
	Fri, 3 Jun 2016 09:00:36 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Jun 2016 19:30:00 +0530
Message-ID: <1464962401-25784-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] glsdk-example-apps: Add utils and scripts for performance visualization
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
X-List-Received-Date: Fri, 03 Jun 2016 14:00:38 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index b4efe08..07d702b 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -11,7 +11,23 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
-SRCREV = "be2b7c64661043e0997f5797a6c87ef7e9f542ee"
+SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
+	 "
 
-PR = "r13"
+SRCREV = "4dcbca6bf486b0331781014c463225e927e1f464"
+
+PR = "r40"
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/glsdkstatcoll
+    install -m 0644 ${S}/bandwidth-tool/config.ini ${D}${sysconfdir}/glsdkstatcoll/.
+    install -m 0644 ${S}/bandwidth-tool/initiators.cfg ${D}${sysconfdir}/glsdkstatcoll/.
+
+    install -d ${D}${sysconfdir}/visualization_scripts
+    install -m 0644 ${S}/cpuload-plugins/scripts/*.sh  ${D}${sysconfdir}/visualization_scripts/.
+    install -m 0644 ${S}/cpuload-plugins/scripts/*.cfg ${D}${sysconfdir}/visualization_scripts/.
+}
+
+FILES_${PN} += "${sysconfdir}/glsdkstatcoll/* ${sysconfdir}/visualization_scripts/*"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.9.1


