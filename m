Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B6D5C529A8
	for <meta-arago@arago-project.org>;
	Wed,  5 Jun 2013 18:12:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55ICD5C015945
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2013 13:12:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55ICDdg026478
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2013 13:12:13 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Jun 2013 13:12:13 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r55ICAE6015625;
	Wed, 5 Jun 2013 13:12:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Jun 2013 13:18:24 -0500
Message-ID: <1370456304-24608-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-source-ipk: Add sources for u-boot-dra7xx
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
X-List-Received-Date: Wed, 05 Jun 2013 18:12:14 -0000
Content-Type: text/plain

* Add the source-ipk settings for the u-boot-dra7xx recipe in
  order for the SDK to build properly.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 912ec36..11a66ca 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -119,6 +119,10 @@ CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}-${PR}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
+SRCIPK_PACKAGE_ARCH_pn-u-boot-dra7xx = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-u-boot-am180x = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am180x = "board-support/u-boot-${UVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-am180x = "${MACHINE_ARCH}"
-- 
1.7.0.4


