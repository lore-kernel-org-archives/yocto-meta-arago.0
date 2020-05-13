Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3F47152A40
	for <meta-arago@arago-project.org>;
	Wed, 13 May 2020 20:23:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DKLSCn019799
	for <meta-arago@arago-project.org>; Wed, 13 May 2020 15:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589401288;
	bh=9h0w5btFVjBbByUJK05O6oOD/T4QsW2Vy5jQE51Yg+8=;
	h=From:To:CC:Subject:Date;
	b=yvDK3GXvBv7itF6scQnw3xXndGw+/nn51MPgXsE5PQfM7QthHOO0uKiSK87fD/bZi
	xiM7nOYe5qAWHmnwb9f/iEfAxiWrjje+shENnE3+wG/4ztYBMrU7gZ7Gq0DiCiwA9E
	PRqVnoniOe10XzoFMYQw57ORonUyRMdX2SZ8xoIM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04DKLS86100630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 13 May 2020 15:21:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 13 May 2020 15:21:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 13 May 2020 15:21:28 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DKLS3N108786;
	Wed, 13 May 2020 15:21:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 May 2020 20:21:27 +0000
Message-ID: <20200513202127.9448-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] arago.conf, optee: enable generation of FIT image for j7-hs-evm
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
X-List-Received-Date: Wed, 13 May 2020 20:23:54 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf               |  1 +
 .../recipes-security/optee/optee-os_git.bbappend       | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6ea41989..bc786a77 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -52,6 +52,7 @@ KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
+KERNEL_IMAGETYPES_j7-hs-evm = "Image fitImage"
 
 KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2e-hs-evm = "k2-fw-initrd"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 2fb3e279..86945545 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -45,6 +45,16 @@ do_compile_am65xx-hs-evm() {
     )
 }
 
+do_compile_j7-hs-evm() {
+    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
+    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
+        mv tee-pager.bin.signed ${B}/bl32.bin; \
+        cp tee.elf ${B}/bl32.elf; \
+    )
+}
+
 do_install() {
     #install core on boot directory
     install -d ${D}/boot
-- 
2.17.1


