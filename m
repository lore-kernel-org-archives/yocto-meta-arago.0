Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 12758529D1
	for <meta-arago@arago-project.org>;
	Thu,  7 Dec 2017 21:16:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB7LGSYv003920
	for <meta-arago@arago-project.org>; Thu, 7 Dec 2017 15:16:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512681388;
	bh=oe6u9Sbseq7wipmToHpGiC4xHxwNhw38L9C8Z5kvMDM=;
	h=From:To:Subject:Date;
	b=B3ZBrVC7tJ0yeILqQODCKtbhgh4s7X/QcmEa1/SYsSDyLkpAx8X3jBKgsj2D8KijC
	HPZ4jX+goIC3tfxQMhNyZnwQzHYCpPZB9SyC6IpsOfxNwhqybBy3CFhEpt+l/9D466
	eLj06L0A0cmyjRnZmcqG+vddQqrLXjJHDH+ypDvM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB7LGNPE001539
	for <meta-arago@arago-project.org>; Thu, 7 Dec 2017 15:16:23 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 7 Dec 2017 15:16:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 7 Dec 2017 15:16:22 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB7LGJR1029620
	for <meta-arago@arago-project.org>; Thu, 7 Dec 2017 15:16:21 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Dec 2017 16:16:15 -0500
Message-ID: <1512681375-7744-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] packagegroup-arago-tisdk-graphics: update for non-sgx build
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
X-List-Received-Date: Thu, 07 Dec 2017 21:16:39 -0000
Content-Type: text/plain

- remove ti-sgx-ddk-km if non-sgx for all targets
- remove glmark2 for non-sgx build
- Update GRSAPHICS_WESTON to GRAPHICS_WAYLAND per meta-arago change

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bbappend   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
index 8479572..412e94c 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
@@ -1,18 +1,18 @@
-PR_append = ".tisdk9"
+PR_append = ".tisdk10"
 
 GRAPHICS_DEMO = ""
 GRAPHICS_DEMO_omap-a15 = "\
     kmscube \
 "
 
-GRAPHICS_RDEPENDS_remove_ti33x = "\
+GRAPHICS_RDEPENDS_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
 "
-GRAPHICS_RDEPENDS_remove_ti43x = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
+GRAPHICS_RDEPENDS_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'glmark2', d)} \
 "
 
-GRAPHICS_WESTON_remove = "\
+GRAPHICS_WAYLAND_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'wayland-ivi-extension', d)} \
 "
 
-- 
1.9.1


