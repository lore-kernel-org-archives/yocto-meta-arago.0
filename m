Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 017D2529DA
	for <meta-arago@arago-project.org>;
	Thu, 11 Apr 2019 02:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E37140B96;
	Thu, 11 Apr 2019 02:45:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eK41r2ooMMqn; Thu, 11 Apr 2019 02:45:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 20FC7403F2;
	Thu, 11 Apr 2019 02:45:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4C7E716E038;
	Wed, 10 Apr 2019 22:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Apr 2019 22:45:07 -0400
Message-Id: <1554950707-55674-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] gdb_linaro-7.8: drop local bbappend as upstream version got removed
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
X-List-Received-Date: Thu, 11 Apr 2019 02:45:30 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend

diff --git a/meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend b/meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend
deleted file mode 100644
index 0eb06c8..0000000
--- a/meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = ".arago0"
-
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python-modules"
-- 
2.7.4


