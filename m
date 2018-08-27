Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 15312529D5
	for <meta-arago@arago-project.org>;
	Mon, 27 Aug 2018 15:38:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7RFceaB049550
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2018 10:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535384320;
	bh=CuX0em4QMqT6IMvFoAAJde7uEFFx1NWoRPbkKfyKVKU=;
	h=From:To:CC:Subject:Date;
	b=spnce2DbXu53+y/QrLFmF3UA0hAzArk98qAvnHQ1fdD3QL8q3qwJD4SGhGMAPCHta
	2nMUMp7w8eTDb479YookPekTVLsuFAFYk5I8QJjSXR6WF+675edwu/xZT4YyfUbnTB
	Mn1uB6PWcRYCE3K4zdW8AWtABUpVlIu0JtMRYC8k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RFceqU025074
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2018 10:38:40 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 27 Aug 2018 10:38:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 27 Aug 2018 10:38:39 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RFcdV2010687;
	Mon, 27 Aug 2018 10:38:39 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Aug 2018 11:38:33 -0400
Message-ID: <1535384313-25724-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] stb: C/C++ libraries used to build armnn test examples.
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
X-List-Received-Date: Mon, 27 Aug 2018 15:38:48 -0000
Content-Type: text/plain

Signed-off-by: Qin Su <qsu@ti.com>
---
 meta-arago-extras/recipes-support/stb/stb.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/stb/stb.bb

diff --git a/meta-arago-extras/recipes-support/stb/stb.bb b/meta-arago-extras/recipes-support/stb/stb.bb
new file mode 100644
index 0000000..bc3f7bf
--- /dev/null
+++ b/meta-arago-extras/recipes-support/stb/stb.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "single-file public domain (or MIT licensed) libraries for C/C++"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.md;md5=42144ce827adcfa5170032f0ea03c227"
+
+SRCREV = "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = " \
+    git://github.com/nothings/stb.git \
+"
+do_install() {
+    install -d ${D}${includedir}
+    cp -r ${S}/*.h ${D}${includedir}
+}
+
+PACKAGES =+ "${PN}-bash-completion"
+FILES_${PN}-bash-completion += "${bindir}/stb_completions.sh"
+RDEPENDS_${PN}-bash-completion = "bash bash-completion"
+
-- 
1.9.1


