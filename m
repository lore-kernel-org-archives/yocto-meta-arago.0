Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1EE09529C8
	for <meta-arago@arago-project.org>;
	Tue, 24 Jun 2014 13:56:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5ODug85014737
	for <meta-arago@arago-project.org>; Tue, 24 Jun 2014 08:56:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5ODugkp013035
	for <meta-arago@arago-project.org>; Tue, 24 Jun 2014 08:56:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 24 Jun 2014 08:56:42 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5ODud7E006952;
	Tue, 24 Jun 2014 08:56:41 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 24 Jun 2014 08:56:37 -0500
Message-ID: <1403618197-22108-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] packagegroup-arago-tisdk-addons: Add valgrind
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
X-List-Received-Date: Tue, 24 Jun 2014 13:56:45 -0000
Content-Type: text/plain

* Add valgrind to aide users in debugging userspace applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6fe9d41..bf8b9d3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
@@ -18,6 +18,7 @@ UTILS = " \
     openssh-sftp-server \
     ptpd \
     libdrm-kms \
+    ${@base_conditional('SOC_FAMILY', 'omapl138', '', 'valgrind', d)} \
 "
 
 UTILS_UBOOT_FW = "u-boot-fw-utils"
-- 
1.7.0.4


