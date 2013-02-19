Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gh0-f180.google.com (mail-gh0-f180.google.com
	[209.85.160.180])
	by arago-project.org (Postfix) with ESMTPS id D2BC252A10
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 04:15:09 +0000 (UTC)
Received: by mail-gh0-f180.google.com with SMTP id f13so738192ghb.11
	for <meta-arago@arago-project.org>;
	Mon, 18 Feb 2013 20:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AlBE7VnlQdVfxEfKo2lVg3Vtpk6wgtdTk8FoULBLKzM=;
	b=ipsrRMO7UbBdQ476ZnlFjkhTdf8HdNIKwF8KIX8mzdacyHxVT4IVKBCPno5fLEICQ3
	qrQ+3V01EeV6D04nNz2n01cgzi7Vjim/D4R1PxjNIAR94xErDBrBgWj2QjD1GqHxB7lJ
	eeu7w8FFNX7qriAI3eImQRbzdxtgQXEHtYVCK7TUJ5DHqYaHbU2O+KFD2674/S2j0yxF
	xnebG9meMeJZH2yoSwWyDeOBtwEJyMlqnQHw18CJkslIShT8WFtlMeufHPVPWQYdNlao
	j9IfOAH2NJc+3WvYKVG5tU7V+zW72n4AhLZ059YQlHwlkMnSW+2XCIWssMWm27ZD1fmw
	QNTg==
X-Received: by 10.236.129.72 with SMTP id g48mr25875916yhi.102.1361247309053; 
	Mon, 18 Feb 2013 20:15:09 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm14089947yhh.5.2013.02.18.20.15.06
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 20:15:07 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 18 Feb 2013 22:14:54 -0600
Message-Id: <1361247294-10646-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/18 v2] arago-tisdk-amsdk-sdk-host: Use generic name for sources
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
X-List-Received-Date: Tue, 19 Feb 2013 04:15:10 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Use generic name for kernel and u-boot sources which will allow for any
  machine to be used without modification.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
v2 changes:
Changed KERNEL_SRC := to KERNEL_SRC =
Meta-ti added PREFERRED_PROVIDER_virtual/bootloader to all platforms.
So we can now use the generic variable instead of hardcoding u-boot-src.

 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 14626c8..0ac8d9d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,17 +1,15 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # Choose the kernel and u-boot recipe sources to use
-U-BOOT_SRC = ""
-KERNEL_SRC = ""
 
-U-BOOT_SRC_am335x-evm = "u-boot-src"
-KERNEL_SRC_am335x-evm = "linux-am335x-src"
+U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
+KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
 
 TOOLS = "pinmux-utility"
 TOOLS_am37x-evm_append = " flash-utility"
-- 
1.7.0.4


