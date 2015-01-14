Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4C55952A6D
	for <meta-arago@arago-project.org>;
	Wed, 14 Jan 2015 20:56:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0EKuQvc016493
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:56:26 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0EKuQXa001560
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:56:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 14:56:26 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0EKuPMR006566;	Wed, 14 Jan 2015 14:56:26 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0EKuM5E014703;	Thu, 15 Jan 2015 02:26:24 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Jan 2015 14:56:18 -0600
Message-ID: <1421268980-25002-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421268980-25002-1-git-send-email-fcooper@ti.com>
References: <1421268980-25002-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] arago-source-ipk: Add sitara-linux-ti-staging
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
X-List-Received-Date: Wed, 14 Jan 2015 20:56:27 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index f6e1da7..5159dbb 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -154,6 +154,11 @@ SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
 SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
 
+CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
+SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PACKAGE_ARCH_pn-sitara-linux-ti-staging = "${MACHINE_ARCH}"
+SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
+
 CREATE_SRCIPK_pn-linux-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-linux-keystone = "${MACHINE_ARCH}"
-- 
1.7.9.5


