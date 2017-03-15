Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C2E19529CA
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 16:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AABC820BB0;
	Wed, 15 Mar 2017 16:42:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id o4i30dj9jcTL; Wed, 15 Mar 2017 16:42:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 91C7820B0D;
	Wed, 15 Mar 2017 16:42:23 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5A41F1623C7;
	Wed, 15 Mar 2017 12:42:23 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 15 Mar 2017 12:42:22 -0400
Message-Id: <1489596142-29562-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] ti-llvm3.6: depend on valgrind
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
X-List-Received-Date: Wed, 15 Mar 2017 16:42:25 -0000

If valgrind is not yet staged, may cause this error:

| .../git/lib/Support/Valgrind.cpp:20:31: fatal error: valgrind/valgrind.h: No such file or directory
|  #include <valgrind/valgrind.h>
|                                ^
| compilation terminated.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index e1db5ec..63c0fef 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -17,8 +17,7 @@ require recipes-core/llvm/llvm.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
-DEPENDS += "libxml2"
-
+DEPENDS += "libxml2 valgrind"
 
 LLVM_DIR = "ti-llvm${PV}"
 
-- 
2.7.4


