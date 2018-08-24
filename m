Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2D661529BF
	for <meta-arago@arago-project.org>;
	Fri, 24 Aug 2018 19:37:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OJbakh066153
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535139456;
	bh=uzGtV2Cub8Ha9oprqlPwc3dWi8xSah4zwP63En8rFOg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kaP9kJTh4LzwxP2/ZLSNlnAQIiT/18J4sXQkzQnAFOMEvmnJL0ml/NQPKlxBcMaxU
	21AozLW4nbltpDsGm9NjtdiImMOnW20FwlC44Igt5bfaXMgeF4WgcvMU135WkespB0
	sEh+3uToR9UJkEHJMmG46G20J591hDDFLtTKbooI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbabJ005980
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 14:37:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 14:37:35 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbZ0r004368;
	Fri, 24 Aug 2018 14:37:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Aug 2018 15:25:17 -0400
Message-ID: <1535138718-6772-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
References: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/4] ti-tisdk-makefile: k3: add missing targets
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
X-List-Received-Date: Fri, 24 Aug 2018 19:37:45 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 75a9392..6932616 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r87"
+PR = "r88"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -59,7 +59,6 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 
 MAKEFILES_MATRIX_GUI_keystone = ""
 MAKEFILES_MATRIX_GUI_omapl138 = ""
-MAKEFILES_MATRIX_GUI_k3 = ""
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -165,6 +164,9 @@ MAKEFILES_append_k2e = " opencl-examples \
 
 MAKEFILES_append_k3 = " u-boot-spl \
                         linux-dtbs \
+                        barcode-roi \
+                        cryptodev \
+                        ti-sgx-ddk-km \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.7.4


