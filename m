Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2B0CB52A6C
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 22:34:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UMYocv001636
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:34:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMYo6G007577
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:34:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 30 Sep 2013 17:34:50 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMYhAC005788;
	Mon, 30 Sep 2013 17:34:48 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Sep 2013 18:19:27 -0500
Message-ID: <1380583168-2238-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1380583168-2238-1-git-send-email-fcooper@ti.com>
References: <1380583168-2238-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] arago-source-ipk.conf: Remove PR from u-boot-ti-staging
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
X-List-Received-Date: Mon, 30 Sep 2013 22:34:51 -0000
Content-Type: text/plain

* In the sources directory name the PR is unnecessary and also confusing for
  users.
* This also matches the look of linux-ti-staging sources directory.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index a321271..ef41d94 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -119,7 +119,7 @@ SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
 SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}-${PR}"
+SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
 
-- 
1.7.0.4


