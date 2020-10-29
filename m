Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 20BB9520EA
	for <meta-arago@arago-project.org>;
	Thu, 29 Oct 2020 19:39:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TJaSkk092669
	for <meta-arago@arago-project.org>; Thu, 29 Oct 2020 14:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604000188;
	bh=IsB1OadhwOJ+/quOYQEEbuEXsr9ndXNllB6Xtjl2cak=;
	h=From:To:CC:Subject:Date;
	b=duU2no5D5EcBInZOPWtGsJ3li5nTMWOuUHb9sNSaPGm1XIDcBpRzYDZ+GENIZZk+o
	w/hd6yB54sonHo8wlegReVMSEAl+O6F9csyylp+G5luYjuCFTGMdCvrJDb95w7+z/J
	TF8pNIoZsnAQceXBFOH4Gavf/P7klg9tOmXV7ZTo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TJaSnR029107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Oct 2020 14:36:28 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 29 Oct 2020 14:36:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 29 Oct 2020 14:36:27 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TJaPKv038544;
	Thu, 29 Oct 2020 14:36:26 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <denys@ti.com>, <dmurphy@ti.com>, <aparnab@ti.com>
Date: Fri, 30 Oct 2020 01:06:21 +0530
Message-ID: <20201029193621.26512-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell PATCH v2] statcol: New recipe for statistics collector application
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
X-List-Received-Date: Thu, 29 Oct 2020 19:39:35 -0000
Content-Type: text/plain

statcol is a statistics collector application which can be used
to get various statistics data like CPU load, DDR bandwidth,
network speed, etc from various sources.

It allows to simply dump the data over command line or it can
also be used to send to a websocket for visualization on a
host machine.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    v2: Add CROSS_COMPILE to fix build issues on armv7

 .../recipes-devtools/statcol/statcol.bb       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
new file mode 100644
index 00000000..bb841d08
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Statistics collector application"
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "6420b4e6d98dc2c6825557d7d6f56ffd52fd230c"
+SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+DEPENDS = "ti-rpmsg-char websocketd"
+RDEPENDS_${PN} = "bash"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${TARGET_PREFIX}"
+
+do_install() {
+	DESTDIR=${D} make install
+}
-- 
2.17.1


