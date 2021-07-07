Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C4EBD52AA7
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 07:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1081D40BD6;
	Wed,  7 Jul 2021 07:41:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JIKeJKxrnH4J; Wed,  7 Jul 2021 07:41:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB07540BA8;
	Wed,  7 Jul 2021 07:41:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 495D817461B;
	Wed,  7 Jul 2021 03:41:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  7 Jul 2021 03:41:38 -0400
Message-Id: <1625643698-32948-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH][dunfell/master] linux-libc-headers: update to 5.10 kernel headers
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
X-List-Received-Date: Wed, 07 Jul 2021 07:41:38 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

This recipe is used when building using an internal toolchain. Use the same
commit ID as for external-arm-toolchain.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../{linux-libc-headers_5.4.bb => linux-libc-headers_5.10.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.4.bb => linux-libc-headers_5.10.bb} (80%)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
similarity index 80%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
index c0a3709..0dabbfd 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
@@ -4,8 +4,8 @@ PR_append = ".arago0"
 
 DEPENDS += "rsync-native"
 
-BRANCH = "ti-linux-5.4.y"
-SRCREV = "1661da3fddf4cc3f62796ecfb5c572f1e5361bdf"
+BRANCH = "ti-linux-5.10.y"
+SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


