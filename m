Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A5B7E529E3
	for <meta-arago@arago-project.org>;
	Sun,  1 Feb 2015 02:46:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t112kGLk024235
	for <meta-arago@arago-project.org>; Sat, 31 Jan 2015 20:46:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t112kFS2008166
	for <meta-arago@arago-project.org>; Sat, 31 Jan 2015 20:46:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 31 Jan 2015 20:46:15 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t112kDrk020485;	Sat, 31 Jan 2015 20:46:15 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 31 Jan 2015 21:46:11 -0500
Message-ID: <1422758771-21253-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422758771-21253-1-git-send-email-sam.nelson@ti.com>
References: <1422758771-21253-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] libnl-xfrm: Add recipe for libnl-xfrm
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
X-List-Received-Date: Sun, 01 Feb 2015 02:46:18 -0000
Content-Type: text/plain

- Provides libnl extension for XFRM support

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-support/libnl-xfrm/libnl-xfrm_git.bb   |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb

diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
new file mode 100644
index 0000000..74733f0
--- /dev/null
+++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Libnl extension for XFRM support"
+PROVIDES = "libnl-xfrm"
+SECTION = "net"
+LICENSE = "BSD-3-Clause"
+
+COMPATIBLE_MACHINE = "keystone"
+
+LIC_FILES_CHKSUM = "file://include/xfrm_pvt.h;beginline=1;endline=33;md5=fe068af290f274f2a86a867bbd7cc61c"
+
+DEPENDS = "libnl"
+
+BRANCH="hawking_dev"
+# The following commit correspond to DEV.LIBNL-XFRM.03.01.00.00A
+SRCREV = "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
+SRC_URI = "git://arago-project.org/git/projects/libnl-xfrm.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+LIBNL_XFRM_LIB = "lib/libnl-xfrm.a"
+
+CFLAGS += "-I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -fPIC -DPIC "
+
+do_compile() {
+	mkdir -p ${S}/lib
+	make clean
+	make all
+}
+
+do_install_append() {
+	install -d ${D}${libdir}/
+	install -d ${D}${includedir}/
+	install -d ${D}${includedir}/libnl3/netlink/
+	install -d ${D}${includedir}/libnl3/netlink/xfrm/
+	install -c -m 755 ${S}/${LIBNL_XFRM_LIB} ${D}${libdir}/
+	install -c -m 755 ${S}/include/netlink/xfrm/*.h ${D}${includedir}/libnl3/netlink/xfrm/
+	install -c -m 755 ${S}/lib/libnl-xfrm.so ${D}${libdir}/libnl-xfrm.so.1.0.0
+	cd ${D}${libdir}/
+	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so.1
+	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so
+}
-- 
1.7.9.5


