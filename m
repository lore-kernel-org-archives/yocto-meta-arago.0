Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9CE5452AD8
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 22:02:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DM2OsC027404
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DM2Np6005630
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 17:02:23 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DM2Dfq009769;	Fri, 13 Jun 2014 17:02:22 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 17:02:10 -0500
Message-ID: <1402696932-21888-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
References: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] arago-prefs: set default u-boot for keystone to u-boot-ti-staging
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
X-List-Received-Date: Fri, 13 Jun 2014 22:02:25 -0000
Content-Type: text/plain

* Use the u-boot-keystone bootloader for keystone devices by
  default.  This is in preparation for making the default
  mainline u-boot

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a547d88..e5716fa 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -60,6 +60,9 @@ PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
 # Use latest TI staging kernel and u-boot trees
+PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
+PREFERRED_PROVIDER_u-boot_keystone = "u-boot-keystone"
+
 PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-- 
1.7.9.5


