Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 08D2A520DE
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 06:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCC6340BDE;
	Fri,  6 Sep 2019 06:12:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1EJ1j_o1IcLO; Fri,  6 Sep 2019 06:12:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9199F40A2D;
	Fri,  6 Sep 2019 06:12:22 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B62BD173E86;
	Fri,  6 Sep 2019 02:12:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  6 Sep 2019 02:12:21 -0400
Message-Id: <1567750341-2537-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] external-arm-toolchain, linux-libc-headers: update kernel headers to ti2019.03-rc4
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
X-List-Received-Date: Fri, 06 Sep 2019 06:13:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

This enables latest needed defines, such as PCITEST_CLEAR_IRQ, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend   | 2 +-
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
index 46c44cb..635b13d 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -4,7 +4,7 @@
 # duplication of code from corresponding recipe.
 
 BRANCH = "ti-linux-4.19.y"
-SRCREV = "8de817772462078a064b70d368eeae3b92a31439"
+SRCREV = "50ceb3c6e7f2d5f54d66d4999e79d3c4e09796df"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
index 4239437..d62fc06 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
@@ -1,9 +1,9 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 BRANCH = "ti-linux-4.19.y"
-SRCREV = "8de817772462078a064b70d368eeae3b92a31439"
+SRCREV = "50ceb3c6e7f2d5f54d66d4999e79d3c4e09796df"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


