Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 111605299A
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 06:50:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8A6n4Ou009847
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 01:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568098144;
	bh=rIQI/iMK/pyUWWGaT5WGfBoSUd0yuRPzpipN0tygwMs=;
	h=From:To:CC:Subject:Date;
	b=BHcUP3iHvnQD/I0R2kqdpKuprtaa1X+9B/eziQkl9GyqGP5XbJv7eaOqZWBbUxCjS
	PMen/K54JmpFTtzGtd2yyPCtdv3q4DaO8eg1nXX+AlERD71GT2UWWq6KLG/8zl0Gg6
	C2gxry24ocXc69EFU8GdJXNHGX1Ph3NcmRCT4KOg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8A6n4N3112747
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 01:49:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 01:49:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 01:49:04 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8A6n2bv046308; 
	Tue, 10 Sep 2019 01:49:03 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 10 Sep 2019 12:18:58 +0530
Message-ID: <1568098140-193923-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud PATCH v2 1/3] packagegroup: Move ti-sci-src to arago-tisdk-addons-sdk-host
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
X-List-Received-Date: Tue, 10 Sep 2019 06:50:10 -0000
Content-Type: text/plain

packagegroup-arago-tisdk-addons-sdk-host is for adding sources for components
packagegroup-arago-tisdk-amsdk-sdk-host is for adding scripts

Move the ti-sci-src packge from amsdk-sdk-host to addons-sdk-host

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Changes from v1:
* Update commit message

 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb           | 1 +
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb            | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index ec16713..fbdc735 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -38,6 +38,7 @@ UTILS_append_k2g = " \
 
 UTILS_append_k3 = " \
     jailhouse-src \
+    ti-sci-fw-src \
 "
 
 UTILS_append_am65xx = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index b73c63b..ebe129b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -21,7 +21,7 @@ BOOT_MONITOR_keystone = "boot-monitor-src"
 EXTRA_FILES = ""
 EXTRA_FILES_ti43x = "tisdk-uenv"
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES_k3 = "tisdk-readme tisdk-uenv ti-sci-fw-src"
+EXTRA_FILES_k3 = "tisdk-readme tisdk-uenv"
 
 RDEPENDS_${PN} = "\
     ti-tisdk-setup \
-- 
1.9.1


