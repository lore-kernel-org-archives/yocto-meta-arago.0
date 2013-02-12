Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id 14BF452A6B
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:47 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id h1so7005278oag.31
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=A8EBXkWykXoP7JM62BGswmd7kR85ShsmPc5W4341cqg=;
	b=oUfyIbVTg7mlXyKqpEq+hZbYEoG5UEifYt/aULnDLNUU5DJNyw69RThFVa8fCCULNl
	JmMZX/URHXHWVGb8imRrUGyYbFvV8pJbpFPB6WuMvxVMJ8Sjby4N93LSjikWFfwP3Omd
	jev11/U8L6YhIB8UJacWuJmhzsjVEdXGAof6gAsktQiP4dybXIZSXB+YyyT9Mw86kLLL
	TuVh+PlB4vtc+iKSoFagBe0TWKxmBfdU8qK2rtPxsAit04kIOEg68iTJJN8ztAG7NxoO
	swtvA7gpC0p+ijVv+PPYz39ncLJSZA9euRzMuAQQQf5Myc/POg3ItjGZlgSRsdYQp8jj
	nfMQ==
X-Received: by 10.60.22.198 with SMTP id g6mr12400815oef.45.1360630006389;
	Mon, 11 Feb 2013 16:46:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:44 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:12 -0600
Message-Id: <1360629979-24789-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/18] tisdk-amsdk-sdk-host: Add flash utility to SDK
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:47 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index e216e8e..14626c8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
@@ -13,8 +13,12 @@ KERNEL_SRC = ""
 U-BOOT_SRC_am335x-evm = "u-boot-src"
 KERNEL_SRC_am335x-evm = "linux-am335x-src"
 
+TOOLS = "pinmux-utility"
+TOOLS_am37x-evm_append = " flash-utility"
+TOOLS_am3517-evm_append = " flash-utility"
+
 RDEPENDS_${PN} = "\
-    pinmux-utility \
+    ${TOOLS} \
     ti-tisdk-setup \
     board-port-labs-src \
     ti-tisdk-makefile \
-- 
1.7.0.4


