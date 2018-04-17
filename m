Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1FBD752986
	for <meta-arago@arago-project.org>;
	Tue, 17 Apr 2018 20:36:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3HKa135013594
	for <meta-arago@arago-project.org>; Tue, 17 Apr 2018 15:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523997361;
	bh=17nBjSHotAyVDueeTRH2Fgcjc2ZEhbwCLwHPlU2CaLw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bWsQkKQX4fvuSSDfbEGqOyqgVIpjZE6Qj8zDcUKthGlpcgsdIN5Y1Vcphn8qSFvuS
	g6txBMe+u84Q5Xqucis1RPdjHaDVBIT3GaHXvNcyGLjEc4ASfo35lYG/n9TO4MuZ0z
	ZfZ8MjQu1NN73Rj5xGUuLGq9flVLWkMFxBlVSOd0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3HKa19M023572
	for <meta-arago@arago-project.org>; Tue, 17 Apr 2018 15:36:01 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 17 Apr 2018 15:36:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 17 Apr 2018 15:36:01 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3HKZvDD022445;
	Tue, 17 Apr 2018 15:36:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Apr 2018 16:25:34 -0400
Message-ID: <1523996734-5478-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523996734-5478-1-git-send-email-j-stiffler@ti.com>
References: <1523996734-5478-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/2] clocl-rtos: fix installation to sysroot
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
X-List-Received-Date: Tue, 17 Apr 2018 20:36:04 -0000
Content-Type: text/plain

* Move all installation to do_install and install relative to ${D}.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
index 3725567..fad8d77 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
@@ -17,7 +17,7 @@ TARGET_class-target = "am57xx"
 TARGET_class-native = "x86"
 
 export WANT_LLVM_RELEASE = "3.6-ti"
-export DESTDIR="${OCL_RTOS_INSTALL_DIR}"
+export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}"
 export LDFLAGS="${BUILD_LDFLAGS}"
 export CXXFLAGS="${BUILD_CFLAGS}"
 
-- 
2.7.4


