Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BE30052A77
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 01:53:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s251r3mF018586
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 19:53:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s251r29x006184
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 19:53:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 19:53:02 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s251r288026961;	Tue, 4 Mar 2014 19:53:02 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 20:53:01 -0500
Message-ID: <1393984381-21395-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-engine-pkcs: Recipe for ti open ssl PKSC11 engine
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
X-List-Received-Date: Wed, 05 Mar 2014 01:53:04 -0000
Content-Type: text/plain

- Provides OpenSSL PKSC11 engine implementation to access
  PKCS#11 token

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../ti-engine-pkcs/ti-engine-pkcs_git.bb           |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-engine-pkcs/ti-engine-pkcs_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-engine-pkcs/ti-engine-pkcs_git.bb b/meta-arago-extras/recipes-bsp/ti-engine-pkcs/ti-engine-pkcs_git.bb
new file mode 100644
index 0000000..41625c3
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-engine-pkcs/ti-engine-pkcs_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "OpenSSL PKCS11 engine"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=471dacb7f0586e35729f422b8098585f"
+SECTION = "libs"
+PRIORITY = "optional"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libtool libp11"
+
+PV = "2.0.2"
+PR = "r0"
+BRANCH="master"
+# Commit corresponds to DEV.SC-MCSDK-02.00.02.16P1.1
+SRCREV = "a0bab66a2731f077e3b1e3e91315f6467a5a848e"
+
+SRC_URI = "git://arago-project.org/git/projects/engine-pkcs11.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}/engines/*.so*"
+FILES_${PN}-dbg += "${libdir}/engines/.debug"
-- 
1.7.9.5


