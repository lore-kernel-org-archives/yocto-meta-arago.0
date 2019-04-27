Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 846F5529CA
	for <meta-arago@arago-project.org>;
	Sat, 27 Apr 2019 03:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A38440B86;
	Sat, 27 Apr 2019 03:52:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yyGnZdQq3qTg; Sat, 27 Apr 2019 03:52:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0163B407DA;
	Sat, 27 Apr 2019 03:52:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 74DD216E503;
	Fri, 26 Apr 2019 23:52:09 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 26 Apr 2019 23:52:08 -0400
Message-Id: <1556337128-19129-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] arago.conf: default to internal toolchain for omapl138
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
X-List-Received-Date: Sat, 27 Apr 2019 03:52:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 3402cd8..d4aaa72 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -143,6 +143,7 @@ IMAGE_FSTYPES_remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') ==
 # Set some sane defaults, in case someone forgets to set them in local.conf
 TC_SANE_DEFAULT ?= "arm"
 TOOLCHAIN_TYPE ?= "external"
+TOOLCHAIN_TYPE_omapl138 = "internal"
 TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"
 
 require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
-- 
2.7.4


