Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2160752981
	for <meta-arago@arago-project.org>;
	Fri, 16 Jan 2015 03:54:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0G3sw1M011924
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 21:54:58 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0G3swwl005191
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 21:54:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 Jan 2015 21:54:57 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0G3svxJ017417;	Thu, 15 Jan 2015 21:54:58 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Jan 2015 22:54:56 -0500
Message-ID: <1421380496-16251-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] parse-ip: Add support for keystone platforms
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
X-List-Received-Date: Fri, 16 Jan 2015 03:54:59 -0000
Content-Type: text/plain

- Added separate script for keystone platforms
- Script parses ip and sends to uart, picked up by BMC and display on LCD screen

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Updated keystone handling with file moved from init.keystone --> keystone/init
- Updated recipe to remove unwanted statments
---
---
 .../recipes-tisdk/parse-ip/parse-ip.bb             |    7 ++++---
 .../parse-ip/parse-ip/{ => keystone}/init          |   16 ++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)
 copy meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/{ => keystone}/init (87%)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index f20db31..b6461ed 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "Script to parse ip address during boot and make it available to t
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "file://init"
+SRC_URI = "file://init \
+           file://keystone/init"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}"
 
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
similarity index 87%
copy from meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
copy to meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
index 4050efb..7f260fb 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
@@ -32,15 +32,15 @@
 
 case "$1" in
     start )
-        if [ -e /run/media/mmcblk0p1 ]
-        then
-            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
-            sync
-	    sync
-	fi
+        echo '#>>>>> LCD 12' > ipaddr
+        echo 'IP Address:' >> ipaddr
+        cat ipaddr
+
+        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > ipaddr
+        cat ipaddr
+
+        sleep 1
     ;;
     stop )
         exit 0;;
 esac
-
-exit 0
-- 
1.7.9.5


