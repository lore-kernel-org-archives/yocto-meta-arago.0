Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6918852090
	for <meta-arago@arago-project.org>;
	Wed,  1 Jun 2016 15:10:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u51FA3NM021652
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 10:10:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51FA8Oj012488
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 10:10:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Jun 2016 10:10:07 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u51FA7mt015182;	Wed, 1 Jun 2016 10:10:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Jun 2016 11:09:38 -0400
Message-ID: <1464793778-14650-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: fix software manifest development host content
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
X-List-Received-Date: Wed, 01 Jun 2016 15:10:08 -0000
Content-Type: text/plain

* Previously, for the nativesdk sysroot, the package information was
  consolidated to a single package index under /var/lib/opkg.
* The package information is now contained in control files under
  /var/lib/opkg/info
* Fix the software manifest development host content tables by
  changing the opkg_dir

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 7de6bae..9a7c7e8 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -360,7 +360,7 @@ EOF
 
 # Create the host side toolchain components table
 sw_manifest_toolchain_host() {
-    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*86*-linux/var/lib/opkg"
+    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*86*-linux/var/lib/opkg/info"
 
     sw_manifest_table_header "GPLv3 Development Host Content" "This table describes any GPLv3 software being delivered that is expected to run on a Development Host, instead of the target device."
 
-- 
2.7.4


