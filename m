Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BC4BB52A0A
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 09:53:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9A9r8dK017752
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507629188;
	bh=hO90Gl2pHeBqb+YS5Szzf9ZI7/TG4bEHDTkSY4cO3mc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SorzxM1y/Eqai2Op4rcNYJi9vpXireM4jbZ/f1QW7bcMbRONQpCnpwuFOF/afK5bn
	n70iEMFRmIMaXoDnJrhJ4bKCaT+Gjo1s1OEjq3fvGoMa1LczxCjCiwQdYiFy6Lnx5A
	nq0oEuC1aPJS4VW8vTISYQVigFZQghf4/Twi2NUc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A9r8xg010091
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:53:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 04:53:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 04:53:08 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A9r4cZ031127;
	Tue, 10 Oct 2017 04:53:07 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Oct 2017 15:23:03 +0530
Message-ID: <1507629183-171718-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507629183-171718-1-git-send-email-a0393906@ti.com>
References: <1507629183-171718-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 2/2] packagegroup-*-graphics: Add util-scripts into the image
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
X-List-Received-Date: Tue, 10 Oct 2017 09:53:09 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb             | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 250a2f7..12331e0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r18"
 
 inherit packagegroup
 
@@ -23,7 +23,12 @@ GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-libs  \
 "
 
+GRAPHICS_DISPLAY_UTILS = "\
+    glsdk-util-scripts \
+"
+
 RDEPENDS_${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
+    ${GRAPHICS_DISPLAY_UTILS} \
 "
-- 
1.9.1


