Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 20D04529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 21:48:12 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5LmB1V005038
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:48:11 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5LmBG9003216
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:48:11 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 15:48:10 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5LmB0H019647	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:48:11 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5LmAw11099	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:48:10 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 2AE9B110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 16:48:10 -0500 (EST)
Message-ID: <50BFC119.7050004@ti.com>
Date: Wed, 5 Dec 2012 16:48:09 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
Subject: [PATCH] linux-stable recipe
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
X-List-Received-Date: Wed, 05 Dec 2012 21:48:13 -0000
X-Groupsio-MsgNum: 652
Content-Type: multipart/mixed; boundary="------------090506070304050502020109"

--------------090506070304050502020109
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

The nightly build script takes care of:
1) checking if there is a new tag
2) In case there is, set SRCREV to new tag and build.

Please consider for meta-arago. Thanks,
Carlos

--------------090506070304050502020109
Content-Type: text/x-patch; name="0007-linux-stable-recipe.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0007-linux-stable-recipe.patch"

From e3d2c97ed7adbe9a7123484bc4ff36b86dd6f795 Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 17:42:41 -0500
Subject: [PATCH 07/12] linux-stable recipe

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-kernel/linux/linux-omap3-stable_git.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omap3-stable_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap3-stable_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-omap3-stable_git.bb
new file mode 100644
index 0000000..e59f334
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-omap3-stable_git.bb
@@ -0,0 +1,20 @@
+require linux-omap3.inc
+
+DESCRIPTION = "Linux kernel for Omap3 from mainline kernel.org"
+
+BRANCH = "refs/heads/master"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|dm37x-evm|am3517-evm|am387x-evm|am389x-evm|am335x-evm|beagleboard"
+
+SRCREV = "v3.2.9"
+PV = "3.6"
+KVER = "${PV}"
+
+MACHINE_KERNEL_PR_append = "+gitr${SRCPV}"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH}"
+
+SRC_URI_append_beagleboard = " file://beagleboard/defconfig \
+"
+SRC_URI_append_am335x-evm = " file://am335x-evm/defconfig \
+"
-- 
1.7.0.4


--------------090506070304050502020109--
