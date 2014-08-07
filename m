Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3B44552972
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 19:45:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77JjAqK032163
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77JjAdJ008739
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 14:45:10 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s77Jj9sX003253;	Thu, 7 Aug 2014 14:45:10 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s77Jj4IY011788;	Fri, 8 Aug 2014 01:15:08 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Aug 2014 14:45:02 -0500
Message-ID: <1407440703-21811-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407440703-21811-1-git-send-email-fcooper@ti.com>
References: <1407440703-21811-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4 v2] u-boot-ti-staging: Use AM57x branch/git tree
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
X-List-Received-Date: Thu, 07 Aug 2014 19:45:11 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Currently AM57x support is hosted on a separate branch and git tree that is
  based on the latest u-boot-ti-staging integration tree.
* Point to this branch and git tree for am57xx-evm until it is merged.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot-ti-staging_2014.07.bbappend      |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index 5b6ab64..1243058 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,6 +1,17 @@
 # Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so that
 # we can test the latest mainline
 
-PR_append = "-arago1+gitr${SRCPV}"
+PR_append = "-arago2+gitr${SRCPV}"
+
+# AM57x EVM is currently on a seperate git tree/branch.
+# Once the software has been integrated to the u-boot-ti-staging
+# repository these lines can be removed.
+
+OLD_BRANCH := "${BRANCH}"
+SRC_URI_am57xx-evm := "${@oe_filter_out('git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${OLD_BRANCH}','${SRC_URI}', d)}"
+
+BRANCH_am57xx-evm = "beaglex15"
+
+SRC_URI_am57xx-evm += "git://github.com/felipebalbi/u-boot.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "${AUTOREV}"
-- 
1.7.9.5


