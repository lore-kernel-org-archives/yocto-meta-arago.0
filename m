Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CF7EC52A4C
	for <meta-arago@arago-project.org>;
	Sun, 26 Apr 2020 17:45:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03QHglIF082930
	for <meta-arago@arago-project.org>; Sun, 26 Apr 2020 12:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587922967;
	bh=pjwlT1WHOIwQexlLs3M/ynS3oDdsTWMEEejeN1bf0l0=;
	h=From:To:CC:Subject:Date;
	b=Hp73moBAE06VHsnNQPyq7/fIC4AjmHnwxji4mVMk2pgulGU+0vLr/44qQZAQ/lpRc
	iDkf5rv/BREcL2lvvtEXoiG8Vj8V2emIEFl/2iSqSOiHQJw3ovewseGRv1yd0Vc75v
	tL6jaPJp/ea1FZqgiLucPvi2ZaPWRhf4zD7vJnkk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03QHglFF046433
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 26 Apr 2020 12:42:47 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sun, 26 Apr 2020 12:42:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sun, 26 Apr 2020 12:42:47 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03QHgjMN030294;
	Sun, 26 Apr 2020 12:42:46 -0500
From: <nikhil.nd@ti.com>
To: <denys@ti.com>
Date: Sun, 26 Apr 2020 23:12:22 +0530
Message-ID: <20200426174223.8089-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus PATCH v1 1/2] recipes-devtools: websocketd: Add new recipe for websocket app
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
X-List-Received-Date: Sun, 26 Apr 2020 17:45:08 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

websocketd is a userspace application which allows to send
data over web sockets. This is used in SDK for visualizing
statistics parameters.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 ...packagegroup-arago-tisdk-addons-sdk-target.bb |  4 +++-
 .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 26925f2f..54a59022 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -133,7 +133,9 @@ UTILS_append_dra7xx = " can-utils-dev \
                         elfutils-staticdev \
 "
 UTILS_append_k2g = " can-utils-dev"
-UTILS_append_k3 = " can-utils-dev"
+UTILS_append_k3 = " can-utils-dev \
+                    websocketd \
+"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_ti43x = "\
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


