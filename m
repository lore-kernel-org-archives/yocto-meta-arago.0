Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5B02C52A4E
	for <meta-arago@arago-project.org>;
	Fri, 17 Mar 2017 17:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 61C3120BAC;
	Fri, 17 Mar 2017 17:52:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id G1uym3rOZdW8; Fri, 17 Mar 2017 17:52:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 41CB120AC4;
	Fri, 17 Mar 2017 17:52:32 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B860C1623E7;
	Fri, 17 Mar 2017 13:52:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 17 Mar 2017 13:52:31 -0400
Message-Id: <1489773151-23858-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH] arago.conf: don't produce ubifs images for systest builds
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
X-List-Received-Date: Fri, 17 Mar 2017 17:52:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
Backport from morty/master

 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e8a7a22..6a764ba 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -97,7 +97,7 @@ ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt",
 # Set systest kernel suffix
 ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
-IMAGE_FSTYPES_remove = "${@['','ubi'][d.getVar('ARAGO_SYSTEST_ENABLE', True) == '1']}"
+IMAGE_FSTYPES_remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE', True) == '1']}"
 
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
-- 
2.7.4


