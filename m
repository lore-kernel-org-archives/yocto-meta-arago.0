Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by arago-project.org (Postfix) with ESMTPS id 6FB9C52A12
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:30 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id j1so6921485oag.21
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HH7s1zvl6J9xPvpqmE31f8zLBWY8bnwPpecgC2AmuVM=;
	b=wlm4N8n6ZX03s9gg4YSAX1PWLGizXpw7KJ6rFsxlUGX/MIFCtX2AMYG9140ePATW3M
	bu6PoWJVPmR+KfppY9zsH2q7iQU2a/xhTQymQOy5slWY/ea9hVcuygAjkTLr7uY2ByeA
	BasYHXjNit0Jo0wAiaKNjL+Zddp0+PftLjtStTITb2x8Vd6ZkBPQg0ABggYDbmAu8T1O
	6Xe2JAQWqE3rqrBPvSU2NJNqexArb7+p1Idls1ZCgOhj6oTKxYjXiXjKZkMm0ivSZf01
	gynrudI2yHHMGpdPhbDG+lBD3ywjZbUmlWQ7HzNM2RTjlqXdVGkoY8M6xdXeMlJdfx82
	MahA==
X-Received: by 10.60.171.175 with SMTP id av15mr11951650oec.75.1360629989924; 
	Mon, 11 Feb 2013 16:46:29 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.27
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:28 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:03 -0600
Message-Id: <1360629979-24789-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/18] ti-tisdk-makefile: Switch from ARMPKGARCH to PLATFORM_ARCH
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:30 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Use PLATFORM_ARCH variable to allow omapl138 devices to pass armv5te which is
  expected by other software that uses Rules.make

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index c6cea95..99e0484 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "\
     file://Makefile_wireless \
 "
 
-PR = "r4"
+PR = "r5"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -61,6 +61,10 @@ MAKEFILES_am180x-evm += "pru \
                          wireless \
 "
 
+PLATFORM_ARCH = "${ARMPKGARCH}"
+# Use ARCH format expected by the makefile
+PLATFORM_ARCH_omapl138 = "armv5te"
+
 # This step will stitch together the final Makefile based on the supported
 # make targets.
 do_install () {
@@ -104,7 +108,7 @@ do_install () {
 
     # fixup Rules.make values
     sed -i -e "s/__PLATFORM__/${MACHINE}/" ${D}/Rules.make
-    sed -i -e "s/__ARCH__/${ARMPKGARCH}/" ${D}/Rules.make
+    sed -i -e "s/__ARCH__/${PLATFORM_ARCH}/" ${D}/Rules.make
     sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
 
 }
-- 
1.7.0.4


