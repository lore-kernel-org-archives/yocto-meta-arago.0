Return-Path: <a0869574local@uda0869574b>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 4FD345296F
	for <meta-arago@arago-project.org>;
	Wed,  1 Jun 2016 18:34:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u51IYbXI010725
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 13:34:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51IYbFN019871
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 13:34:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Jun 2016 13:34:36 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51IYaG0028425;
	Wed, 1 Jun 2016 13:34:36 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1b8AyR-0004Im-Sg;
	Wed, 01 Jun 2016 14:34:35 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Jun 2016 14:34:27 -0400
Message-ID: <1464806067-16503-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][PATCH] LINALG: release 1.2.0 iteration 3
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
X-List-Received-Date: Wed, 01 Jun 2016 18:34:37 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index d7cb4f0..4e058e6 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
 LICENSE = "BSD-3-Clause"
 
 PV = "1_2_0_0"
-INC_PR = "r2"
+INC_PR = "r3"
 
 S = "${WORKDIR}/git"
 
@@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
 LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
-SRCREV = "f85a37ee21113e5839a64ac61009b1e2dde10fbc"
+SRCREV = "5e7adc2d187df1a41fae5c23d7f3fedbb0ae039c"
 
 DEPENDS = "common-csl-ip \
            libarch \
-- 
1.9.1


