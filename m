Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BBB41529BC
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 15:16:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16FGxxs030933
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 09:16:59 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16FGxa3026010
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 09:16:59 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Feb 2017 09:16:59 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v16FGxSs008109;	Mon, 6 Feb 2017 09:16:59 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Feb 2017 10:14:43 -0500
Message-ID: <1486394083-684-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth/morty][PATCH] parse-ip: fix for use with systemd
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
X-List-Received-Date: Mon, 06 Feb 2017 15:17:00 -0000
Content-Type: text/plain

* The keystone parse-ip initscript displays the IP address on the
  EVM's LCD by echoing a magic string over uart, and the BMC
  intercepts this magic string, and prints the following two lines to
  the LCD.
* systemd will suppress all stdout from legacy initscripts
* Therefore force writing to /dev/ttyS0 so that the message is not
  suppressed.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb            | 2 +-
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index 047e7df..69a8cf7 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://init"
 
-PR = "r5"
+PR = "r6"
 
 S = "${WORKDIR}"
 
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
index a693156..7d42d43 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
@@ -36,12 +36,11 @@ case "$1" in
 	echo ' ' >> ipaddr
         echo '#>>>>> LCD 12' >> ipaddr
         echo 'IP Address:' >> ipaddr
-        cat ipaddr
         wait
         sleep 1
 
-        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > ipaddr
-        cat ipaddr
+        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` >> ipaddr
+        cat ipaddr > /dev/ttyS0
         wait
         sleep 1
     ;;
-- 
2.7.4


