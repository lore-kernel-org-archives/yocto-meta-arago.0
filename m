Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1E22C529C0
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:57:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jv94b008683
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:57:09 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jv9Pr026691
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:57:09 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:57:09 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jv9LG007932;
	Tue, 3 Nov 2015 13:57:09 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthhd-0004X1-0m; Tue, 03 Nov 2015 14:57:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:57:06 -0500
Message-ID: <1446580626-17380-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580626-17380-1-git-send-email-j-stiffler@ti.com>
References: <1446580626-17380-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-addons-sdk-target: Fix mmap and hyplnk llds
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
X-List-Received-Date: Tue, 03 Nov 2015 19:57:10 -0000
Content-Type: text/plain

* mmap-lld and hyplnk are only supported on k2hk-evm and k2e-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb       | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index a87082d..044894f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -47,8 +47,6 @@ EXTRA_LIBS_append_keystone = "\
 	pa-lld-staticdev \
 	rm-lld-dev \
 	rm-lld-staticdev \
-	hyplnk-lld-dev \
-	hyplnk-lld-staticdev \
 	sa-lld-dev \
 	sa-lld-staticdev \
 	hplib-dev \
@@ -57,8 +55,6 @@ EXTRA_LIBS_append_keystone = "\
 	nwal-lld-staticdev \
 	pktlib-dev \
 	pktlib-staticdev \
-	mmap-lld \
-	mmap-lld-staticdev \
 	netapi-dev \
 	netapi-staticdev \
 	ipsecmgr-dev \
@@ -93,8 +89,19 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	srio-lld-staticdev \
 	ipc-transport-srio-dev \
 	ipc-transport-srio-staticdev \
+	mmap-lld \
+	mmap-lld-staticdev \
+	hyplnk-lld-dev \
+	hyplnk-lld-staticdev \
 	"
 
+EXTRA_LIBS_append_k2e-evm = "\
+	mmap-lld \
+	mmap-lld-staticdev \
+	hyplnk-lld-dev \
+	hyplnk-lld-staticdev \
+"
+
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
-- 
1.9.1


