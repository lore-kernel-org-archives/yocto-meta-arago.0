Return-Path: <a0869574local@uda0869574b>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id BB5E052A76
	for <meta-arago@arago-project.org>;
	Fri, 10 Jun 2016 17:24:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5AHOENj018140
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 12:24:14 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AHOD23025591
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 12:24:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Jun 2016 12:24:13 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AHODCs018934;
	Fri, 10 Jun 2016 12:24:13 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1bBQAG-0006Ha-VA;
	Fri, 10 Jun 2016 13:24:13 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Jun 2016 13:24:09 -0400
Message-ID: <1465579449-24112-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] LINALG: removed non-stand utility 'mmv' from makefile.
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
X-List-Received-Date: Fri, 10 Jun 2016 17:24:16 -0000
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


