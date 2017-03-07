Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A0B63529D2
	for <meta-arago@arago-project.org>;
	Tue,  7 Mar 2017 16:44:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v27GiAe4029888
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 10:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488905050;
	bh=vo0aJrzz2xVw6irPdGWR94OJneC1cBy6bB/2C+ip97Q=;
	h=From:To:CC:Subject:Date;
	b=GzLw0xKxMdg9SUlJnV8fj050g8uqbe5+jsQ34Q6KH2Iq4+BzsED6FgQhKqgJkr2Z0
	pJ7WjQvNmlnvhi7HFhjA44LXzkWgmYcdVHrpm0+flbJic+a0i6I3VgM3xzHQ5GVh++
	VqAhhkmaFzVjEhS9NUqEdaNWYLtT47TjjtMdtsuU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v27GiAu6032027
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 10:44:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 10:44:09 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v27Gi96n015414;	Tue, 7 Mar 2017 10:44:09 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Mar 2017 11:44:08 -0500
Message-ID: <1488905048-19240-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH] packagegroup-arago-toolchain-tisdk-target: add packagegroup-arago-tisdk-multimedia-sdk-target for keystone
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
X-List-Received-Date: Tue, 07 Mar 2017 16:44:10 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 5b4775b..9140417 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,7 +18,10 @@ TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-tisdk-crypto-sdk-target \
 "
 
-TISDK_TOOLCHAIN_BASE_TARGET_keystone = "packagegroup-arago-standalone-sdk-target"
+TISDK_TOOLCHAIN_BASE_TARGET_keystone = "\
+    packagegroup-arago-standalone-sdk-target \
+    packagegroup-arago-tisdk-multimedia-sdk-target \
+"
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
-- 
1.9.1


