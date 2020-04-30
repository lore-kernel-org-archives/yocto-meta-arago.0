Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8709752A65
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2020 10:38:24 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03UAa3Ti122346
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 05:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588242963;
	bh=qYSu27Tct68histXeDjOXEkmYchybK54586EFda21hk=;
	h=From:To:CC:Subject:Date;
	b=ouNgdjZQ/z17ERHMLbfY4o1WPPwotNaVlh30nHCYeUsLQOiD/ybG+/2esle+X1uZO
	QIstx2eG7vWBYD9en6g3rYb+8wjS9t9J40qaCpRayf8e4VCYx47VsSTxKU6dgQ273e
	DLKBhfPD1KNh8NfC2az/SWqYMFe5dcNjqVbyOnLY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UAa2w7123174
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 05:36:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 30 Apr 2020 05:36:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 30 Apr 2020 05:36:02 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UAa0pf028819;
	Thu, 30 Apr 2020 05:36:00 -0500
From: <nikhil.nd@ti.com>
To: <denys@ti.com>
Date: Thu, 30 Apr 2020 16:05:57 +0530
Message-ID: <20200430103558.5797-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus PATCH v2 1/2] recipes-devtools: websocketd: Add new recipe for websocket app
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
X-List-Received-Date: Thu, 30 Apr 2020 10:38:24 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

websocketd is a userspace application which allows to send
data over web sockets. This is used in SDK for visualizing
statistics parameters.

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


