Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5694252A77
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 01:52:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s251q0Pn001888
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 19:52:00 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s251q0d6005606
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 19:52:00 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 19:52:00 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s251pxgV002158;	Tue, 4 Mar 2014 19:52:00 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 20:51:58 -0500
Message-ID: <1393984318-21315-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-securestore: Add recipe for TI secure storage
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
X-List-Received-Date: Wed, 05 Mar 2014 01:52:01 -0000
Content-Type: text/plain

- Provides implementation of a software token

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../ti-securestore/ti-securestore_git.bb           |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-securestore/ti-securestore_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-securestore/ti-securestore_git.bb b/meta-arago-extras/recipes-bsp/ti-securestore/ti-securestore_git.bb
new file mode 100644
index 0000000..503c285
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-securestore/ti-securestore_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "TI Secure storage package"
+LICENSE = "BSD-2-Clause | TI-BSD | Others"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ae4a61a55568199da668231022a684f9"
+SECTION = "libs"
+PRIORITY = "optional"
+
+mntdir = "/mnt"
+
+inherit autotools pkgconfig
+
+DEPENDS_${PN} = "openssl libdaemon"
+
+PV = "2.0.2"
+PR = "r0"
+BRANCH="master"
+#Following commit corresponds to tag DEV.MCSDK-03.00.04.18
+SRCREV = "d71b45b2cf5df075bf2257d01f74b99e18e0e5e2"
+
+SRC_URI = "git://arago-project.org/git/projects/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+INITSCRIPT_NAME = "softhsm-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+FILES_${PN}-dev += "${libdir}/softhsm/*.la"
+FILES_${PN} += "${libdir}/softhsm/*{SOLIBSDEV}"
+FILES_${PN} += "${libdir}/softhsm/lib*${SOLIBS} ${mntdir}/*"
+FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
+FILES_${PN}-static += "${libdir}/softhsm/*.a"
+
+do_install_append() {
+	install -d ${D}${mntdir}/securedbv0
+	install -d ${D}${mntdir}/securedbv1
+
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/src/bin/daemon/softhsm-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
-- 
1.7.9.5


