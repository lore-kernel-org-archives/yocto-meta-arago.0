Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A9E5852960
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 18:49:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LImLUX044390
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 13:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566413301;
	bh=Vhs9zWeAVL/Sh+OMtlDQvG6LUhfWmY5VC+NjrrOTbxU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f72WdviRembXXYP5HW+F8FO9aYCOaUOFWDpv3HHeGPF/jO8SfQByTNCvehLJlvzFV
	I0c22ya0TQOKaBmPJcl483UfMxgE8rdDaPXy48NgLZR8QPglSpdT6/+tIJSTYSaACs
	MagK0ah6sp8oMS/BrSwXcw84KpL0m2Bw2Z+vKlp0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LImLIu065407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 13:48:21 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 13:48:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 13:48:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LImK3S110312;
	Wed, 21 Aug 2019 13:48:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 14:31:42 -0400
Message-ID: <1566412303-27982-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566412303-27982-1-git-send-email-j-stiffler@ti.com>
References: <1566412303-27982-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 2/3] packagegroup: addons: add jailhouse for all k3
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
X-List-Received-Date: Wed, 21 Aug 2019 18:49:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb         | 4 ++++
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 19f2bcf..ec16713 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -36,6 +36,10 @@ UTILS_append_k2g = " \
     pru-icss-src \
 "
 
+UTILS_append_k3 = " \
+    jailhouse-src \
+"
+
 UTILS_append_am65xx = " \
     pru-icss-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index eb39cad..3990dad 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -74,10 +74,11 @@ UTILS_append_k3 = " mmc-utils \
                     parted \
                     switch-config \
                     irqbalance \
+                    jailhouse \
 "
 
 UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss"
-UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
+UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.7.4


