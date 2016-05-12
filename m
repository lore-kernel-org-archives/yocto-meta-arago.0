Return-Path: <a0869574local@uda0869574b>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3DBB7529A5
	for <meta-arago@arago-project.org>;
	Thu, 12 May 2016 15:37:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4CFblnN020140
	for <meta-arago@arago-project.org>; Thu, 12 May 2016 10:37:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CFbkDj014158
	for <meta-arago@arago-project.org>; Thu, 12 May 2016 10:37:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 May 2016 10:37:46 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CFbkDr013223;
	Thu, 12 May 2016 10:37:46 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1b0sgM-0001fF-AR;
	Thu, 12 May 2016 11:37:46 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 May 2016 11:37:40 -0400
Message-ID: <1463067460-6348-2-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463067460-6348-1-git-send-email-xuj@ti.com>
References: <1463067460-6348-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
Subject: [master][PATCH 2/2] LINALG changes: 1. fixed potential memory leakage in ARM wrapper code 2. added offload tables for AM572x 3. cleaned up tuning code 4. added -ldl to linker options for building the examples
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
 meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index bb8efdf..4bf870d 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
 LICENSE = "BSD-3-Clause"
 
 PV = "1_2_0_0"
-INC_PR = "r1"
+INC_PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
 LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
-SRCREV = "5e435f2457565ed7c6199406ef248370bb2a4ad2"
+SRCREV = "a7bc95a18a6ba11dbfc91dd65e16a478b756162c"
 
 DEPENDS = "common-csl-ip \
            libarch \
-- 
1.9.1


