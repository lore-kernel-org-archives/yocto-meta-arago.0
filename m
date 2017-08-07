Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F3041529AB
	for <meta-arago@arago-project.org>;
	Mon,  7 Aug 2017 22:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 319B0208E0;
	Mon,  7 Aug 2017 22:24:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id B5p_rvoF6ySh; Mon,  7 Aug 2017 22:24:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 14FEA207BB;
	Mon,  7 Aug 2017 22:24:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C8DF4162551;
	Mon,  7 Aug 2017 18:24:51 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Aug 2017 18:24:51 -0400
Message-Id: <1502144691-78101-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] lmbench: remove postprocess scripts and drop dependency on perl
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
X-List-Received-Date: Mon, 07 Aug 2017 22:24:53 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
index 1f6cd80..e13c8b5 100644
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 INSANE_SKIP_${PN} += "ldflags"
 
-PR_append = ".arago2"
+PR_append = ".arago3"
 
 SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
 
@@ -14,3 +14,9 @@ do_compile () {
     unset CPPFLAGS
     oe_runmake -C src
 }
+
+do_install_append() {
+    rm -rf ${D}${datadir}
+}
+
+RDEPENDS_${PN}_remove = "perl"
-- 
2.7.4


