Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4C9C9529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 21:43:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5LhKnM028116
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:43:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5LhJEU031738
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:43:20 -0600
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 15:43:19 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5LhJnp011072	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:43:19 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5LhJw10872	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:43:19 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 2447E110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 16:43:19 -0500 (EST)
Message-ID: <50BFBFF6.4070706@ti.com>
Date: Wed, 5 Dec 2012 16:43:18 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <50BFBF87.3000503@ti.com>
In-Reply-To: <50BFBF87.3000503@ti.com>
Subject: Re: [PATCH] New linux-bbxm-upstream-staging recipe
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
X-List-Received-Date: Wed, 05 Dec 2012 21:43:22 -0000
X-Groupsio-MsgNum: 650
Content-Type: multipart/mixed; boundary="------------070708060809080403040001"

--------------070708060809080403040001
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

With attachment now.

On 12/05/2012 04:41 PM, Carlos Hernandez wrote:
> AUTOREV recipe for github.com/pantoniou/linux-bbxm.git
>
> Please consider for meta-arago. Thanks,
> Carlos
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------070708060809080403040001
Content-Type: text/x-patch;
	name="0004-New-linux-bbxm-upstream-staging-recipe.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0004-New-linux-bbxm-upstream-staging-recipe.patch"

From d892092bdc78d3925f519b2b4ab3fe63ab5518de Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 17:35:07 -0500
Subject: [PATCH 04/12] New linux-bbxm-upstream-staging recipe

AUTOREV recipe for github.com/pantoniou/linux-bbxm.git

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../linux/linux-bbxm-upstream-staging_git.bb       |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-bbxm-upstream-staging_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-bbxm-upstream-staging_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-bbxm-upstream-staging_git.bb
new file mode 100644
index 0000000..886916a
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-bbxm-upstream-staging_git.bb
@@ -0,0 +1,29 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for bxm, based on mainline kernel"
+LICENSE = "GPLv2"
+KERNEL_IMAGETYPE = "uImage"
+
+inherit kernel
+
+S = "${WORKDIR}/git"
+
+BRANCH = "bbxm-mainline-fixes"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|dm37x-evm|am3517-evm|am387x-evm|am389x-evm|am335x-evm|beagleboard"
+
+PV = "3.0"
+KVER = "${PV}"
+
+MACHINE_KERNEL_PR_append = "+gitr${SRCPV}"
+
+SRC_URI = "git://github.com/pantoniou/linux-bbxm.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "${AUTOREV}"
+
+do_setup_defconfig() {
+        :
+}
+
+do_configure() {
+        make ARCH=arm omap3_bbxm_defconfig
+}
-- 
1.7.0.4


--------------070708060809080403040001--
