Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5BCC952A6D
	for <meta-arago@arago-project.org>;
	Wed, 14 Jan 2015 20:56:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0EKuR9m015179
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:56:27 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0EKuRgs016909
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:56:27 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 14:56:27 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0EKuQGJ015752;	Wed, 14 Jan 2015 14:56:27 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0EKuM5F014703;	Thu, 15 Jan 2015 02:26:25 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Jan 2015 14:56:19 -0600
Message-ID: <1421268980-25002-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421268980-25002-1-git-send-email-fcooper@ti.com>
References: <1421268980-25002-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] sitara-linux-ti-staging: Add append to insure kernel sources are packaged
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
X-List-Received-Date: Wed, 14 Jan 2015 20:56:28 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...ppend => sitara-linux-ti-staging_3.14.bbappend} |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 copy meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbappend => sitara-linux-ti-staging_3.14.bbappend} (90%)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
similarity index 90%
copy from meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
copy to meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
index 2a6f090..b0b1df2 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = "-arago1"
+MACHINE_KERNEL_PR_append = "-arago0"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-- 
1.7.9.5


