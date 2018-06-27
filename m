Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A2E2E52A00
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 18:53:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RIrpA4129164
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 13:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530125631;
	bh=0twguL0nbpdictCbbR6+J1mguEQm1/4y7yk+urLwaXE=;
	h=From:To:CC:Subject:Date;
	b=MXIx9aYAG/pfJV/ZoAQVk62JxafehmhyEbRJEjzvjqj32ppM9aUOvc9u+gUgj4/EL
	jkEjPZT5bUJQsZLTXMUYNCnoMcDXQ667JNb5o41YA3V491lDAhTgCqclh8dy75xwa4
	CST+YieYfCDNnPNnam0GInYLV6bbm0/LEIsidtlI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RIrpDL011974
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 13:53:51 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 13:53:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 13:53:51 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RIrpX7022096;
	Wed, 27 Jun 2018 13:53:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jun 2018 14:42:29 -0400
Message-ID: <1530124949-10759-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] linux: copy-defconfig: use ARCH for destination
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
X-List-Received-Date: Wed, 27 Jun 2018 18:53:58 -0000
Content-Type: text/plain

* Use ARCH, set by kernel-arch.bbclass, to determine the destination
  of the defconfig used in the build.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
index ffc8b2b..04b22ef 100644
--- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
+++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
@@ -6,7 +6,7 @@ CONFIG_NAME ?= "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
 # do_compile_prepend so that we can pick up any changes to the
 # defconfig thay may have been done by the sanitizer code.
 do_configure_append() {
-    cp ${B}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
+    cp ${B}/.config ${S}/arch/${ARCH}/configs/${CONFIG_NAME}
 }
 
 # Move create_srcipk task so that the release defconfig is included.
-- 
2.7.4


