Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 93068529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 21:53:36 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5LrZ6R005562
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:53:35 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5LrZvh007630
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:53:35 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 15:53:35 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5LrZFZ021716	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:53:35 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5LrZw11362	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:53:35 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id CDD82110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 16:53:34 -0500 (EST)
Message-ID: <50BFC25E.9040308@ti.com>
Date: Wed, 5 Dec 2012 16:53:34 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
Subject: [PATCH] linux-beagle-staging recipe
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
X-List-Received-Date: Wed, 05 Dec 2012 21:53:37 -0000
X-Groupsio-MsgNum: 654
Content-Type: multipart/mixed; boundary="------------010002000901070209030501"

--------------010002000901070209030501
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This recipe is used by nightly build framework to build kernel
based on github.com/beagleboard/kernel.git.

The automation script modifies the SRC_URI on the fly to add the
latest set of patches stage at github.com/beagleboard/kernel.git

Please consider for meta-arago. Thanks,
Carlos


--------------010002000901070209030501
Content-Type: text/x-patch; name="0009-linux-beagle-staging-recipe.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0009-linux-beagle-staging-recipe.patch"

From b469ddaf7bc992edda38327c834a37489d23fc63 Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 17:46:09 -0500
Subject: [PATCH 09/12] linux-beagle-staging recipe

This recipe is used by nightly build/test framework to build kernel
based on github.com/beagleboard/kernel.git.
The automation script modifies the SRC_URI on the fly to add the
latest set of patches stage at github.com/beagleboard/kernel.git

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../linux/linux-beagle-staging_git.bb              |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-beagle-staging_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-beagle-staging_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-beagle-staging_git.bb
new file mode 100644
index 0000000..dda8ba3
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-beagle-staging_git.bb
@@ -0,0 +1,24 @@
+require linux-omap3.inc
+require setup-dtb.inc
+
+KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
+
+DESCRIPTION = "Linux kernel for Beagle boards from github.com/beagleboard/kernel.git"
+
+BRANCH = "refs/heads/master"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|dm37x-evm|am3517-evm|am387x-evm|am389x-evm|am335x-evm|beagleboard"
+
+SRCREV = "v3.7-rc3"
+PV = "3.7"
+KVER = "${PV}"
+
+MACHINE_KERNEL_PR_append = "+gitr${SRCPV}"
+
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;branch=${BRANCH}"
+
+SRC_URI_append_beagleboard = " file://beagleboard/defconfig \
+"
+SRC_URI_append_am335x-evm = " file://am335x-evm/defconfig \
+"
-- 
1.7.0.4


--------------010002000901070209030501--
