Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 82F3052007
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 16:32:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6CGW6Yk017555
	for <meta-arago@arago-project.org>; Tue, 12 Jul 2016 11:32:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6CGW6Cl031330
	for <meta-arago@arago-project.org>; Tue, 12 Jul 2016 11:32:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Jul 2016 11:32:06 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6CGW6oH009940;	Tue, 12 Jul 2016 11:32:06 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Jul 2016 12:31:28 -0400
Message-ID: <1468341088-8431-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] posix-smp-demo: update branch and bump SRCREV
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
X-List-Received-Date: Tue, 12 Jul 2016 16:32:08 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
index 84d159a..ec46f43 100644
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
+++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
@@ -5,16 +5,16 @@ LIC_FILES_CHKSUM = "file://dhry.h;beginline=1;endline=377;md5=8f2fbe6e071d9ea4af
 
 POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
 POSIX_SMP_GIT_PROTOCOL = "git"
-POSIX_SMP_GIT_BRANCH = "sbl_prep"
+POSIX_SMP_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.POSIX-SMP.01.00.00.01"
-POSIX_SMP_SRCREV = "55d7fd4c60c9d513932a86df3df8dee0244208e0"
+POSIX_SMP_SRCREV = "ed013f29b8651d7fbc4aaf14a23c80880ee6a565"
 
 BRANCH = "${POSIX_SMP_GIT_BRANCH}"
 SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${POSIX_SMP_SRCREV}"
 PV = "01.00.00.01"
-INC_PR = "r1"
+INC_PR = "r2"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


