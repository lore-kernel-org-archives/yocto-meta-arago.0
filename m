Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2351F52A1E
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2019 00:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A8C640AF7;
	Thu, 28 Feb 2019 00:58:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id f6cAf4A8S2I6; Thu, 28 Feb 2019 00:58:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13C9240A2D;
	Thu, 28 Feb 2019 00:58:17 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4665916B9E3;
	Wed, 27 Feb 2019 19:58:16 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 27 Feb 2019 19:58:15 -0500
Message-Id: <1551315495-22592-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] branding-bleeding: also AUTOREV optee packages and arm-trusted-firmware
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
X-List-Received-Date: Thu, 28 Feb 2019 00:58:24 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index a1913b1..91177f1 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -9,6 +9,10 @@ SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
 SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
+SRCREV_pn-optee-os = "${AUTOREV}"
+SRCREV_pn-optee-client = "${AUTOREV}"
+SRCREV_pn-optee-test = "${AUTOREV}"
+SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 
 # Build and assemble TI-SDK, but don't package it
 IMAGE_FSTYPES_pn-arago-core-tisdk-image = ""
-- 
2.7.4


