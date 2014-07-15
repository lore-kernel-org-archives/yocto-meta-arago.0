Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2B64352A71
	for <meta-arago@arago-project.org>;
	Tue, 15 Jul 2014 11:28:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6FBSjH2018340
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FBSjhD030616
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 15 Jul 2014 06:28:45 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6FBSic6023496;	Tue, 15 Jul 2014 06:28:45 -0500
Received: from sdit-build04.dal.design.ti.com (sdit-build04.dal.design.ti.com
	[10.247.66.55])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s6FBSbVU017717;	Tue, 15 Jul 2014 16:58:43 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Jul 2014 06:28:35 -0500
Message-ID: <1405423715-21885-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] linux-ti-staging: update bbappend for 3.14 version
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
X-List-Received-Date: Tue, 15 Jul 2014 11:28:46 -0000
Content-Type: text/plain

* Update the bbappend for the linux-ti-staging to work with the
  3.14 kernel version.
* Set the kernel to AUTOREV while developing the latest 3.14 kernel

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ....12.bbappend => linux-ti-staging_3.14.bbappend} |    2 ++
 1 file changed, 2 insertions(+)
 copy meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbappend => linux-ti-staging_3.14.bbappend} (94%)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
similarity index 94%
copy from meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
copy to meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
index 2a6f090..b178b5e 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
@@ -6,6 +6,8 @@ require copy-defconfig.inc
 
 KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
+SRCREV = "${AUTOREV}"
+
 kernel_do_configure_prepend() {
     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
     then
-- 
1.7.9.5


