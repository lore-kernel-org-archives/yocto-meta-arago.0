Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 6282352AA5
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:54 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00DKE6BYS520@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=5rCe5-i4AAAA:8 a=NEAV23lmAAAA:8
	a=fgyJhKhSejdNCS7tcAgA:9	a=phLkc5FJxekA:10
Received: by 100.15.86.14 with SMTP id 3c399e6c; Wed, 20 Apr 2016 19:33:35 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D145B161FC0;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:22 -0400
Message-id: <1461180805-25733-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 13/16] smcroute: got upstreamed to meta-networking, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-extended/smcroute/smcroute_2.0.0.bb             | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb

diff --git a/meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb b/meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb
deleted file mode 100644
index c206cb9..0000000
--- a/meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Static Multicast Routing Daemon"
-DESCRIPTION = "SMCRoute is a daemon and command line tool to manipulate the multicast routing table in the UNIX kernel."
-HOMEPAGE = "http://troglobit.github.io/smcroute.html"
-SECTION = "console/network"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-
-SRCREV = "d6280e64b27d5a4bd7f37dac36b455f4ae5f9ab3"
-SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-- 
2.2.0


