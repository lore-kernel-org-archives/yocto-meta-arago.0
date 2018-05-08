Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 737AF529C7
	for <meta-arago@arago-project.org>;
	Tue,  8 May 2018 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3205820914;
	Tue,  8 May 2018 18:01:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9qrjWqAiupEg; Tue,  8 May 2018 18:01:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C31A2079D;
	Tue,  8 May 2018 18:01:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 72B4B163444;
	Tue,  8 May 2018 14:01:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  8 May 2018 14:01:15 -0400
Message-Id: <1525802475-40591-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] oe-layertool-setup.sh: don't depend on bc for math, use expr instead
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
X-List-Received-Date: Tue, 08 May 2018 18:01:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 oe-layertool-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index d3b36ee..ed65ca1 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -730,7 +730,7 @@ EOM
 
     # set the number of threads
     threads=`cat /proc/cpuinfo | grep -c processor`
-    tnum=`echo "(${threads}*.75+.5)/1" | bc`
+    tnum=`expr \( ${threads} + 1 \) \* 75 / 100`
     sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${tnum}\"/" $confdir/local.conf
     sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${tnum}\"/" $confdir/local.conf
 
-- 
2.7.4


