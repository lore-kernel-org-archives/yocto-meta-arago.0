Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 60C7B52986
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2019 02:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91FA740AC9;
	Thu, 10 Oct 2019 02:33:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bR8so5aepx3x; Thu, 10 Oct 2019 02:33:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B69340BF3;
	Thu, 10 Oct 2019 02:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5B8B517428D;
	Wed,  9 Oct 2019 22:33:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  9 Oct 2019 22:33:10 -0400
Message-Id: <1570674791-29126-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570674791-29126-1-git-send-email-denys@ti.com>
References: <1570674791-29126-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/3] v4l-utils: update 0001-Makefile.am-skip-po-dirs-for-now.patch
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
X-List-Received-Date: Thu, 10 Oct 2019 02:34:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
index 87f1eef..c164568 100644
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
@@ -1,9 +1,10 @@
-From 8c3531847894cc28aa8d0489332f893d69beab1e Mon Sep 17 00:00:00 2001
+From f21271f720000c9f91569b8a7dfe71d4b74850f8 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 24 Jun 2019 20:54:18 -0400
 Subject: [PATCH] Makefile.am: skip po dirs for now
 
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,6 +22,3 @@ index 8abe4f9..26a4609 100644
  
  if WITH_V4LUTILS
  SUBDIRS += utils contrib
--- 
-2.7.4
-
-- 
2.7.4


