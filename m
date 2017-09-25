Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C1AC852A0C
	for <meta-arago@arago-project.org>;
	Mon, 25 Sep 2017 19:02:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8PJ2vQ9008539
	for <meta-arago@arago-project.org>; Mon, 25 Sep 2017 14:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506366177;
	bh=FfEGd9Y612Hh7X83QyANl80N98n6db07KxxtDlmMyJc=;
	h=From:To:CC:Subject:Date;
	b=saQvBac8yoF2T3ymfcfGcHshpXwciW+B+voZCDq6RIlVGoUO/oWH2w+x/qF6h7yXC
	XtGUUKHlUMDTtNs2rILEkwO9TzEDZPPuIX2Ar0mwRCRyWoWiNKpZRMQ20MvTPVEnyJ
	bxM3CgCrXZx2EMRiewQLIKZd4eU3mNdhvT9rSiBM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PJ2vEN020680
	for <meta-arago@arago-project.org>; Mon, 25 Sep 2017 14:02:57 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 25 Sep 2017 14:02:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 25 Sep 2017 14:02:57 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PJ2vWX011340;
	Mon, 25 Sep 2017 14:02:57 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Sep 2017 15:02:52 -0400
Message-ID: <1506366173-17907-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 1/2] ccief-basic: add CCLINK IEF Basic for Linux
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
X-List-Received-Date: Mon, 25 Sep 2017 19:02:58 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-support/cclink/ccief-basic_git.bb      | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb

diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
new file mode 100644
index 0000000..41332fa
--- /dev/null
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "CC-Link Industrial Ethernet Field Basic Master and Slave Implementation"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://CCIEF-BASIC_Master/library/include/SLMP.h;beginline=1;endline=34;md5=9bcca1b46fb3c83966c242e5afa3c352"
+
+PV = "1.0"
+PR = "r0"
+
+CCIEF-BASIC_GIT_URI = "git://git.ti.com/processor-sdk/cclink.git"
+CCIEF-BASIC_GIT_PROTOCOL = "git"
+CCIEF-BASIC_GIT_BRANCH = "master"
+
+CCIEF-BASIC_SRCREV = "8b4f9aea6550ff563d21ff3979aa6e7cdc708998"
+
+BRANCH = "${CCIEF-BASIC_GIT_BRANCH}"
+SRC_URI = "${CCIEF-BASIC_GIT_URI};protocol=${CCIEF-BASIC_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${CCIEF-BASIC_SRCREV}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+# build Master sample application
+    cd ${S}/CCIEF-BASIC_Master/build/linux
+    oe_runmake
+# build Slave sample application
+    cd ${S}/CCIEF-BASIC_Slave/build/linux
+    oe_runmake
+}
+
+do_install() {
+# install CCIEF BASIC binaries
+    install -d ${D}${bindir}
+    install -m 755 ${S}/CCIEF-BASIC_Master/build/linux/Master_sample ${D}${bindir}
+    install -m 755 ${S}/CCIEF-BASIC_Slave/build/linux/Slave_sample ${D}${bindir}
+
+# install CCIEF BASIC configuration files
+    install -d ${D}${datadir}/cclink
+    install -m 644 ${S}/CCIEF-BASIC_Master/sample/MasterParameter.csv ${D}${datadir}/cclink
+    install -m 644 ${S}/CCIEF-BASIC_Slave/sample/SlaveParameter.csv ${D}${datadir}/cclink
+}
+
+FILES_${PN} += "${datadir}/cclink"
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
1.9.1


