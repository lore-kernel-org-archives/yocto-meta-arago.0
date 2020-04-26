Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D051D52A4C
	for <meta-arago@arago-project.org>;
	Sun, 26 Apr 2020 17:45:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03QHgojO029503
	for <meta-arago@arago-project.org>; Sun, 26 Apr 2020 12:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587922970;
	bh=fDdh95NpWp/jTKtMI7q9i1i/QteS9s8zgG/KPg7wYgw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=suwDeLjr7F3dYg1dDLwfzcIkLn0gu7Mwgaj0j6TigEiHIdly549q5+8bzYsEOYNzW
	UW55ozXrDDYaO7YaP4Fp56Zxj5uKHjGxCO0qeZWPeKA5oBaZ14cmkZiSaAT+6B/Zia
	O1km0yP30ulEbTo/x/dBbT0C0Q8ecwPerci1iVtE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03QHgoIR046472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 26 Apr 2020 12:42:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sun, 26 Apr 2020 12:42:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sun, 26 Apr 2020 12:42:50 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03QHgjMO030294;
	Sun, 26 Apr 2020 12:42:49 -0500
From: <nikhil.nd@ti.com>
To: <denys@ti.com>
Date: Sun, 26 Apr 2020 23:12:23 +0530
Message-ID: <20200426174223.8089-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200426174223.8089-1-nikhil.nd@ti.com>
References: <20200426174223.8089-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus PATCH v1 2/2] recipes-devtools: statcol: New recipe for statistics collector
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
X-List-Received-Date: Sun, 26 Apr 2020 17:45:11 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Statistics Collector is userspace application which communicates
with remote processors to get the statistics data on target.

This can be printed command line or sent over network for
host-side visualization.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  1 +
 .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 54a59022..c6502a1f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -135,6 +135,7 @@ UTILS_append_dra7xx = " can-utils-dev \
 UTILS_append_k2g = " can-utils-dev"
 UTILS_append_k3 = " can-utils-dev \
                     websocketd \
+                    statcol \
 "
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
new file mode 100644
index 00000000..b87d940b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Statistics collector application"
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "80bac9aa2d20160197b336ab3c82ce9080091978"
+SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+DEPENDS = "rpmsg-char-helper websocketd"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${CROSS_COMPILE}"
+
+do_install() {
+	DESTDIR=${D} make install
+}
-- 
2.17.1


