Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 37857529BA
	for <meta-arago@arago-project.org>;
	Sat, 27 Apr 2019 03:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CA6C40B86;
	Sat, 27 Apr 2019 03:42:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id W8jRmxk3dQRf; Sat, 27 Apr 2019 03:42:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 578DE407DA;
	Sat, 27 Apr 2019 03:42:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1D31B16E503;
	Fri, 26 Apr 2019 23:42:17 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 26 Apr 2019 23:42:16 -0400
Message-Id: <1556336536-12497-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] arago.conf: bump distro version
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
X-List-Received-Date: Sat, 27 Apr 2019 03:42:43 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index dbf726f..3402cd8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2019.03"
+DISTRO_VERSION = "2019.04"
 DISTRO_FEED_URI ?= "http://lcpd.gt.design.ti.com"
 BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
 FEEDURIPREFIX ?= "packages/${DISTRO}-thud/${BUILD_VARIANT}/"
-- 
2.7.4


