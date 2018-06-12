Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0BD5C52978
	for <meta-arago@arago-project.org>;
	Tue, 12 Jun 2018 17:13:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5CHD141027770
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 12:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528823581;
	bh=sxvZtQ7hpJx+b0RzRRVcsWDfaJ2DnxEO984vIIkZGVg=;
	h=From:To:CC:Subject:Date;
	b=IRH6J7E3KJXr5bKIFYSyQTm+o3+DPg9lu0aT+QRjztMi1GqZMNTSSpfLqFi9ULRaM
	uk2K5rDQnflc//VbIT720Y9dO/A36RX9Bcgh5eL/2qEdjGZSGk0QN8gUJGRHRh+olj
	Ph3KXIV9owyLz7zojYjljwzRXSk/LTdNporLS1nI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5CHD1CZ030478
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 12:13:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 12 Jun 2018 12:13:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 12 Jun 2018 12:13:01 -0500
Received: from UDA0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5CHD0if021971;
	Tue, 12 Jun 2018 12:13:00 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Jun 2018 13:12:58 -0400
Message-ID: <1528823578-8427-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] csl: Add special compile for IDK targets only
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
X-List-Received-Date: Tue, 12 Jun 2018 17:13:08 -0000
Content-Type: text/plain

* AM57xx IDK requires also ARP32 tool chain for compilation

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../common-csl-ip/common-csl-ip-rtos_git.bbappend  | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
index dbf994a..2b0840e 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -1 +1,27 @@
-require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
+require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc    
+PR_append = ".tisdk1"
+
+# opencl-monitor does not distinguish between am57xx-evm and dra7xx-evm and thus
+# requires the am57xx-evm CSL libraries for both devices.
+TI_PDK_LIMIT_SOCS_append_dra7xx = " am574x"
+
+DEPENDS_append_dra7xx = " ti-cgt-arp32-native "
+DEPENDS_append_am57xx = " ti-cgt-arp32-native "
+
+do_compile_append_am57xx-evm() {
+
+    if [ "${TI_PDK_XDCMAKE}" == "1" ]
+    then
+        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${TI_PDK_XDC_ARGS}" ROOTDIR="${ROOTDIR}" -PR .
+        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${TI_PDK_XDC_ARGS}" -PR .
+    else
+        BUILD_DIR=${B}/`get_build_dir_bash`
+        cd ${BUILD_DIR}
+
+        oe_runmake ${TI_PDK_MAKE_TARGET}
+
+        oe_runmake csl BOARD=idkAM572x CORE=arp32_1 BUILD_ARP32=yes
+        oe_runmake csl BOARD=idkAM574x CORE=arp32_1 BUILD_ARP32=yes
+    fi
+}
+
-- 
1.9.1


