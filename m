Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A3ECB5298F
	for <meta-arago@arago-project.org>;
	Fri,  4 Jun 2021 22:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D055040BA7;
	Fri,  4 Jun 2021 22:26:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 43ImwSZFuShX; Fri,  4 Jun 2021 22:26:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5FDD40A28;
	Fri,  4 Jun 2021 22:26:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6C8851745F6;
	Fri,  4 Jun 2021 18:26:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  4 Jun 2021 18:26:01 -0400
Message-Id: <1622845561-7712-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] netperf: drop upstreamed PACKAGECONFIGs
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
X-List-Received-Date: Fri, 04 Jun 2021 22:25:24 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

2 new PACKAGECONFIGs were upstreamed to meta-oe and now part of dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-support/netperf/netperf_git.bbappend | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/netperf/netperf_git.bbappend

diff --git a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
deleted file mode 100644
index 9527f36..0000000
--- a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PACKAGECONFIG[intervals] = "--enable-intervals,--disable-intervals,,"
-PACKAGECONFIG[histogram] = "--enable-histogram,--disable-histogram,,"
-- 
2.7.4


