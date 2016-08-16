Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 23917529F1
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 17:55:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7GHtf5p023129
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 12:55:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7GHtfxZ009771
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 12:55:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 Aug 2016 12:55:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7GHtfwP006984;	Tue, 16 Aug 2016 12:55:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Aug 2016 13:55:04 -0400
Message-ID: <1471370104-31365-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-base-tisdk-server-extra: remove ipsec-tools
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
X-List-Received-Date: Tue, 16 Aug 2016 17:55:44 -0000
Content-Type: text/plain

* strongswan is used instead

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 5820ee3..3d54838 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -157,7 +157,6 @@ RDEPENDS_${PN} = "\
     strongswan \
     procps \
     dhcp-client \
-    ipsec-tools \
     kexec \
     kdump \
     tzdata \
-- 
2.7.4


