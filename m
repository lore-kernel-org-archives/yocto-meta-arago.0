Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2310452A28
	for <meta-arago@arago-project.org>;
	Thu, 12 Jul 2018 19:15:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6CJFFL7126849
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 14:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531422915;
	bh=zhoZmiD8XdJ2LRHWuOn48CMeRLD9NafaaG2BiBRLIN8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oSM26YfW7FoDod+83x81FhPNQrhNvUfJhWaa84bJmSTdIkyYwcF+LaF87eXKRnuSX
	pMn2XJf9PpSV8nV5iAFsiuNmJ3pL7L5E6eB6Bl7XP32HJ2Z5FFKadLVLUUGHmenLV4
	5COL7fK85egGgwi5XTQQhu8ThvpqyYPNoLFRhtPo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CJFFdf015358
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 14:15:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 12 Jul 2018 14:15:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 12 Jul 2018 14:15:15 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CJFDTT022560;
	Thu, 12 Jul 2018 14:15:14 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Jul 2018 15:14:51 -0400
Message-ID: <1531422891-23069-4-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531422891-23069-1-git-send-email-a0271529@ti.com>
References: <1531422891-23069-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, d-senicic1@ti.com
Subject: [ti2018.01/rocko/master] [PATCH 4/4] packagegroup-arago-tisdk-matrix: add tidl demos
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
X-List-Received-Date: Thu, 12 Jul 2018 19:15:23 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index f1c3083..fdbcd3e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r69"
+PR = "r70"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -142,6 +142,9 @@ MATRIX_APPS_append_omap-a15 = "     \
 
 MATRIX_APPS_append_dra7xx += " \
     matrix-multimedia-demo-dsp66imgproc \
+    matrix-tidl-demo-staticimg \
+    matrix-tidl-demo-pnexamples \
+    matrix-tidl-demo-livecam \
 "
 
 MATRIX_APPS_append_keystone = " \
-- 
1.9.1


