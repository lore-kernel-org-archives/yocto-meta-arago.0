Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 162DF529FE
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 14:39:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3KEdM51024526
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524235162;
	bh=qqJCLTYvT+IkjPTpjGOT6uPOGaVG0O3310ROQuvnqVM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wLxgs0ujqvd+yVkeJCHU5KJ+nb0bFFjk9NpiV/XoJJd7f7745up5DkWpc1sKmuQDh
	hvU7JM0iVw3op8ceX/EBGElknVWxdYsvTkqp9ICiDBdHjbkDpv3y45dBYmSKDluBM6
	HvSuz+qN3ni58VCh5eWKdxp+AKmSYL+o42MTTAWI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdMdS027786
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Apr 2018 09:39:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Apr 2018 09:39:22 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdK51002328;
	Fri, 20 Apr 2018 09:39:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Apr 2018 10:29:00 -0400
Message-ID: <1524234540-28454-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
References: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 5/5] opencl-examples-rtos: add missing dependencies
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
X-List-Received-Date: Fri, 20 Apr 2018 14:39:26 -0000
Content-Type: text/plain

* set path to clocl as it is located in the native sysroot

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 8496749..29c45fa 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl-rtos ti-cgt6x-native clocl-rtos-native opencl-monitor-rtos \
-           clocl-win \
+           clocl-win gcc-arm-none-eabi-native ti-xdctools-native ti-sysbios \
 "
 
 S = "${WORKDIR}/git/opencl_example_src"
@@ -66,7 +66,7 @@ do_compile() {
     unset LDFLAGS
     unset TARGET_LDFLAGS
 
-    oe_runmake
+    oe_runmake CLOCL=${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tree/bin/x86/clocl
 }
 
 do_install() {
-- 
2.7.4


