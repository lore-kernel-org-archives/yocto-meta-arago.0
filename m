Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 31E0052A77
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 01:52:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s251qRVD028393
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 19:52:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s251qRBJ027058
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 19:52:27 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 19:52:27 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s251qQHu008822;	Tue, 4 Mar 2014 19:52:27 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 20:52:25 -0500
Message-ID: <1393984345-21356-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-libp11: Recipe for PKSC11 abstraction library
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
X-List-Received-Date: Wed, 05 Mar 2014 01:52:28 -0000
Content-Type: text/plain

- Provides PKCS11 abstraction. Used by Open SSL PKSC11 engine

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-bsp/ti-libp11/ti-libp11_git.bb         |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-libp11/ti-libp11_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-libp11/ti-libp11_git.bb b/meta-arago-extras/recipes-bsp/ti-libp11/ti-libp11_git.bb
new file mode 100644
index 0000000..42336f5
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-libp11/ti-libp11_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "PKCS11 abstraction library"
+LICENSE = "LGPL2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
+SECTION = "libs"
+PRIORITY = "optional"
+PROVIDES = "libp11"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libtool"
+RDEPENDS_${PN} = "ti-securestore"
+
+PV = "2.0.0"
+PR = "r0"
+BRANCH="master"
+# Following commit corresponds to DEV.SC-MCSDK-02.00.01.15
+SRCREV = "a7583ecf639daab533859c6129243a313ee7bceb"
+
+SRC_URI = "git://arago-project.org/git/projects/libp11.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}/lib*.so*"
-- 
1.7.9.5


