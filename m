Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 204F352999
	for <meta-arago@arago-project.org>;
	Mon, 26 Oct 2020 15:55:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09QFq0UX121944
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 10:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603727520;
	bh=pc20uZAT49XeoGEY7opRm/pu+tyMZgAPv2BcuHN1lUQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MJ6Quznb7Tihw68ZQ526e8frnD6KXSzxS0IVYrinbqHphHs81p70nJsD+O30PDpw3
	i2Ak1xuRxZFZ59rpm3bK2VUj7hSSFXkZ/WQvIKr99IuswgQrWjpeJglNvwaKPDCSg/
	QOE7xGMzBze6Tx+8zinj6tmPoe+F30kSI9GCqA5M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09QFq0pW016653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 10:52:00 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 26 Oct 2020 10:51:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 26 Oct 2020 10:51:59 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09QFpkCT081584;
	Mon, 26 Oct 2020 10:51:58 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <denys@ti.com>, <dmurphy@ti.com>, <aparnab@ti.com>
Date: Mon, 26 Oct 2020 21:21:25 +0530
Message-ID: <20201026155125.31513-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026155125.31513-1-nikhil.nd@ti.com>
References: <20201026155125.31513-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell PATCH 2/2] statcol: New recipe for statistics collector application
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
X-List-Received-Date: Mon, 26 Oct 2020 15:55:06 -0000
Content-Type: text/plain

statcol is a statistics collector application which can be used
to get various statistics data like CPU load, DDR bandwidth,
network speed, etc from various sources.

It allows to simply dump the data over command line or it can
also be used to send to a websocket for visualization on a
host machine.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-devtools/statcol/statcol.bb       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
new file mode 100644
index 00000000..8a7c2efb
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
+EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} "
+
+do_install() {
+	DESTDIR=${D} make install
+}
-- 
2.17.1


