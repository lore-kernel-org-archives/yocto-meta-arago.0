Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 274AC52A34
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINaL2007558
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709416;
	bh=OB07wTaMNdnAfjDRPhKJa62j3+DmYVI0R7AVuc+WayQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Dgfgr4eWIIbrqa8lqf/CMJ6pSsOaBtu9ckglCksWPHu2jPwKPgeRSBZpyTkOfUliR
	M8uMO/CINRJor1XbBg8LLV/B4GHLzmiYgQFamRg7jGVuaClj05KHLkmVAB2bUYsvuc
	7JQ0Nkokn13cHZowl6ZT5muZXuPx5dpGjFu60P40=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINaAx010437
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:36 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8h006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:22 -0400
Message-ID: <1506709407-16448-19-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 18/ packagegroup-arago-tisdk-graphics: add X11 build support
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:42 -0000
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


