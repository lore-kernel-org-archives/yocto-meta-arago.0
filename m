Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E5D6352A63
	for <meta-arago@arago-project.org>;
	Sat, 19 Nov 2016 18:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 06F87209C6;
	Sat, 19 Nov 2016 18:54:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SQdDA2KOFGAq; Sat, 19 Nov 2016 18:54:25 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DCA93204AF;
	Sat, 19 Nov 2016 18:54:24 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 5CBFB1621A4;
	Sat, 19 Nov 2016 13:54:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 19 Nov 2016 13:54:23 -0500
Message-Id: <1479581663-13004-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] toolchain-gcc: pre-expand LIBCEXTENSION before setting TOOLCHAIN_* vars
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
X-List-Received-Date: Sat, 19 Nov 2016 18:54:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since libc-related variables are set after distro configs are parsed, immediate
expansion of TOOLCHAIN_* variables makes them incorrect. The only dependency is
on LIBCEXTENSION, so set it early here.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index e378f2d..cae46a4 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -2,6 +2,8 @@
 TCMODE = "default"
 TCLIBC = "glibc"
 
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
+
 # Match some of the external vars
 TOOLCHAIN_SYS := "${TARGET_SYS}"
 TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
-- 
2.7.4


