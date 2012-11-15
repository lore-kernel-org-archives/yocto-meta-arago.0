Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4378B52987
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 21:13:37 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAFLDZfC027707
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2012 15:13:35 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFLDXov028915
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 02:43:34 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 16 Nov 2012 02:43:33 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFLDUFi005188;
	Fri, 16 Nov 2012 02:43:32 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Nov 2012 15:13:25 -0600
Message-ID: <1353014005-13589-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: Fix missing header in SW manifest
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
X-List-Received-Date: Thu, 15 Nov 2012 21:13:38 -0000
Content-Type: text/plain

* Added the missing table header text in the SW manifest that
  is generated as part of the SDK build.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 3222d0d..916baa9 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -272,6 +272,11 @@ echo "
 sw_manifest_toolchain_target() {
     opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/arm-arago-linux-gnueabi/var/lib/opkg/info"
 
+echo "
+<h2><u>Development Libraries Installed on Host</u></h2>
+<p>This table describes software libraries and headers that are installed on the development host and used during the development of software to run on the target.  Some of this software may be licensed under GPLv3.  Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
+" >> ${SW_MANIFEST_FILE}
+
     generate_sw_manifest_table $opkg_dir
 }
 
-- 
1.7.0.4


