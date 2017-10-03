Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6D7C352A33
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsJ7u012300
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046059;
	bh=OB07wTaMNdnAfjDRPhKJa62j3+DmYVI0R7AVuc+WayQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xJ89xxM3YV0TOCZL/4xfdVR/OyZPRn1L+SNLOBkIdVqzVoEU2Kub0Bvsi2xueXSCF
	gcPPjbDXj08a8vm7s5QdjfxKDcl2G7m2gNlqhLOetOYL1D+k0jYGPQATLYDrbYISPq
	nHjUNumw5eLoO0NO1Ay1uSDn73/4OOjnS28lrV/A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsJNa013512
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:18 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSF013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:06 -0400
Message-ID: <1507046051-57949-19-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 18/23] packagegroup-arago-tisdk-graphics: add X11 build support
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:20 -0000
Content-Type: text/plain

- select sgx ddk package based on MACHINE_FEATURES(xsgx vs. sgx)
- include kmscube demo for non-X11 build only
- remove redundant GC320 stuff

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-graphics.bbappend      | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
index 68f0040..43f6211 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
@@ -1,22 +1,19 @@
-PR_append = ".tisdk7"
+PR_append = ".tisdk8"
 
 GRAPHICS_DEMO = ""
 GRAPHICS_DEMO_omap-a15 = "\
-    kmscube \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', 'kmscube', d)} \
 "
 
-GRAPHICS_GC320_RDEPENDS = "\
-    ti-gc320-driver \
-    ti-gc320-libs \
-    ti-gc320-tests \
+GRAPHICS_RDEPENDS_append = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-um', '', d)} \
 "
-
-GRAPHICS_RDEPENDS_append_omap-a15 = " ${GRAPHICS_GC320_RDEPENDS}"
-
-GRAPHICS_RDEPENDS_remove_ti33x = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
+GRAPHICS_RDEPENDS_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-sgx-ddk-km', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-sgx-ddk-um', '', d)} \
 "
-GRAPHICS_RDEPENDS_remove_ti43x = "\
+GRAPHICS_RDEPENDS_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
 "
 
-- 
1.9.1


