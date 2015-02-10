Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B806452A59
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 03:04:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1A34lTn004766
	for <meta-arago@arago-project.org>; Mon, 9 Feb 2015 21:04:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1A34jtE019728
	for <meta-arago@arago-project.org>; Mon, 9 Feb 2015 21:04:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Feb 2015 21:04:45 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1A34jfI015606;	Mon, 9 Feb 2015 21:04:45 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Feb 2015 22:04:41 -0500
Message-ID: <1423537481-22204-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-addons: Remove switch-config for keystone
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
X-List-Received-Date: Tue, 10 Feb 2015 03:04:47 -0000
Content-Type: text/plain

- keystone kernel is using kernel version 3.10.10 and
  switch-config doesnot compile with this version

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a8d3efb..9da3d4f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -25,6 +25,7 @@ UTILS = " \
 UTILS_UBOOT_FW = "u-boot-fw-utils"
 UTILS_UBOOT_FW_ti43x = ""
 UTILS_UBOOT_FW_keystone = ""
+UTILS_remove_keystone = "switch-config"
 
 UTILS_append_ti33x = " mmc-utils"
 UTILS_append_ti43x = " mmc-utils"
-- 
1.7.9.5


