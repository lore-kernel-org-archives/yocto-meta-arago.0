Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D8C1E529DB
	for <meta-arago@arago-project.org>;
	Fri, 19 Jan 2018 02:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E16620B89;
	Fri, 19 Jan 2018 02:01:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TyDH20ryIbwv; Fri, 19 Jan 2018 02:01:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CE0F20B77;
	Fri, 19 Jan 2018 02:01:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9D76F163261;
	Thu, 18 Jan 2018 21:01:17 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 18 Jan 2018 21:01:17 -0500
Message-Id: <1516327277-144816-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] tiff: update removal of lzma through PACKAGECONFIG
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
X-List-Received-Date: Fri, 19 Jan 2018 02:01:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
index 429a40c..2e0e458 100644
--- a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
+++ b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
@@ -1,5 +1,4 @@
 PR_append = ".arago0"
 
 # Remove xz/lzma support to avoid pulling in additional GPLv3 licenses
-DEPENDS_remove = "xz"
-EXTRA_OECONF += "--disable-lzma"
+PACKAGECONFIG_remove = "lzma"
-- 
2.7.4


