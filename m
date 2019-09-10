Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3A2A052A42
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDwEm016271
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139238;
	bh=H2wQOfwppqSNuUVsUxPPTNDu5l7MlYQiLcFVEhnn/jQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Knva1hdKDAckfJ9/k/QGg+LddqNaO+MiowI6F9N+zjMGesxJWHQ7m3Q140NfewVEV
	4ogWeMTFd+04++9LTkOm+eKn1gUzGT/2czdbWicZFvDWrav89Sv2QZNhvWvmHJB04A
	vF/7UP9N53iH47/b1BrDys/8tt1YIxhApVFGm9jM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AIDwG4051254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:58 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDuo2035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:30 -0400
Message-ID: <20190910181131.8808-9-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 8/9] packagegroup-arago-tisdk-graphics: replace chromium-wayland with chromium-ozone-wayland
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:08 -0000
Content-Type: text/plain

chromium-wayland has been renamed to chromium-ozone-wayland at the latest
meta-browser

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-graphics.bbappend | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
index ac1f1f5..288233a 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
@@ -1,10 +1,26 @@
-PR_append = ".tisdk10"
+PR_append = ".tisdk11"
 
 GRAPHICS_DEMO = ""
 GRAPHICS_DEMO_omap-a15 = "\
     kmscube \
 "
 
+GRAPHICS_WAYLAND_remove_omap-a15 = "\
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
+"
+
+GRAPHICS_WAYLAND_remove_k3 = "\
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
+"
+
+GRAPHICS_WAYLAND_append_omap-a15 = "\
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
+"
+
+GRAPHICS_WAYLAND_append_k3 = "\
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
+"
+
 GRAPHICS_RDEPENDS_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)} \
 "
-- 
2.17.1


