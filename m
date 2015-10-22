Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9673D529FC
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2015 04:13:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9M4DKvw000617
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2015 23:13:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9M4DJ7v022150
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2015 23:13:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 21 Oct 2015 23:13:20 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9M4DJpF000472;	Wed, 21 Oct 2015 23:13:19 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Oct 2015 00:13:17 -0400
Message-ID: <1445487197-30323-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] parse-ip: Update init script for keystone
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
X-List-Received-Date: Thu, 22 Oct 2015 04:13:20 -0000
Content-Type: text/plain

- Script update to make the display of IP address more robust

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-tisdk/parse-ip/parse-ip/keystone/init  |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
index 7f260fb..de4ed8e 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
@@ -32,13 +32,17 @@
 
 case "$1" in
     start )
-        echo '#>>>>> LCD 12' > ipaddr
+	echo ' ' > ipaddr
+	echo ' ' >> ipaddr
+        echo '#>>>>> LCD 12' >> ipaddr
         echo 'IP Address:' >> ipaddr
         cat ipaddr
+        wait
+        sleep 1
 
         echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > ipaddr
         cat ipaddr
-
+        wait
         sleep 1
     ;;
     stop )
-- 
1.7.9.5


