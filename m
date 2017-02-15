Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 99C395209B
	for <meta-arago@arago-project.org>;
	Wed, 15 Feb 2017 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9607020B38;
	Wed, 15 Feb 2017 21:10:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A3li9lGTRFGx; Wed, 15 Feb 2017 21:10:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 761CA20893;
	Wed, 15 Feb 2017 21:10:11 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D15F7162378;
	Wed, 15 Feb 2017 16:10:10 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 15 Feb 2017 16:10:09 -0500
Message-Id: <1487193009-19240-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] linux-libc-headers: update to include dma-buf.h export fix
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
X-List-Received-Date: Wed, 15 Feb 2017 21:10:12 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
index e27c49d..597d71f 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
@@ -1,9 +1,9 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 BRANCH = "ti-lsk-linux-4.9.y"
-SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
+SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


