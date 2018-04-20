Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 90F93529B1
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 14:39:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3KEdLSd024518
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524235161;
	bh=GE6WioNTXloNz0xjglhnZCqUq12OGz2/hJqduwxdnT8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=woxk3JBvrjR0kc8NtInmntBjD+cQJIzdj7qcKcxpwcJb318TsRTClgVkT6WNVLJcu
	JjB0WMDv6LKxhSXCLJeNVmKy5b7lhjJM4EyVHR2RLLT04rocAvjmp6ZYvz44CTUjLV
	fiCZpysG/hmHYLeOOJs/2jmg87VHohvaQvLylHsw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdLvw027760
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Apr 2018 09:39:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Apr 2018 09:39:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdK4w002328;
	Fri, 20 Apr 2018 09:39:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Apr 2018 10:28:57 -0400
Message-ID: <1524234540-28454-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
References: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/5] clocl-rtos: fix installation to sysroot
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

* Install relative to ${D}.

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


