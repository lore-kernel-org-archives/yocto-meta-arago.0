Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5DBF252A0A
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 09:53:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9A9r6V8002709
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507629186;
	bh=38S3JbFBFm1BoI4P9Vyk/BtH830PphCNwLhayeInOSs=;
	h=From:To:CC:Subject:Date;
	b=jEmd2F1QHw9UACh8diHsaoFfWm/P+QPadAsOzISronHGFa6gfuY/xfAm+w2seaJGM
	2uNEzArig6Kex0AKO554Nf2QOjkWG17U+vVCNgpr/WhXXvTSgXANIMJ+noQgXvMMQF
	nn/KFHuxQRUNK/T49L/4UEOwZLJoYwLus2xMIi28=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A9r609009954
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:53:06 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 04:53:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 04:53:05 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A9r4cY031127;
	Tue, 10 Oct 2017 04:53:05 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Oct 2017 15:23:02 +0530
Message-ID: <1507629183-171718-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 1/2] glsdk-util-scripts: Add the initial version of recipe
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
X-List-Received-Date: Tue, 10 Oct 2017 09:53:06 -0000
Content-Type: text/plain

These are utility scripts used for debugging the VPE and DSS.
They have been in use for very critical customer debugs and
it is useful to have this shipped as part of the SDK.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../util-scripts/glsdk-util-scripts.bb             | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb

diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
new file mode 100644
index 0000000..87c4937
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Utility scripts for debug"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
+PR = "r1"
+
+COMPATIBLE_MACHINE = "omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "git://git.ti.com/glsdk/util-scripts.git"
+
+SRCREV = "ecbb9cd13e1728686a82e87e5c1b325c0e806202"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti/util-scripts 
+    install -d ${D}${datadir}/ti/util-scripts/debug
+    install -d ${D}${datadir}/ti/util-scripts/perf
+    install -m 0644 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
+    install -m 0644 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
+}
+
+FILES_${PN} += "${datadir}/ti/util-scripts/*"
+
-- 
1.9.1


