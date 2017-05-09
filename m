Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EB04C52A49
	for <meta-arago@arago-project.org>;
	Tue,  9 May 2017 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2631C208FB;
	Tue,  9 May 2017 18:07:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9o-SmxC765zs; Tue,  9 May 2017 18:07:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0649120BEF;
	Tue,  9 May 2017 18:06:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9E1F21624B5;
	Tue,  9 May 2017 14:06:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  9 May 2017 14:06:52 -0400
Message-Id: <1494353215-51061-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494353215-51061-1-git-send-email-denis@denix.org>
References: <1494353215-51061-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 3/6] linux-libc-headers: remove 4.4 bbappend
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
X-List-Received-Date: Tue, 09 May 2017 18:07:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux-libc-headers/linux-libc-headers_4.4.bbappend         | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
deleted file mode 100644
index 7d0537d..0000000
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-PR_append = ".arago0"
-
-BRANCH = "ti-lsk-linux-4.4.y"
-SRCREV = "6580f85400b48d55d06f11d6b75c056399123a72"
-
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
-SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-- 
2.7.4


