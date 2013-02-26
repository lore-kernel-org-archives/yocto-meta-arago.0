Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 5F4EE52A6B
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:03 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n12so4361999oag.41
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ME1449UVPN4SylA1qksNYhLlQpjxyR0Tkzb9WVNU9no=;
	b=b1aXY46PqeeI/r49rlwbiZoCnbHwydiLXBm4e8WHHqygtpTBcSySlkq+cz497/gJyo
	8sw5BelUZ+6un1zxWDd6W76P3jxl2NzinlLC0vYdu5QMIPW6RN726OKqxUU7f7i2dk1x
	O7TyPo2KwPsOhODCApDO0dgUOc7sfJfTD5MPQn7KrGNeXUOehlAiT5Ec/0vansiWH43/
	0mkNVs1LA3sEX+pQHU+erQxB1Ojr69R9RovhwYrF0ik0+BcTtqOHH1z2KS1VlQVKjvkI
	QKbt3pAP7wslhqKKoF6imSENpwpPHcOpdZxsEm+jmXXdP9Fr8PScs1VAdXL9gVQ9H08D
	mZUQ==
X-Received: by 10.182.52.102 with SMTP id s6mr10106480obo.87.1361849582899;
	Mon, 25 Feb 2013 19:33:02 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:01 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:46 -0600
Message-Id: <1361849574-7710-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/10] arago-tisdk-amsdk-sdk-host: Use generic name for sources
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:03 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Use generic name for kernel and u-boot sources which will allow for any
  machine to be used without modification.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
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


