Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8221552968
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17AAB40B49;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IFaBm0FSoZJY; Wed, 23 Jan 2019 04:52:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A16D84096B;
	Wed, 23 Jan 2019 04:52:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 11C75169B47;
	Tue, 22 Jan 2019 23:52:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:05 -0500
Message-Id: <1548219129-12459-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 5/9] lmbench: update to depend on libtirpc, as glibc no longer has rpc/rpc.h
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
index e13c8b5..64000b8 100644
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+DEPENDS += "libtirpc"
+
 INSANE_SKIP_${PN} += "ldflags"
 
 PR_append = ".arago3"
@@ -7,11 +9,10 @@ PR_append = ".arago3"
 SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
 
 EXTRA_OEMAKE = ""
+CFLAGS = "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS = "-ltirpc"
 
 do_compile () {
-    unset CFLAGS
-    unset LDFLAGS
-    unset CPPFLAGS
     oe_runmake -C src
 }
 
-- 
2.7.4


