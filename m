Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1700652A1B
	for <meta-arago@arago-project.org>;
	Fri, 18 Oct 2013 12:49:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ICnrKA009643
	for <meta-arago@arago-project.org>; Fri, 18 Oct 2013 07:49:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ICnrGI006489
	for <meta-arago@arago-project.org>; Fri, 18 Oct 2013 07:49:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 18 Oct 2013 07:49:53 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ICnoIC011868;
	Fri, 18 Oct 2013 07:49:52 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Oct 2013 08:40:24 -0500
Message-ID: <1382103624-1879-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-base: Add mtd-utils-ubifs
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
X-List-Received-Date: Fri, 18 Oct 2013 12:49:56 -0000
Content-Type: text/plain

* Add the ubifs mtd-utils to make working with ubifs images
  easier.

* Since we deploy ubifs images for even the base file system
  include these tools into the base package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-base.bb       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index fd9cd15..4caf09d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -12,6 +12,7 @@ ARAGO_ALSA_BASE = "\
 ARAGO_BASE = "\
     module-init-tools \
     mtd-utils \
+    mtd-utils-ubifs \
     curl \
     initscript-telnetd \
     ethtool \
-- 
1.7.0.4


