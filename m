Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C240E529DD
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:51:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMpKZ5011007
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:51:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMpJBk022634
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:51:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:51:19 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMpI0g029526;	Fri, 30 Jan 2015 16:51:19 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMpGS5011234;	Sat, 31 Jan 2015 04:21:17 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:51:15 -0600
Message-ID: <1422658275-18596-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6 v2] arago-source-ipk: Enable shallow clone for sitara-linux-ti-staging
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
X-List-Received-Date: Fri, 30 Jan 2015 22:51:22 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Also increase the shallow clone depth

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Changes to V2:
Add missing quote

 .../conf/distro/arago-source-ipk.conf              |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 5159dbb..b457504 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -158,6 +158,8 @@ CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PACKAGE_ARCH_pn-sitara-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
+SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging = "true"
+SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging = "400"
 
 CREATE_SRCIPK_pn-linux-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
-- 
1.7.9.5


