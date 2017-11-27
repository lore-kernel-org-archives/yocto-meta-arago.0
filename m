Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id AE12C52986
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 23:33:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARNXRkD014785
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:33:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511825607;
	bh=o1OuKZgnQoeE5d71vvZInjOy/HSDYziBz257A9PJv10=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RjsH0oZdsCzkU+cRuAuLXvV7n1LRMkh7F2zPJXo3NgKHyBdqUPBOCJve6JdYSzUpS
	ohHB4qxH2xHvZgcLhbe+6Ldgl7Z5G+zK06YVruJn/26eq+nBTrP0ixdcJ6y3KiwCTX
	0RCd7tBnzKZiQzIfx5/MSDmrr4aALCKYHPzMcviA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARNXRpD019161
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:33:27 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 17:33:27 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 27 Nov 2017 17:33:27 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARNXMTv002011;
	Mon, 27 Nov 2017 17:33:26 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Nov 2017 18:33:16 -0500
Message-ID: <1511825598-8552-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511825598-8552-1-git-send-email-a0271529@ti.com>
References: <1511825598-8552-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 1/3] packagegroup-arago-tisdk-addons*: add cmem and cmem-mod for AM4
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
X-List-Received-Date: Mon, 27 Nov 2017 23:33:28 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 5fb877b..2175501 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r31"
+PR = "r32"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -51,6 +51,7 @@ EXTRA_LIBS_append_ti33x = " \
 "
 
 EXTRA_LIBS_append_ti43x = " \
+    cmem-mod-src \
     uio-module-drv-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 387d39e..21beca4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r37"
+PR = "r38"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -127,6 +127,10 @@ UTILS_append_dra7xx = " can-utils-dev \
 UTILS_append_k2g = " can-utils-dev"
 
 EXTRA_LIBS = ""
+EXTRA_LIBS_append_ti43x = "\
+    cmem-dev \
+    cmem-staticdev \
+"
 EXTRA_LIBS_append_omap-a15 = " cmem-dev"
 EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a3944bc..31ff258 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r65"
+PR = "r66"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -107,6 +107,7 @@ EXTRA_LIBS_append_keystone = " \
 "
 
 EXTRA_LIBS_append_ti43x = " \
+    cmem \
     uio-module-drv \
 "
 
-- 
1.9.1


