Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AD5DC529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:35:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IZXpn019584
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:35:33 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IZXdS016346
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:35:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 12:35:33 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IZSG7008984;
	Wed, 5 Feb 2014 12:35:32 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Feb 2014 14:04:02 -0600
Message-ID: <1391630646-9727-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] arago-source-ipk: Add Keystone sourceipk settings
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 18:35:34 -0000
Content-Type: text/plain

* Add settings to make the Keystone u-boot and kernel sourceipks

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 19034b6..231e13d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -120,6 +120,11 @@ SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
 
+CREATE_SRCIPK_pn-u-boot-keystone = "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-keystone = "board-support/u-boot-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-u-boot-keystone = "${MACHINE_ARCH}"
+SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
+
 CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-dra7xx = "${MACHINE_ARCH}"
@@ -145,6 +150,11 @@ SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
 
+CREATE_SRCIPK_pn-linux-keystone = "1"
+SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-linux-keystone = "${MACHINE_ARCH}"
+SRCIPK_PRESERVE_GIT_pn-linux-keystone = "true"
+
 CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omapl138-psp = "${MACHINE_ARCH}"
-- 
1.7.0.4


