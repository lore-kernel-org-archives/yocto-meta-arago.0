Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 65C4B52972
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 19:45:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77JjBLJ007644
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77JjBZg017864
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 14:45:11 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s77JjAN7018142;	Thu, 7 Aug 2014 14:45:11 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s77Jj4IZ011788;	Fri, 8 Aug 2014 01:15:09 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Aug 2014 14:45:03 -0500
Message-ID: <1407440703-21811-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407440703-21811-1-git-send-email-fcooper@ti.com>
References: <1407440703-21811-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4 v2] linux-ti-staging: Use AM57x branch/git tree
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
X-List-Received-Date: Thu, 07 Aug 2014 19:45:12 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Currently AM57x support is hosted on a separate branch and git tree that is
  based on the latest u-boot-ti-staging integration tree.
* Point to this branch and git tree for am57xx-evm until it is merged.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/linux-ti-staging_3.14.bbappend           |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
index b178b5e..b25df8f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
@@ -1,4 +1,13 @@
-MACHINE_KERNEL_PR_append = "-arago1"
+MACHINE_KERNEL_PR_append = "-arago2"
+
+OLD_BRANCH := "${BRANCH}"
+SRC_URI_am57xx-evm := "${@oe_filter_out('git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${OLD_BRANCH}','${SRC_URI}', d)}"
+
+BRANCH_am57xx-evm = "beagle-x15-v3.14"
+
+SRC_URI_am57xx-evm += "git://git.ti.com/~nmenon/ti-linux-kernel/ti-linux-x15-validate.git;protocol=git;branch=${BRANCH}"
+
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb am57xx-beagle-x15.dtb"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-- 
1.7.9.5


