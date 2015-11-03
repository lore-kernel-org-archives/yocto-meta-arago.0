Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6F86D529C0
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:57:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jv8FD028073
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:57:08 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jv8fH026668
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:57:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:57:09 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jv8DM017659;
	Tue, 3 Nov 2015 13:57:08 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthhc-0004Ww-EB; Tue, 03 Nov 2015 14:57:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:57:05 -0500
Message-ID: <1446580626-17380-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-base-tisdk-server-extra: Fix mmap and hyplnk llds
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
X-List-Received-Date: Tue, 03 Nov 2015 19:57:09 -0000
Content-Type: text/plain

* mmap-lld and hyplnk are only supported on k2hk-evm and k2e-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb       | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 6040879..dfb5712 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r3"
+PR = "r4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -105,11 +105,9 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     traceframework \
     cuia \
     libnl-xfrm \
-    mmap-lld \
     udma \
     cuia \
     edma3-lld \
-    hyplnk-lld \
     srss-tc \
     "
 
@@ -124,9 +122,16 @@ ARAGO_TI_PKGS_append_k2l-evm = "\
     iqn2-lld \
     "
 
-#ARAGO_TI_PKGS_append_k2hk-evm = "\
-#    srio-lld \
-#    "
+ARAGO_TI_PKGS_append_k2hk-evm = "\
+    srio-lld \
+    mmap-lld \
+    hyplnk-lld \
+    "
+
+ARAGO_TI_PKGS_append_k2e-evm = "\
+    mmap-lld \
+    hyplnk-lld \
+    "
 
 RDEPENDS_${PN} = "\
     ${ARAGO_LIBNL} \
-- 
1.9.1


