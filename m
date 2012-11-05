Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 954A75208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:32 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ORj9L6jGjvSOgqMW1fIZedyZIuETDz44ILTEP7vA/Cs=;
	b=eTYkyU0znDPCcVLbzdBl9sfe96h/BF2LUw4RkSMkYXPg6ASxAJ6vs4Ik9c8/hhr5Vd
	NWKSJyXK3KrD2V3/Oe6xX55r1+Ry/eLj9ejgdRAd0iM74hR5zWExp/9Q5I0tk7UllP6+
	0zW5MEiJNO8V2t7mvZRIVuQqhQUDjfmup3OnOm2Yuf1HPRYxdMDIDDab0kC+O2/VJs+4
	JcZnPNZW8h9Y3HQtCUA3w3eeJ4sv0RheVC6dxl/dLBlAChw012pSYogN3Y6cMUdo66/V
	KqeypZUwDgntnmTzbWL0YomqigXpg4eGT7196SU6vbawoKffXBC4rSOtdS8ncEwA3hDX
	o+hw==
Received: by 10.182.177.72 with SMTP id co8mr6737880obc.53.1352080472292;
	Sun, 04 Nov 2012 17:54:32 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:31 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:34 -0600
Message-Id: <1352080417-9792-37-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 39/42] u-boot: Add UVER and PSPREL
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:33 -0000

* Add UVER and PSPREL variable.
* These variables are usually located in a bbappend.
* When this recipe is moved to meta-ti then these changes should be taken
  out of the base recipe and placed in a bbappend inside meta-arago-distro.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index 1fed08b..31e64db 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -11,11 +11,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 COMPATIBLE_MACHINE = "ti33x|omap3"
 
+###################################################
+# When this recipe is moved to meta-ti these changes should go in a bbappend in meta-arago-distro.
+
+# PSPREL and UVER are used by arago-source-ipk.conf
+PSPREL = "05.06.00.00"
+UVER = "2012.10"
+###################################################
+
 DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


