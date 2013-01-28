Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by arago-project.org (Postfix) with ESMTPS id E663452A99
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:23 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so3068059obc.34
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JyZnB6aJjuM29iTW5oQirwvSfhKdJHlazKBm52UpV/Q=;
	b=MLf2rFpk8TtbAcQ69GMVdQntP4GiLxjLGQ6mkkCaiLN8+gxtEZguvVop75Ii98GKUw
	Js415wtwgD+TbFFurhLgBwV4s3qAPZwa/rryBo9NsXk68Iqblup8uts/kitMglu6dq4v
	YTCrlPrVc82BVXCq5XyvUVE0eGy4UHo3Ks/2tAYuTP7AW03xkHtaevzQRPB8n5tYLSYA
	GkJVX889Hse3py62BHIayzBT03Pi1bQ8T8/prQrryf2hcAryIIQRQvm2PvUYJ6vx6Tvc
	LaiTwBh6/T28OJ0leEKXM8oIR03BvJcv9VTXiRabO0Bzdbl/iOQ2h5LkZJuyJnjYBdNW
	R2KA==
X-Received: by 10.182.183.2 with SMTP id ei2mr6218053obc.84.1359393983206;
	Mon, 28 Jan 2013 09:26:23 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.21
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:22 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:25 -0600
Message-Id: <1359393932-31361-25-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 25/32] linux-am335x_3.2.0-psp05.06.00.00: Limit Smartreflex to PG 1.0 silicon
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:24 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Some support for PG 2.0 has been added to the kernel but additional time is
  needed to perform proper characterization of Smartreflex on PG 2.0 silicon.
* Until the proper test are done Smartreflex will be disabled for PG 2.0.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0002-Smartreflex-limited-to-ES-1.0.patch       |   35 ++++++++++++++++++++
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    7 ++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-Smartreflex-limited-to-ES-1.0.patch

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-Smartreflex-limited-to-ES-1.0.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-Smartreflex-limited-to-ES-1.0.patch
new file mode 100644
index 0000000..dd07c40
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-Smartreflex-limited-to-ES-1.0.patch
@@ -0,0 +1,35 @@
+From 24051291ecae9c42697bd3217240205e17e95de3 Mon Sep 17 00:00:00 2001
+From: Greg Guyotte <gguyotte@ti.com>
+Date: Tue, 11 Dec 2012 21:53:24 -0600
+Subject: [PATCH 2/2] Smartreflex limited to ES 1.0
+
+Pending complete characterization of Smartreflex on ES 2.0 silicon,
+the smartreflex function is disabled.  SR continues to operate
+normally on ES 1.0 silicon.  If running on AM335x ES 2.0 silicon,
+the SR driver will cleanly abort, causing no side effects.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+---
+ arch/arm/mach-omap2/am33xx-smartreflex-class2.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/am33xx-smartreflex-class2.c b/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+index 3ed74b3..6a66e68 100644
+--- a/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
++++ b/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+@@ -763,6 +763,12 @@ static int __init am33xx_sr_probe(struct platform_device *pdev)
+ 	int ret;
+ 	int i,j;
+ 
++	if (omap_rev() != AM335X_REV_ES1_0) {
++		dev_err(&pdev->dev, "%s: Smartreflex requires ES 1.0\n",
++		       	__func__);
++		return -EINVAL;
++	}
++
+ 	sr_info = kzalloc(sizeof(struct am33xx_sr), GFP_KERNEL);
+ 	if (!sr_info) {
+ 		dev_err(&pdev->dev, "%s: unable to allocate sr_info\n",
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index bc27dfb..ad20c69 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -67,8 +67,9 @@ PATCHES += "file://0001-am33x-Add-memory-addresses-for-crypto-modules.patch \
 # Add SmartReflex support early driver patches while working to get the driver
 # upstream.
 PATCHES += "file://0001-am33xx-Add-SmartReflex-support.patch \
-                file://0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch \
-               "
+            file://0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch \
+            file://0002-Smartreflex-limited-to-ES-1.0.patch \
+           "
 
 # Add a patch to the omap-serial driver to allow suspend/resume during
 # Bluetooth traffic
-- 
1.7.0.4


