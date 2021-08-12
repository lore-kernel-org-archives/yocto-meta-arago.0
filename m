Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3737352A5A
	for <meta-arago@arago-project.org>;
	Thu, 12 Aug 2021 18:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE7D240C8E;
	Thu, 12 Aug 2021 18:22:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LxYBZ9m0utyK; Thu, 12 Aug 2021 18:22:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8832740BEC;
	Thu, 12 Aug 2021 18:22:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 42633174653;
	Thu, 12 Aug 2021 14:22:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Aug 2021 14:22:17 -0400
Message-Id: <1628792537-4699-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Tom Rini <trini@konsulko.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH] grub and grub-efi break in do_configure() when using external-arm toolchain:
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
X-List-Received-Date: Thu, 12 Aug 2021 18:22:12 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

| checking for aarch64-poky-linux-objcopy... no
| checking for objcopy... objcopy
| checking for aarch64-poky-linux-strip... no
| checking for strip... strip
| checking for aarch64-poky-linux-nm... no
| checking for nm... nm
| checking for aarch64-poky-linux-ranlib... no
| checking for ranlib... ranlib
...
| checking whether objcopy works for absolute addresses... configure: error: objcopy cannot create binary files

That is due to external-arm toolchain's target triplet aarch64-none-linux-gnu
being different from OE triplet like aarch64-poky-linux and configure script
trying to use it to find binutils binaries like objcopy, falling back to host
ones.

Help configure script to find correct objcopy and other binaries by passing
the correct target triplet with --target parameter set to EAT_TARGET_SYS,
overriding the default OE one.

Note: similar patch has been submitted upstream to meta-arm-toolchain:
https://lists.yoctoproject.org/g/meta-arm/message/2163

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Tom Rini <trini@konsulko.com>
---
 meta-arago-distro/recipes-bsp/grub/grub%.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/grub/grub%.bbappend

diff --git a/meta-arago-distro/recipes-bsp/grub/grub%.bbappend b/meta-arago-distro/recipes-bsp/grub/grub%.bbappend
new file mode 100644
index 0000000..1e5ea43
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/grub/grub%.bbappend
@@ -0,0 +1,9 @@
+# When external-arm toolchain is not in use, EAT_TARGET_SYS is undefined,
+# causing below _append expansion to break - just weakly set it to empty
+EAT_TARGET_SYS ?= ""
+
+# grub uses --target triplet to find binutils binaries such as objcopy
+# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
+# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
+# toolchain, grub needs passing the correct --target to configure script
+CONFIGUREOPTS_append_class-target = "${@['',' --target=${EAT_TARGET_SYS}'][d.getVar('TCMODE') == 'external-arm']}"
-- 
2.7.4


