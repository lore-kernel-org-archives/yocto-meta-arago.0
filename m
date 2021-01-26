Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8286A529B9
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02D6340C2C
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:08:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SHzZJuBUCfen for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:08:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E793440BCF
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:08:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A5D8B1743CA;
	Tue, 26 Jan 2021 15:08:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 26 Jan 2021 15:08:46 -0500
Message-Id: <1611691726-9065-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] branding-*: remove remnants of u-boot-k3-r5
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
X-List-Received-Date: Tue, 26 Jan 2021 20:08:41 -0000

u-boot-k3-r5 was deprecated some time ago by multiconfig support in meta-ti:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7bd2c5d5fdf8cf0711e52454f76244373ee76d1d

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc  | 1 -
 meta-arago-distro/conf/distro/include/branding-core-next.inc | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 8b0811d..ca2aa9a 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -7,7 +7,6 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
 #SRCREV_pn-optee-os = "${AUTOREV}"
 #SRCREV_pn-optee-client = "${AUTOREV}"
diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
index e435e4f..f453b3c 100644
--- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
@@ -12,4 +12,3 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
-- 
2.7.4


