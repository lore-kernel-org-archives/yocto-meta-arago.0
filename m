Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C7BD852A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 18:06:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H003HOBNF5030@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 13:06:51 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4DB2259B0; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:45 -0400
Message-id: <1403287009-11256-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 15/19] toolchain-linaro/gcc: remove DEFAULTTUNE settings that went to meta-ti
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
X-List-Received-Date: Fri, 20 Jun 2014 18:06:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 5 -----
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index f7c8032..530f3c3 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -2,11 +2,6 @@
 TCMODE = "default"
 TCLIBC = "eglibc"
 
-DEFAULTTUNE = "cortexa8thf-neon"
-DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
-DEFAULTTUNE_keystone = "cortexa15thf-neon"
-DEFAULTTUNE_omap4 = "cortexa9thf-neon"
-
 # Match some of the external vars
 TOOLCHAIN_SYS := "${TARGET_SYS}"
 TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 95269a7..26e69ae 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -3,11 +3,6 @@ TCMODE = "external-linaro"
 TCLIBC = "external-linaro-toolchain"
 
 ELT_TARGET_SYS = "arm-linux-gnueabihf"
-DEFAULTTUNE = "cortexa8thf-neon"
-DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
-DEFAULTTUNE_keystone = "cortexa15thf-neon"
-DEFAULTTUNE_omap4 = "cortexa9thf-neon"
-DEFAULTTUNE_ti43x = "cortexa9thf-neon"
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
 
-- 
2.0.0


