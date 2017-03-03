Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7AE9752AC9
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 02:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 82D2020BA9;
	Fri,  3 Mar 2017 02:59:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8PhNL42Zg47C; Fri,  3 Mar 2017 02:59:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E2FA20BA5;
	Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 32A211623B1;
	Thu,  2 Mar 2017 21:59:06 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 21:59:00 -0500
Message-Id: <1488509945-12853-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488509945-12853-1-git-send-email-denis@denix.org>
References: <1488509945-12853-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 07/12] packagegroup-*-base: alsa-lib no longer provides smixer libs, depend directly on libasound
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
X-List-Received-Date: Fri, 03 Mar 2017 02:59:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 7832a89..8d2e0b7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 ARAGO_ALSA_BASE = "\
-    alsa-lib \
+    libasound \
     alsa-utils-aplay \
     "
 
-- 
2.7.4


