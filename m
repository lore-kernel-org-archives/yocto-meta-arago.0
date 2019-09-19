Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 34EBA520DE
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2019 10:05:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JA4ii5047311
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 05:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568887484;
	bh=gx9Pu2kIEFHdca22jYM6NoVgDDW7bjXm8qUPDU+07XI=;
	h=From:To:CC:Subject:Date;
	b=g+e4cIiz8lcNsprLtyKpbCJRBYPbVDUZzgDOQZnklAqHDVMmZXlNDIfUNJQ3k4vA3
	ixga9wmJVXKXkM/yql+B7rGKKDcG8nSW+JdaRsP5mXaG4NI8ikS7nEQuUSH+gEmQYo
	IBSKeyWusULUXSGgxI9Aae44y0eg8pJNEBDzli+M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JA4i09125268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 05:04:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 19 Sep 2019 05:04:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 19 Sep 2019 05:04:40 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JA4f3t035995; 
	Thu, 19 Sep 2019 05:04:42 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <denys@ti.com>
Date: Thu, 19 Sep 2019 15:34:29 +0530
Message-ID: <1568887469-57690-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [thud/master PATCH v1] packagegroup: tisdk-addons-sdk-host: Add src packages
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
X-List-Received-Date: Thu, 19 Sep 2019 10:05:52 -0000
Content-Type: text/plain

Add source packages for ATF and external kernel modules
Also define the src package proprties for these
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 14 ++++++++++++++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb            |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 6e56c77..970e3e2 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -142,6 +142,10 @@ SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
 CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
 
+CREATE_SRCIPK_pn-arm-trusted-firmware = "1"
+SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware = "board-support/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware = "true"
+
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
@@ -181,6 +185,7 @@ SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
 
 CREATE_SRCIPK_pn-cryptodev-module = "1"
 SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
+SRCIPK_PRESERVE_GIT_pn-cryptodev-module = "true"
 
 CREATE_SRCIPK_pn-cmem-mod = "1"
 SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
@@ -196,6 +201,11 @@ SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-ti-img-rogue-driver = "1"
 SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver = "true"
+
+CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
+SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
 
 CREATE_SRCIPK_pn-ti-gc320-driver = "1"
 SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
@@ -364,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
 CREATE_SRCIPK_pn-uio-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
+SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
+
 CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
 SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index fbdc735..558955c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -39,6 +39,13 @@ UTILS_append_k2g = " \
 UTILS_append_k3 = " \
     jailhouse-src \
     ti-sci-fw-src \
+    ivshmem-uio-driver-src \
+    arm-trusted-firmware-src \
+"
+
+UTILS_append_j7-evm = " \
+    ti-img-encode-decode-src \
+    ti-img-rogue-driver-src \
 "
 
 UTILS_append_am65xx = " \
-- 
1.9.1


