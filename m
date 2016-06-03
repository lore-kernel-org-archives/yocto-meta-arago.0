Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D6A4D52983
	for <meta-arago@arago-project.org>;
	Fri,  3 Jun 2016 15:52:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u53Fql9M025277
	for <meta-arago@arago-project.org>; Fri, 3 Jun 2016 10:52:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u53FqseJ000650
	for <meta-arago@arago-project.org>; Fri, 3 Jun 2016 10:52:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Jun 2016 10:52:54 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u53FqseX000384;
	Fri, 3 Jun 2016 10:52:54 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1b8rP3-0000EN-Lq; Fri, 03 Jun 2016 11:52:53 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Jun 2016 11:52:52 -0400
Message-ID: <1464969172-837-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-host-check: add support for Ubuntu 16.04
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
X-List-Received-Date: Fri, 03 Jun 2016 15:52:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-host-check.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/setup-host-check.sh b/setup-host-check.sh
index 3d21d28..f1d63d0 100644
--- a/setup-host-check.sh
+++ b/setup-host-check.sh
@@ -39,10 +39,10 @@ echo "Verifying Linux host distribution"
 
 get_host_type host
 
-if [ "$host" != "lucid" -a "$host" != "precise" -a "$host" != "trusty" ]; then
-    echo "Unsupported host machine, only Ubuntu 12.04 LTS and Ubuntu 14.04 LTS are supported"
+if [ "$host" != "lucid" -a "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial" ]; then
+    echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, and Ubuntu 16.04 LTS are supported"
     exit 1
 fi
-echo "Ubuntu 12.04 LTS and Ubuntu 14.04 LTS is being used, continuing.."
+echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
 echo "--------------------------------------------------------------------------------"
 echo
-- 
1.9.1


