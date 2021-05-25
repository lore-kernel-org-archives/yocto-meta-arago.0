Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id EC8D552AA5
	for <meta-arago@arago-project.org>;
	Tue, 25 May 2021 13:19:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PDJpvd107468
	for <meta-arago@arago-project.org>; Tue, 25 May 2021 08:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621948791;
	bh=uM6g/YtoS/TY9xOw45GSdXy/jLkmBmgiEGbbD+spaUc=;
	h=From:To:CC:Subject:Date;
	b=c1uNVUulCnFHw09a5o2SzZx95bbqxCgnUj/3Xr62iuUpkpUeafDVXLGzwrKSsIwtZ
	AlIKT++YRXnbJLK1JaddBL088h4+SS9UYZmE9+vYOgeoin27w8L3/fFI5mIW36hfHT
	lze32C8/JqQIcLwwT6RV4wh7HNO8u1jw7NdjpoqQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PDJpl4101893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 May 2021 08:19:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 25 May 2021 08:19:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 25 May 2021 08:19:51 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PDJmeg005495; 
	Tue, 25 May 2021 08:19:49 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Tue, 25 May 2021 18:49:43 +0530
Message-ID: <20210525131943.17412-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: shyam.jagannathan@ti.com
Subject: [dunfell/master][PATCH v2] packagegroups: arago-tisdk-addons: Add packages to allow building on target
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
X-List-Received-Date: Tue, 25 May 2021 13:19:15 -0000
Content-Type: text/plain

Add packages in the tisdk-addons which allows to build Gstreamer and
other GST based demo applications from the target filesystem.

All these are open source packages, recipes for which are already
present in upstream layers.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    changes from v1:
    * Add meson in the list

 .../packagegroups/packagegroup-arago-tisdk-addons.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 287cba63..a4d65781 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r79"
+PR = "r80"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -67,7 +67,15 @@ UTILS_append_k3 = " mmc-utils \
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
+    meson \
+"
 UTILS_append_j7-hs-evm = " pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
2.17.1


