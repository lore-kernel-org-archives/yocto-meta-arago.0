Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 52DA25298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 22:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 638AA40C1C;
	Tue, 11 Feb 2020 22:21:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Mh6rcTIUldgQ; Tue, 11 Feb 2020 22:21:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D92040BCC;
	Tue, 11 Feb 2020 22:21:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DF00F1743F8;
	Tue, 11 Feb 2020 17:21:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 11 Feb 2020 17:21:30 -0500
Message-Id: <1581459690-29439-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] linux-libc-headers, external-arm-toolchain: update to the latest to include remoteproc uapi
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
X-List-Received-Date: Tue, 11 Feb 2020 22:23:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend     | 2 +-
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
index 4a57fad..0dfb3f5 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -4,7 +4,7 @@
 # duplication of code from corresponding recipe.
 
 BRANCH = "ti-linux-5.4.y"
-SRCREV = "c65c87b98f8d1b647c13b5bb36e5ffbad5805ff1"
+SRCREV = "1661da3fddf4cc3f62796ecfb5c572f1e5361bdf"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
index 74b676a..c0a3709 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
@@ -5,7 +5,7 @@ PR_append = ".arago0"
 DEPENDS += "rsync-native"
 
 BRANCH = "ti-linux-5.4.y"
-SRCREV = "c65c87b98f8d1b647c13b5bb36e5ffbad5805ff1"
+SRCREV = "1661da3fddf4cc3f62796ecfb5c572f1e5361bdf"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


