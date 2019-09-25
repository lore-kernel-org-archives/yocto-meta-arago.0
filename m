Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 362A4520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 14:13:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PECLQ5106429
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 09:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569420741;
	bh=ET71cXmTdI5j9o3zQ63cvWO7Kjh/AUML/EU9YAbe2ac=;
	h=From:To:CC:Subject:Date;
	b=uHkNhI5Bj9G0VpTI62fLpo/43703GHi9YByEIitesU0qk1cdF03eROl5h4f5iziJV
	GiJgsPz1798JCqO4tfdOR5BCXiNp6+A7aQRrKJ8VYV4xPYIuPj5iFmiNbmGtMpiKI2
	BF5g4VsuupR7P4v/H0+1GjUWz5Z6lXhW+fUt71T8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PECLoh016175
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 09:12:21 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 09:12:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 09:12:13 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PECI4c069612; 
	Wed, 25 Sep 2019 09:12:19 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <j-stiffler@ti.com>
Date: Wed, 25 Sep 2019 19:42:17 +0530
Message-ID: <1569420737-132217-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v1] ti-tisdk-makefile: Update Makefiles for am65xx and j7-evm
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
X-List-Received-Date: Wed, 25 Sep 2019 14:13:31 -0000
Content-Type: text/plain

Move following packages from MAKEFILES_append_k3 to MAKEFILES_append_am6xx
This is to ensure that these won't be packaged into j7-evm bundle.

Also define K3_UBOOT_MACHINE_R5 for j7-evm

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 417b28b..d2aad2d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -181,11 +181,8 @@ MAKEFILES_append_k2g = " pru-icss"
 
 MAKEFILES_append_k3 = " u-boot-spl \
                         linux-dtbs \
-                        barcode-roi \
                         cryptodev \
                         sysfw-image \
-			mmwavegesture-hmi \
-                        pdm-anomaly-detection \
                         ti-ipc \
                         jailhouse \
 "
@@ -193,6 +190,9 @@ MAKEFILES_append_k3 = " u-boot-spl \
 MAKEFILES_append_am65xx = " \
                         pru-icss \
                         ti-sgx-ddk-km \
+                        barcode-roi \
+                        mmwavegesture-hmi \
+                        pdm-anomaly-detection \
 "
 
 # Use this to export kernel arch to ARCH
@@ -353,6 +353,8 @@ do_install () {
 K3_UBOOT_MACHINE_R5 = ""
 K3_UBOOT_MACHINE_R5_am65xx-evm = "am65x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
+K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
+
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
 
-- 
1.9.1


