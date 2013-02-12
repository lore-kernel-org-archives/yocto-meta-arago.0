Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id E742952A55
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:48 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so6821976oag.8
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=F+rjHq9k+rDWVYYuZPgC5lxam0rrDEck5rt3jlNVXnI=;
	b=jbEdkRkCXtJ+aE4blYgJvyqnb6OLrDT2SmJXvZg8YnoWLl69OjUlmRrAfmBXLTw6zD
	TPxFVIZ329wzVZe9HOpsCkbPkFWbYJpUrUWpzCw4PhS2A3lWyR0XqPfo1bV00BfLkhZ0
	lepwXxRigUXce6brtkdaZdvkW9cuVlYRB0Dm+wYNlZbPKAJ4euAlhTY519BUwuM+yt9s
	tACyNXjARhCL/5zA1QoitGQPFF7BaBvLLvVaovl/2lCY9avbr3dk+Ms3KrwXU65vLKr9
	mwR34F0iKIlsdWmtMIvtFwsEEm3hEd7aGf82HR7TJZw4l7bTMtuoN+J5VQpl2EVldgxm
	sCTA==
X-Received: by 10.182.86.196 with SMTP id r4mr11856960obz.56.1360630008364;
	Mon, 11 Feb 2013 16:46:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:47 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:13 -0600
Message-Id: <1360629979-24789-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use generic name for kernel sources
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:49 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Use generic name for kernel sources which will allow for any machine to be
  used without modification.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 14626c8..b990235 100644
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
+U-BOOT_SRC  = "u-boot-src"
+KERNEL_SRC := "${PREFERRED_PROVIDER_virtual/kernel}-src"
 
 TOOLS = "pinmux-utility"
 TOOLS_am37x-evm_append = " flash-utility"
-- 
1.7.0.4


