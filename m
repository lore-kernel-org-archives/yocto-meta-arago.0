Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 74FB752A71
	for <meta-arago@arago-project.org>;
	Tue, 15 Jul 2014 11:28:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6FBSgNp028049
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:42 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FBSgMM031012
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 15 Jul 2014 06:28:42 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6FBSfJv002198;	Tue, 15 Jul 2014 06:28:42 -0500
Received: from sdit-build04.dal.design.ti.com (sdit-build04.dal.design.ti.com
	[10.247.66.55])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s6FBSbVS017717;	Tue, 15 Jul 2014 16:58:40 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Jul 2014 06:28:33 -0500
Message-ID: <1405423715-21885-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] arago-source-ipk: do a shallow clone of the kernel
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
X-List-Received-Date: Tue, 15 Jul 2014 11:28:43 -0000
Content-Type: text/plain

* Without this shallow clone the kernel sources is 1.5GB. With
  a shallow clone the kernel sources are 762MB which is much
  more reasonable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index f6b682d..ccb6e2d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -152,6 +152,7 @@ CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
 
 CREATE_SRCIPK_pn-linux-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
-- 
1.7.9.5


