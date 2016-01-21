Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F21365296D
	for <meta-arago@arago-project.org>;
	Thu, 21 Jan 2016 20:15:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0LKFrrE000935
	for <meta-arago@arago-project.org>; Thu, 21 Jan 2016 14:15:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0LKFrX8013897
	for <meta-arago@arago-project.org>; Thu, 21 Jan 2016 14:15:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 21 Jan 2016 14:15:53 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0LKFqGN005835;	Thu, 21 Jan 2016 14:15:52 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Jan 2016 15:15:50 -0500
Message-ID: <1453407350-27909-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-addons-sdk-target: add elfutils-dev and elfutils-staticdev for dra7xx
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
X-List-Received-Date: Thu, 21 Jan 2016 20:15:54 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 7d5b290..44abbdb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -120,6 +120,8 @@ UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
 UTILS_append_dra7xx = " canutils-dev \
                         opencl-staticdev \
+                        elfutils-dev \
+                        elfutils-staticdev \
 "
 UTILS_append_k2g-evm = " canutils-dev"
 
-- 
1.9.1


