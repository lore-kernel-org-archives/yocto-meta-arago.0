Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C0A43529A6
	for <meta-arago@arago-project.org>;
	Mon,  7 May 2018 20:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9831E20B38;
	Mon,  7 May 2018 20:28:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3uhcLFRvnLuj; Mon,  7 May 2018 20:28:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74A15208BD;
	Mon,  7 May 2018 20:28:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E19B3163457;
	Mon,  7 May 2018 16:28:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  7 May 2018 16:28:17 -0400
Message-Id: <1525724897-45780-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] oe-layer-setup.sh: reduce number of threads used down to 75%
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
X-List-Received-Date: Mon, 07 May 2018 20:28:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since number of threads is used to set number of parallel bitbake processes,
as well as number of make processes, the total number of compile tasks
running at the same time is threads^2 and can easily spike to thousands on
modern machines. It seems while real hardware can handle such load just fine,
doing so in VM can cause resource deprivation and result in issues like
Internal Compiler Error (ICE) and unable to fork in some processes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 oe-layertool-setup.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 154b117..d3b36ee 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -730,8 +730,9 @@ EOM
 
     # set the number of threads
     threads=`cat /proc/cpuinfo | grep -c processor`
-    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${threads}\"/" $confdir/local.conf
-    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${threads}\"/" $confdir/local.conf
+    tnum=`echo "(${threads}*.75+.5)/1" | bc`
+    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${tnum}\"/" $confdir/local.conf
+    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${tnum}\"/" $confdir/local.conf
 
     # Find if old DL_DIR was set
     if [ -e $confdir/local.conf.bak ]
-- 
2.7.4


