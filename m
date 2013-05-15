Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E2DEB52A66
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3sf6T016604
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3sf9r014440
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:41 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:41 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkQ004084;
	Tue, 14 May 2013 22:54:40 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:23 -0500
Message-ID: <1368590069-6700-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368590069-6700-1-git-send-email-fcooper@ti.com>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/9] packagegroup-arago-tisdk-amsdk-sdk-host: Only include uEnv.txt when needed
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
X-List-Received-Date: Wed, 15 May 2013 03:54:43 -0000
Content-Type: text/plain

* Don't require all SDKs to use the uEnv.txt when only 1 machine includes a non
  blank uEnv.txt file.
* Some machines can't even use the uEnv.txt.
* Only include uEnv.txt in a SDK when it is providing a non blank override.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 0916849..e1c35dd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -16,15 +16,14 @@ TOOLS_omap-a15 = ""
 TOOLS_append_am37x-evm = " flash-utility"
 TOOLS_append_am3517-evm = " flash-utility"
 
-README = ""
-README_omap-a15 = "tisdk-readme"
-README_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
+EXTRA_FILES = ""
+EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
+EXTRA_FILES_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-uenv',d)}"
 
 RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
-    tisdk-uenv \
-    ${README} \
+    ${EXTRA_FILES} \
     board-port-labs-src \
     ti-tisdk-makefile \
     ${U-BOOT_SRC} \
-- 
1.7.0.4


