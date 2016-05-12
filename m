Return-Path: <a0869574local@uda0869574b>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 847CF5299F
	for <meta-arago@arago-project.org>;
	Thu, 12 May 2016 15:37:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4CFbjgm020134
	for <meta-arago@arago-project.org>; Thu, 12 May 2016 10:37:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CFbjQE022876
	for <meta-arago@arago-project.org>; Thu, 12 May 2016 10:37:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 May 2016 10:37:44 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CFbiBN018755;
	Thu, 12 May 2016 10:37:44 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1b0sgK-0001f3-1l;
	Thu, 12 May 2016 11:37:44 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 May 2016 11:37:39 -0400
Message-ID: <1463067460-6348-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][PATCH 1/2] LibArch: Added permanent heap allocation and free functions.
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
X-List-Received-Date: Thu, 12 May 2016 15:37:50 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 meta-arago-extras/recipes-ti/libarch/libarch.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
index 438e428..159d889 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "https://git.ti.com/library-architecture/libarch"
 LICENSE = "BSD-3-Clause"
 
 PV = "1_0_0_0"
-INC_PR = "r1"
+INC_PR = "r2"
 
 require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
@@ -10,7 +10,7 @@ require recipes-ti/includes/ti-staging.inc
 BRANCH = "master"
 LIC_FILES_CHKSUM = "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.html;md5=bb48cacb8827ec8d8e5a94c4f2425ee3"
 SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
-SRCREV = "4b2f1c5d5b6b9f3d021e498120a914456fb9eba1"
+SRCREV = "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
 
 COMPATIBLE_MACHINE = "k2hk-evm|am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


