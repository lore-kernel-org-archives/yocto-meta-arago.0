Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 699AC529AC
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 18:38:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9CIcMvP018427
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 13:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507833502;
	bh=d9E0HDSREru5k+YQ/3j99PkQ5MF/Sit/VCX5QBIbIfE=;
	h=From:To:Subject:Date;
	b=VjJ5/MAXC6cUAXOsa6sTivnblW3whrgX0ZityFrv47Lit8CGYE4sdVkWRLs0XYZFW
	yjpQrZnS5WkRFqJzXWqcaAXtNA1D762F4QG9l5Sra/OUFgp2VoIU+KFUaYNnxHAPOg
	vmw8t1evRFzAkFiHfVn1QJsElxX9G2L19onUzJt0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CIcMUf014036
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 13:38:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 12 Oct 2017 13:38:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 12 Oct 2017 13:38:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CIcLa7016500
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 13:38:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Oct 2017 14:38:16 -0400
Message-ID: <1507833497-25049-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 1/2] packagegroup-arago-tisdk-graphics: fix non-sgx build
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
X-List-Received-Date: Thu, 12 Oct 2017 18:38:24 -0000
Content-Type: text/plain

no-sgx build does not support wayland-ivi-extension


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bbappend        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
index 78f9459..8479572 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk8"
+PR_append = ".tisdk9"
 
 GRAPHICS_DEMO = ""
 GRAPHICS_DEMO_omap-a15 = "\
@@ -12,4 +12,8 @@ GRAPHICS_RDEPENDS_remove_ti43x = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
 "
 
+GRAPHICS_WESTON_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'wayland-ivi-extension', d)} \
+"
+
 RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
-- 
1.9.1


