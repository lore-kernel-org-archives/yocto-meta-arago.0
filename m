Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C96AA52AB8
	for <meta-arago@arago-project.org>;
	Thu,  8 Jul 2021 17:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84C4740C9B;
	Thu,  8 Jul 2021 17:59:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6U8ecF1sMiFN; Thu,  8 Jul 2021 17:59:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A09A40BEC;
	Thu,  8 Jul 2021 17:59:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 23730174625;
	Thu,  8 Jul 2021 13:59:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  8 Jul 2021 13:59:42 -0400
Message-Id: <1625767184-49268-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625767184-49268-1-git-send-email-denis@denix.org>
References: <1625767184-49268-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCHv2 2/4] linux-libc-headers: update to 5.10 kernel headers
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
X-List-Received-Date: Thu, 08 Jul 2021 17:59:50 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

This recipe is used when building using an internal toolchain. Use the same
commit ID as for external-arm-toolchain.

Kernel 5.10 had minor updates to the COPYING file, adjust checksum accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - update LIC_FILES_CHKSUM and explain the reason

 .../{linux-libc-headers_5.4.bb => linux-libc-headers_5.10.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.4.bb => linux-libc-headers_5.10.bb} (67%)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
similarity index 67%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
index c0a3709..353d8b5 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
@@ -4,8 +4,10 @@ PR_append = ".arago0"
 
 DEPENDS += "rsync-native"
 
-BRANCH = "ti-linux-5.4.y"
-SRCREV = "1661da3fddf4cc3f62796ecfb5c572f1e5361bdf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+BRANCH = "ti-linux-5.10.y"
+SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


