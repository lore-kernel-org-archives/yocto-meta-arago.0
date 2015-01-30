Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DE50D52AB4
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:31:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMVpVU009945
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:51 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMVo6E021466
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:50 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:31:49 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMVmuZ017989;	Fri, 30 Jan 2015 16:31:49 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMVf1q007326;	Sat, 31 Jan 2015 04:01:47 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:31:38 -0600
Message-ID: <1422657099-15544-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422657099-15544-1-git-send-email-fcooper@ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6] arago-source-ipk: Enable shallow clone for sitara-linux-ti-staging
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
X-List-Received-Date: Fri, 30 Jan 2015 22:31:52 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Also increase the shallow clone depth

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 5159dbb..1a5cf1b 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -158,6 +158,8 @@ CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PACKAGE_ARCH_pn-sitara-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
+SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging = "true"
+SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging = "400
 
 CREATE_SRCIPK_pn-linux-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
-- 
1.7.9.5


