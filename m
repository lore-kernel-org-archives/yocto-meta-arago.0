Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6DA4952961
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 16:23:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARGNtee011277
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 10:23:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511799835;
	bh=OyPRuLOkq2RKrkbpZapwZ59AJIrcxNdVluljQLbabyQ=;
	h=From:To:CC:Subject:Date;
	b=okg4K2B5HMVEHXlcAl5NWd935M+Vb0Atk8W1CEMXbxrKg5leNqFbE5Qzqx0bPwo5r
	HpzgvYrlxl6nGk8mqgbyeCLACT0C6GBaCaUKftWRsA4df99VsufZzY39L216z4JqUF
	MfnViXHTUUJ+xdQpHIb8T8Zg12xQl/1ZkypKifmw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARGNt2n029949
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 10:23:55 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 10:23:55 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 27 Nov 2017 10:23:55 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARGNthT021263;
	Mon, 27 Nov 2017 10:23:55 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Nov 2017 11:23:50 -0500
Message-ID: <1511799830-22879-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH] packagegroup-arago-tisdk-matrix: add audiocapture demo for AM4 and AM5
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
X-List-Received-Date: Mon, 27 Nov 2017 16:23:57 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 027cbe5..0cae08d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r67"
+PR = "r68"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -103,6 +103,7 @@ MATRIX_APPS_append_ti33x = "        \
 
 MATRIX_APPS_append_ti43x = "        \
     matrix-multimedia-demo-aac      \
+    matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h264dec  \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
@@ -122,6 +123,7 @@ MATRIX_APPS_append_ti43x = "        \
 
 MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-aac      \
+    matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h265dec  \
     matrix-hmi-demo-evse            \
                                     \
-- 
1.9.1


