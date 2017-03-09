Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5BEDF52A0E
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 20:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E441B20BB1;
	Thu,  9 Mar 2017 20:49:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5tSBdcR7Xr4I; Thu,  9 Mar 2017 20:49:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C47B320B83;
	Thu,  9 Mar 2017 20:49:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5878D16238F;
	Thu,  9 Mar 2017 15:49:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  9 Mar 2017 15:49:36 -0500
Message-Id: <1489092576-147033-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] conf/distro: move arago-source-ipk into include dir
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
X-List-Received-Date: Thu, 09 Mar 2017 20:49:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

*.conf in conf/distro might be confused for another full distro.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                                | 2 +-
 .../conf/distro/{arago-source-ipk.conf => include/arago-source-ipk.inc} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-distro/conf/distro/{arago-source-ipk.conf => include/arago-source-ipk.inc} (100%)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d0e7a8b..7c986ee 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -121,7 +121,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 require conf/distro/include/arago-prefs.inc
 
 # Enable generation of source packages for SDKs
-require arago-source-ipk.conf
+require conf/distro/include/arago-source-ipk.inc
 
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
similarity index 100%
rename from meta-arago-distro/conf/distro/arago-source-ipk.conf
rename to meta-arago-distro/conf/distro/include/arago-source-ipk.inc
-- 
2.7.4


