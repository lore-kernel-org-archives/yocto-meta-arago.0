Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4F1E9529B9
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9237540C2C
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:05:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rwu15lZ8uVnd for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:05:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 810F440BCF
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2021 20:05:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 399E11743CA;
	Tue, 26 Jan 2021 15:05:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 26 Jan 2021 15:05:02 -0500
Message-Id: <1611691502-8746-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] branding-core-next: explicitly select latest versions
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
X-List-Received-Date: Tue, 26 Jan 2021 20:05:00 -0000

As meta-ti lowers default preferences for latest versions of Linux kernel
and U-boot, need to specify them explicitly for "core-next" brand.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arago-distro/conf/distro/include/branding-core-next.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
index b41dbc9..e435e4f 100644
--- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
@@ -2,10 +2,10 @@
 
 require branding-core.inc
 
-PREFERRED_VERSION_linux-ti-staging = ""
-PREFERRED_VERSION_linux-ti-staging-rt = ""
-PREFERRED_VERSION_linux-ti-staging-systest = ""
-PREFERRED_VERSION_u-boot-ti-staging = ""
+PREFERRED_VERSION_linux-ti-staging = "5.10%"
+PREFERRED_VERSION_linux-ti-staging-rt = "5.10%"
+PREFERRED_VERSION_linux-ti-staging-systest = "5.10%"
+PREFERRED_VERSION_u-boot-ti-staging = "2021.01%"
 
 # Auto rev important packages to pick up latest
 SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-- 
2.7.4


