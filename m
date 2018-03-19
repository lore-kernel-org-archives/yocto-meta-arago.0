Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2EA1D52970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 21:57:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JLuTbP024781
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 16:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521496589;
	bh=EAXyM3+13bK2l6PGOo51imjb3z3LeBbB30ALACT66H0=;
	h=From:To:CC:Subject:Date;
	b=d6bebZNXfXPz3XbhyhhEaBVaemP05iaISE55IWOjxcu/xxVeo7DiGKkSzeO+33ix9
	xDDkSXWfIwEbGYVtWnkZlId3rR0ZUKvan+5G7itBmS+KVquSTuHQ+KADtrsQw4jAXo
	9DpPyT366EVRbNM7Uqtcv2UF4BmCLQJG/a4YTONE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JLuTnD006526
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 16:56:29 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 16:56:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 16:56:28 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JLuSa4007374;
	Mon, 19 Mar 2018 16:56:28 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 17:56:26 -0400
Message-ID: <1521496586-2283-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] tiovx-sys-iface: use update-alternatives for the firmware
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
X-List-Received-Date: Mon, 19 Mar 2018 21:57:28 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/tiovx-sys-iface.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/tiovx/tiovx-sys-iface.bb b/recipes-ti/tiovx/tiovx-sys-iface.bb
index 4462749..bcfbcc9 100644
--- a/recipes-ti/tiovx/tiovx-sys-iface.bb
+++ b/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -7,11 +7,13 @@ LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html
 require recipes-ti/includes/tisdk-paths.inc
 require tiovx-sys.inc
 
-PR = "r1"
+PR = "r0"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit update-alternatives
+
 S = "${WORKDIR}/git"
 
 do_install () {
@@ -24,6 +26,13 @@ do_install () {
     install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
 }
 
+ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx"
+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
+ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx"
+ALTERNATIVE_PRIORITY = "20"
+
 FILES_${PN} += "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
 PACKAGES =+ "${PN}-firmware"
 FILES_${PN}-firmware = "${base_libdir}/firmware/*"
-- 
1.9.1


