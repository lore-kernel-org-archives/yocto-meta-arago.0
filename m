Return-Path: <dannenberg@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 960795299C
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2015 20:44:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t76Ki11Z028022
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2015 15:44:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76Ki138024789
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2015 15:44:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 15:44:01 -0500
Received: from borg.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t76Ki11r011031;	Thu, 6 Aug 2015 15:44:01 -0500
From: Andreas Dannenberg <dannenberg@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Aug 2015 15:43:51 -0500
Message-ID: <1438893831-10514-1-git-send-email-dannenberg@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago-gpl-notice: Fix spelling mistake in user-facing GPL notice
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
X-List-Received-Date: Thu, 06 Aug 2015 20:44:02 -0000
Content-Type: text/plain

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb     | 2 +-
 .../arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index e9757c5..d9d3710 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Script to warn users of GPLv3 content on the target file system a
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}"
 
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
index 090735b..08cb3b4 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
@@ -36,7 +36,7 @@ then
 cat << EOM 2>&1
 ***************************************************************
 ***************************************************************
-NOTICE: This file system contains the followin GPLv3 packages:
+NOTICE: This file system contains the following GPLv3 packages:
 EOM
     echo -e $gplv3_packages 2>&1
 cat << EOM 2>&1
-- 
1.9.1


