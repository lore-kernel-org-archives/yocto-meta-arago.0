Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 50FA45299D
	for <meta-arago@arago-project.org>;
	Mon, 16 Oct 2017 11:02:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9GB2hYR001903
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 06:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508151763;
	bh=/VReNWKMmLrXHwdh6EvBH/VWPoysYP1m2k3n3pJb34U=;
	h=From:To:CC:Subject:Date;
	b=NQEyUGtyYynlkWNtk3VdqIdpqE2073yeVkhQfmy2YQ+aQxA2OYV4J1C9rcueCiOBa
	r6mDwTaTiVbHkJVuhGpS75zhL18q3qbL4cs1YBqto7gYoRy03qhMUlDBHGuLBGZ085
	JTmjAI2dr9tOzdz2OhewFJHIT/yvEheWCngzlT9E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GB2hb3002097
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 06:02:43 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 06:02:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 06:02:43 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GB2f9A030238;
	Mon, 16 Oct 2017 06:02:42 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Oct 2017 16:32:38 +0530
Message-ID: <1508151759-180195-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty 1/2] glsdk-util-scripts: Add the initial version of recipe
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
X-List-Received-Date: Mon, 16 Oct 2017 11:02:43 -0000
Content-Type: text/plain

From meta-arago/krogoth:
 commit 181b6019abd7f076b7a905da7cc1c5fb2d7ab32a

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../util-scripts/glsdk-util-scripts.bb             | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb

diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
new file mode 100644
index 0000000..a0ca56a
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


