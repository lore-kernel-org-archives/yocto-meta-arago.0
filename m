Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 4547552A70
	for <meta-arago@arago-project.org>;
	Mon, 24 May 2021 09:51:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14O9qA28047853
	for <meta-arago@arago-project.org>; Mon, 24 May 2021 04:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621849930;
	bh=XicDFBxG7dHNhNl0ioBwClOR29bND0seOJS6f4oDoWU=;
	h=From:To:CC:Subject:Date;
	b=wUQLsRETngkCUkJJT/WUAog5zv5c5FYIztl+ia6VCVizgBWIggkOI4td/XW1MzUGg
	eEWcs+ettU+1aOx9urjWSQLSa2rugluWBfYVIzgUD5SblUJhryq39SL2p+nIcVaCYJ
	ufgYiGk6qHhfJTFRKn+YO7N/jpL89xs83qjWvwdo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14O9qAnU105363
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 May 2021 04:52:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 24 May 2021 04:52:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 24 May 2021 04:52:09 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14O9q7re046308; 
	Mon, 24 May 2021 04:52:08 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Mon, 24 May 2021 15:22:03 +0530
Message-ID: <20210524095203.13658-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: shyam.jagannathan@ti.com
Subject: [dunfell/master][PATCH] packagegroups: arago-tisdk-addons: Add packages to allow building on target
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
X-List-Received-Date: Mon, 24 May 2021 09:51:34 -0000
Content-Type: text/plain

Add packages in the tisdk-addons which allows to build Gstreamer and
other GST based demo applications from the target filesystem.

All these are open source packages, recipes for which are already
present in upstream layers.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 287cba63..2c3fff5c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r79"
+PR = "r80"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -67,7 +67,14 @@ UTILS_append_k3 = " mmc-utils \
 UTILS_append_am64xx = " ti-rtos-firmware"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
-UTILS_append_j7-evm = " pru-icss"
+UTILS_append_j7-evm = " \
+    pru-icss \
+    cmake \
+    libyaml \
+    python3-pyyaml \
+    boost \
+    ninja \
+"
 UTILS_append_j7-hs-evm = " pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
2.17.1


