Return-Path: <a0869574local@uda0869574b>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 83A8F52975
	for <meta-arago@arago-project.org>;
	Wed,  8 Jun 2016 20:13:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u58KDMN1001001
	for <meta-arago@arago-project.org>; Wed, 8 Jun 2016 15:13:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u58KDaWG027859
	for <meta-arago@arago-project.org>; Wed, 8 Jun 2016 15:13:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Jun 2016 15:13:35 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u58KDZmc004438;
	Wed, 8 Jun 2016 15:13:36 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1bAjr5-0005Fs-EP;
	Wed, 08 Jun 2016 16:13:35 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Jun 2016 16:13:33 -0400
Message-ID: <1465416813-20165-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] LINALG: removed 'mmv' from makefile.
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
X-List-Received-Date: Wed, 08 Jun 2016 20:13:36 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index bb132dc..aa33923 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
 LICENSE = "BSD-3-Clause"
 
 PV = "1_2_0_0"
-INC_PR = "r4"
+INC_PR = "r5"
 
 S = "${WORKDIR}/git"
 
@@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
 LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
-SRCREV = "19bc67da92b66acc99941183868ffb0dc234a0e9"
+SRCREV = "0833183162a47876a8f24532264da51010d80623"
 
 DEPENDS = "common-csl-ip \
            libarch \
-- 
1.9.1


