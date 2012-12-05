Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2E887529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 21:45:01 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5Lj0nY028281
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:45:00 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5Lj0Mh000406
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:45:00 -0600
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 15:45:00 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5Lj0Gx011474	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:45:00 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5Lixw10945	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:45:00 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 9B85C110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 16:44:59 -0500 (EST)
Message-ID: <50BFC05B.5060803@ti.com>
Date: Wed, 5 Dec 2012 16:44:59 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
Subject: [PATCH] AUTOREV recipe for linux-next
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
X-List-Received-Date: Wed, 05 Dec 2012 21:45:03 -0000
X-Groupsio-MsgNum: 651
Content-Type: multipart/mixed; boundary="------------000500010909020007080306"

--------------000500010909020007080306
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Please consider for meta-arago. Thanks,
Carlos

--------------000500010909020007080306
Content-Type: text/x-patch; name="0005-AUTOREV-recipe-for-linux-next.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0005-AUTOREV-recipe-for-linux-next.patch"

From dc4644cda7ed91a1c0d42e54ac6701d7b2f0133b Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 17:37:57 -0500
Subject: [PATCH 05/12] AUTOREV recipe for linux-next

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-kernel/linux/linux-omap3-next_git.bb   |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omap3-next_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap3-next_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-omap3-next_git.bb
new file mode 100644
index 0000000..cd37147
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-omap3-next_git.bb
@@ -0,0 +1,20 @@
+require linux-omap3.inc
+
+DESCRIPTION = "Linux kernel for Omap3 from mainline kernel.org"
+
+BRANCH = "refs/heads/master"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|dm37x-evm|am3517-evm|am387x-evm|am389x-evm|am335x-evm|beagleboard"
+
+SRCREV = "${AUTOREV}"
+PV = "3.7"
+KVER = "${PV}"
+
+MACHINE_KERNEL_PR_append = "+gitr${SRCPV}"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=git;branch=${BRANCH}"
+
+SRC_URI_append_beagleboard = " file://beagleboard/defconfig \
+"
+SRC_URI_append_am335x-evm = " file://am335x-evm/defconfig \
+"
-- 
1.7.0.4


--------------000500010909020007080306--
