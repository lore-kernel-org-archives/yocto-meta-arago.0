Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E103A52A8F
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E341A40C5E;
	Sat,  3 Apr 2021 00:11:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ipe_tDQVba9v; Sat,  3 Apr 2021 00:11:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C87F540BEC;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EAA26174589;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:32 -0400
Message-Id: <1617408644-2675-18-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 17/29] netperf: drop upstreamed PACKAGECONFIG, suppress gcc10 multiple definition
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:57 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Resolves:
| .../src/nettest_omni.c:206: multiple definition of `signal_set'; nettest_bsd.o:.../src/nettest_bsd.c:279: first defined here
| .../src/nettest_omni.c:164: multiple definition of `interval_count'; nettest_bsd.o:.../src/nettest_bsd.c:266: first defined here

https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-support/netperf/netperf_git.bbappend | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
index 9527f36..f63b608 100644
--- a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
+++ b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
@@ -1,2 +1 @@
-PACKAGECONFIG[intervals] = "--enable-intervals,--disable-intervals,,"
-PACKAGECONFIG[histogram] = "--enable-histogram,--disable-histogram,,"
+CFLAGS += "-fcommon"
-- 
2.7.4


