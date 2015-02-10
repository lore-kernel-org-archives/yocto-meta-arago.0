Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 10E9A52ABB
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 20:04:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AK3xpZ004032
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 14:03:59 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AK3wu3001173
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 14:03:58 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 14:03:57 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1AK3sDu007199;	Tue, 10 Feb 2015 14:03:55 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Feb 2015 15:03:52 -0500
Message-ID: <1423598632-4802-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] packagegroup-arago-tisdk-addons: Keep switch-config only for ti33x, ti43x & omap-a15
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
X-List-Received-Date: Tue, 10 Feb 2015 20:04:00 -0000
Content-Type: text/plain

- with kernel version 3.10.10 switch-config doesnot compile

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
- Modified to avoid use of _remove
---
---
 .../packagegroup-arago-tisdk-addons.bb             |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a8d3efb..6d98ba6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -18,7 +18,6 @@ UTILS = " \
     openssh-sftp-server \
     ptpd \
     libdrm-kms \
-    switch-config \
     ${@base_contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
 "
 
@@ -39,6 +38,10 @@ UTILS_append_ti43x = " canutils"
 UTILS_append_dra7xx = " canutils"
 UTILS_append_omap-a15 = " parted"
 
+UTILS_append_ti33x = " switch-config"
+UTILS_append_ti43x = " switch-config"
+UTILS_append_omap-a15 = " switch-config"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-- 
1.7.9.5


