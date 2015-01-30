Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 78A4452AC1
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:31:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMVqg0009951
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMVpFE021484
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:31:51 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMVoSi022648;	Fri, 30 Jan 2015 16:31:50 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMVf1r007326;	Sat, 31 Jan 2015 04:01:49 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:31:39 -0600
Message-ID: <1422657099-15544-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422657099-15544-1-git-send-email-fcooper@ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/6] sitara-linux-ti-staging: Simply package up the sources don't copy the defconfig
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
X-List-Received-Date: Fri, 30 Jan 2015 22:31:54 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Avoid creating a "new" defconfig when the one used by the recipe
  gives the same exact result.
* This also avoids the confusion people have when seeing a defconfig that
  doesn't exist in any other git tree.
* Doing this only makes sense if the defconfig is intree and not being patched.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/sitara-linux-ti-staging_3.14.bbappend    |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
index b0b1df2..7e8eaf2 100644
--- a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
@@ -1,9 +1,7 @@
-MACHINE_KERNEL_PR_append = "-arago0"
+MACHINE_KERNEL_PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-require copy-defconfig.inc
-
 KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
 kernel_do_configure_prepend() {
-- 
1.7.9.5


