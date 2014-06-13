Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9AFED52AD9
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 22:02:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DM2QxR010402
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DM2Q3H005672
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 17:02:26 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DM2Dfr009769;	Fri, 13 Jun 2014 17:02:24 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 17:02:11 -0500
Message-ID: <1402696932-21888-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
References: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] arago-prefs: Use mainline u-boot by default
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
X-List-Received-Date: Fri, 13 Jun 2014 22:02:28 -0000
Content-Type: text/plain

* Use mainline u-boot by default for TI devices unless they are
  pinned to a different u-boot for legacy reasons.  By default
  this change impacts the following devices to use mainline
  u-boot:
    * am335x-evm
    * am437x-evm
    * dra7xx-evm
    * omap5-evm

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index e5716fa..6e6d013 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -59,19 +59,20 @@ PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
+# Use the mainline u-boot recipe for TI devices unless overridden below
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_u-boot = "u-boot"
+PREFERRED_VERSION_u-boot = "2014.04+2014.07-rc3"
+
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot_keystone = "u-boot-keystone"
 
 PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
 PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
 
 PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
-- 
1.7.9.5


