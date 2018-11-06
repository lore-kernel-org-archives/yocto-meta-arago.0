Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1D72C52092
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50C9320B66;
	Tue,  6 Nov 2018 21:23:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rbg9Nejn3kwi; Tue,  6 Nov 2018 21:23:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AED1206F3;
	Tue,  6 Nov 2018 21:23:11 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BEAF1164D0C;
	Tue,  6 Nov 2018 16:23:10 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  6 Nov 2018 16:23:07 -0500
Message-Id: <1541539388-7197-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] external-linaro-toolchain, linux-libc-headers: update to pull backport of uvc
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
X-List-Received-Date: Tue, 06 Nov 2018 21:23:22 -0000

g_uvc.h UAPI has been backported from 4.19. Need to use it for uvc-gadget app.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend  | 2 +-
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
index 8addc91..02760d8 100644
--- a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -4,7 +4,7 @@
 # duplication of code from corresponding recipe.
 
 BRANCH = "ti-lsk-linux-4.14.y"
-SRCREV = "3bacc614e300e497679bdd7d2759f486e713f373"
+SRCREV = "3e50654361c34b75784ab7c8c9aa8e96b3a37fc1"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
index c313ca2..5c54e56 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
@@ -3,7 +3,7 @@ require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 PR_append = ".arago0"
 
 BRANCH = "ti-lsk-linux-4.14.y"
-SRCREV = "3bacc614e300e497679bdd7d2759f486e713f373"
+SRCREV = "3e50654361c34b75784ab7c8c9aa8e96b3a37fc1"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


