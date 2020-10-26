Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 47DDE52999
	for <meta-arago@arago-project.org>;
	Mon, 26 Oct 2020 15:54:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09QFpngE121743
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 10:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603727509;
	bh=gSdObnYVFcC010lhrczoipS+HyMKn5ZZcXTKxsK/tOM=;
	h=From:To:CC:Subject:Date;
	b=sPMP/f46M/Fqzrt7VGyoFbu9arQoVlwCF+Crftw3J8E2slYnxuMldhSCZB3rhFS3B
	alIkyHxGC3rCGnG7tFDYHk9X5FTS3HRntlHfhy3JZ/m3FZbG0cQ1k9vC2kAz5iEbnw
	JFJX9CNnMeybly3hA9vNhIv2AC/KCJgweHuwxJTs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09QFpnrg032729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 10:51:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 26 Oct 2020 10:51:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 26 Oct 2020 10:51:49 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09QFpkCS081584;
	Mon, 26 Oct 2020 10:51:47 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <denys@ti.com>, <dmurphy@ti.com>, <aparnab@ti.com>
Date: Mon, 26 Oct 2020 21:21:24 +0530
Message-ID: <20201026155125.31513-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell PATCH 1/2] websocketd: Add new recipe
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
X-List-Received-Date: Mon, 26 Oct 2020 15:54:55 -0000
Content-Type: text/plain

websocketd is an application which allows to redirect output of
command line applications via a websocket so that web pages can
interact with them.

This is very useful for visualizing statistics information on
host machine browser.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
new file mode 100644
index 00000000..44f549ee
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Application for routing native applications via websockets"
+HOMEPAGE = "http://websocketd.com/"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
+
+PV = "0.3.0"
+SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
+SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/websocketd ${D}${bindir}/
+}
-- 
2.17.1


