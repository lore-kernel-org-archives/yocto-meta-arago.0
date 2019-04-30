Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id EC2D8529DA
	for <meta-arago@arago-project.org>;
	Tue, 30 Apr 2019 17:24:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UHOOVX047133
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2019 12:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556645064;
	bh=6zkMBgN5HMsrnZ/d56L8eRinNlWCzlln20SwdOqMp9Q=;
	h=From:To:CC:Subject:Date;
	b=TohlIY+8BP5nIw0m0qu4DuMlKAXNLvj3y07YyChOAh47pbSFzQld3AwwEvRZR8cyk
	FdjslQjC0qVE9V2GN6NSGK1yqCxtwn3u6US98uy5Tm7W3a+60O/J/rEd4j1cIyx5qk
	+BdPtyVjP7yUwdl/FUWS9XZiGOe7A6K3aygI8oV8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UHOOWH002519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2019 12:24:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Apr 2019 12:24:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Apr 2019 12:24:24 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UHOOGu037680;
	Tue, 30 Apr 2019 12:24:24 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 30 Apr 2019 13:12:13 -0400
Message-ID: <1556644334-32700-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v3 1/2] arago-source-ipk: remove unused PVExtra
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
X-List-Received-Date: Tue, 30 Apr 2019 17:24:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc           | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index d958268..7fc3a3a 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -204,16 +204,16 @@ CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 = "example-applications/linux-driver-examples-${PV}"
 
 CREATE_SRCIPK_pn-ti-framework-components = "1"
-SRCIPK_INSTALL_DIR_pn-ti-framework-components = "component-sources/framework_components_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-framework-components = "component-sources/framework_components_${PV}"
 
 CREATE_SRCIPK_pn-ti-codec-engine = "1"
-SRCIPK_INSTALL_DIR_pn-ti-codec-engine = "component-sources/codec_engine_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-codec-engine = "component-sources/codec_engine_${PV}"
 
 CREATE_SRCIPK_pn-ti-codecs-omap3530 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 = "codecs-omap3530_${PV}"
 
 CREATE_SRCIPK_pn-ti-linuxutils = "1"
-SRCIPK_INSTALL_DIR_pn-ti-linuxutils = "component-sources/linuxutils_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-linuxutils = "component-sources/linuxutils_${PV}"
 
 CREATE_SRCIPK_pn-ti-xdctools = "1"
 SRCIPK_INSTALL_DIR_pn-ti-xdctools = "component-sources/xdctools_${PV}"
@@ -222,7 +222,7 @@ CREATE_SRCIPK_pn-ti-dmai = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dmai = "dmai_${PV}"
 
 CREATE_SRCIPK_pn-ti-xdais = "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdais = "component-sources/xdais_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-xdais = "component-sources/xdais_${PV}"
 
 CREATE_SRCIPK_pn-ti-local-power-manager = "1"
 SRCIPK_INSTALL_DIR_pn-ti-local-power-manager = "local-power-manager_${PV}"
@@ -264,7 +264,7 @@ CREATE_SRCIPK_pn-ti-dspbios = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dspbios = "dspbios_${PV}"
 
 CREATE_SRCIPK_pn-ti-sysbios = "1"
-SRCIPK_INSTALL_DIR_pn-ti-sysbios = "component-sources/bios_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-sysbios = "component-sources/bios_${PV}"
 
 CREATE_SRCIPK_pn-ti-biosutils = "1"
 SRCIPK_INSTALL_DIR_pn-ti-biosutils = "biosutils_${PV}"
@@ -273,7 +273,7 @@ CREATE_SRCIPK_pn-ti-dsplink = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dsplink = "dsplink_${PV}"
 
 CREATE_SRCIPK_pn-ti-syslink = "1"
-SRCIPK_INSTALL_DIR_pn-ti-syslink = "component-sources/syslink_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-syslink = "component-sources/syslink_${PV}"
 
 CREATE_SRCIPK_pn-ti-edma3lld = "1"
 SRCIPK_INSTALL_DIR_pn-ti-edma3lld = "component-sources/edma3lld_${PV}"
@@ -291,7 +291,7 @@ CREATE_SRCIPK_pn-ti-c6run = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c6run = "component-sources/c6run_${PV}"
 
 CREATE_SRCIPK_pn-ti-osal = "1"
-SRCIPK_INSTALL_DIR_pn-ti-osal = "component-sources/osal_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-osal = "component-sources/osal_${PV}"
 
 CREATE_SRCIPK_pn-ti-ipc = "1"
 SRCIPK_INSTALL_DIR_pn-ti-ipc = "component-sources/ipc_${PV}"
@@ -306,7 +306,7 @@ CREATE_SRCIPK_pn-ti-omx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-omx = "component-sources/omx_${PV}"
 
 CREATE_SRCIPK_pn-ti-uia = "1"
-SRCIPK_INSTALL_DIR_pn-ti-uia = "component-sources/uia_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-uia = "component-sources/uia_${PV}"
 
 CREATE_SRCIPK_pn-ti-media-controller-utils = "1"
 SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils = "board-support/media-controller-utils_${PV}"
@@ -321,7 +321,7 @@ CREATE_SRCIPK_pn-ti-slog = "1"
 SRCIPK_INSTALL_DIR_pn-ti-slog = "component-sources/slog_${PV}"
 
 CREATE_SRCIPK_pn-ti-c674x-aaclcdec = "1"
-SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV}${PVExtra}"
+SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV}"
 
 CREATE_SRCIPK_pn-oe-layersetup = "1"
 SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
-- 
2.7.4


