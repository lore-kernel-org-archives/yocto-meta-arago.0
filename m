Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2E5B552A83
	for <meta-arago@arago-project.org>;
	Fri, 27 Jan 2017 23:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C0E120B73;
	Fri, 27 Jan 2017 23:53:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8dLkvBM6ICCT; Fri, 27 Jan 2017 23:53:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ECB7E20A3A;
	Fri, 27 Jan 2017 23:53:15 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 2464216232B;
	Fri, 27 Jan 2017 18:53:15 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 27 Jan 2017 18:53:14 -0500
Message-Id: <1485561194-15126-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH] arago.conf: update feed URL for the new location
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
X-List-Received-Date: Fri, 27 Jan 2017 23:53:17 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f7236d8..e8a7a22 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,8 +1,9 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
 DISTRO_VERSION = "2016.12"
-DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
-FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
+DISTRO_FEED_URI ?= "http://lcpd.gt.design.ti.com"
+BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE', True))+int(d.getVar('ARAGO_SYSTEST_ENABLE', True))*2]}"
+FEEDURIPREFIX ?= "packages/${DISTRO}-krogoth/${BUILD_VARIANT}/"
 
 OPKG_ARGS_remove = "--prefer-arch-to-version"
 
-- 
2.7.4


