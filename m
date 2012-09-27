Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id B4D4552A6F
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 04:57:16 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1418541obb.38
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 21:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nvj2FDu1HS17CS/W1lC1/cqU7smO4NJMYDdMSIfz1GA=;
	b=ZTXe2145XQQSOfvsezT43by+SzCkqREGXXbkEWFFE1I0dpYLOCGqj9vtoiQswH8hFl
	k+mettOxZyNaxIyGwcgDscBakdsIskpeaLzkHo1Z5242CpzZjWKdDvubQBeFMRn2F10z
	/0mrrrjZKioWuIf2JP0hIRS1VEHbff9t6vcxo3/cOSYwxMUoJ8ny0jNBYh60D/sXDRW3
	DRYJKjRYjmZJb6UqeQuRIfzxtD25AqVzKYOnyIba6ZZSc0PxoDvHGuiO3fNq2xUhDJwH
	WF9gQ7cYwQllUEAw64LPeluSalhQwmrv/fsFD/RIIh1Ra3R66UUnd/lB4x/v+oI34YpW
	aJuw==
Received: by 10.182.21.200 with SMTP id x8mr2231965obe.57.1348721836374;
	Wed, 26 Sep 2012 21:57:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o4sm3806378oef.11.2012.09.26.21.57.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 21:57:15 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 00:22:32 -0500
Message-Id: <1348723352-9479-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1348723352-9479-1-git-send-email-fcooper@ti.com>
References: <1348723352-9479-1-git-send-email-fcooper@ti.com>
Subject: [meta-arago-distro][PATCH 2/2] busybox-udhcpd-config: Add Arago specific tweaks
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
X-List-Received-Date: Thu, 27 Sep 2012 04:57:16 -0000

* Port the various arago specific tweaks to the default config file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../busybox-udhcpd-config/omap3/udhcpd.conf        |   13 +++++++------
 .../busybox-udhcpd-config/omapl138/udhcpd.conf     |   13 +++++++------
 .../busybox-udhcpd-config/ti33x/udhcpd.conf        |   13 +++++++------
 .../busybox/busybox-udhcpd-config_1.0.bb           |    2 +-
 4 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf
index cd2957c..0c2e842 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf
@@ -6,7 +6,8 @@ start		192.168.0.20
 end		192.168.0.254
 
 # The interface that udhcpd will use
-interface	eth0
+#interface	eth0
+interface	wlan0
 
 # The maximum number of leases (includes addresses reserved
 # by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
@@ -61,12 +62,12 @@ interface	eth0
 # as the dns option, they can be listed on the same line, or multiple
 # lines.
 # Examples:
-opt	dns	192.168.10.2 192.168.10.10
+opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
 option	subnet	255.255.255.0
-opt	router	192.168.10.2
-opt	wins	192.168.10.10
-option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
-option	domain	local
+opt	router	192.168.10.1
+#opt	wins	192.168.10.10
+#option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+#option	domain	local
 option	lease	864000		# default: 10 days
 # Arbitrary option in hex form:
 option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf
index cd2957c..0c2e842 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf
@@ -6,7 +6,8 @@ start		192.168.0.20
 end		192.168.0.254
 
 # The interface that udhcpd will use
-interface	eth0
+#interface	eth0
+interface	wlan0
 
 # The maximum number of leases (includes addresses reserved
 # by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
@@ -61,12 +62,12 @@ interface	eth0
 # as the dns option, they can be listed on the same line, or multiple
 # lines.
 # Examples:
-opt	dns	192.168.10.2 192.168.10.10
+opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
 option	subnet	255.255.255.0
-opt	router	192.168.10.2
-opt	wins	192.168.10.10
-option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
-option	domain	local
+opt	router	192.168.10.1
+#opt	wins	192.168.10.10
+#option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+#option	domain	local
 option	lease	864000		# default: 10 days
 # Arbitrary option in hex form:
 option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf
index cd2957c..0c2e842 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf
@@ -6,7 +6,8 @@ start		192.168.0.20
 end		192.168.0.254
 
 # The interface that udhcpd will use
-interface	eth0
+#interface	eth0
+interface	wlan0
 
 # The maximum number of leases (includes addresses reserved
 # by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
@@ -61,12 +62,12 @@ interface	eth0
 # as the dns option, they can be listed on the same line, or multiple
 # lines.
 # Examples:
-opt	dns	192.168.10.2 192.168.10.10
+opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
 option	subnet	255.255.255.0
-opt	router	192.168.10.2
-opt	wins	192.168.10.10
-option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
-option	domain	local
+opt	router	192.168.10.1
+#opt	wins	192.168.10.10
+#option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+#option	domain	local
 option	lease	864000		# default: 10 days
 # Arbitrary option in hex form:
 option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb
index b0dc96b..991fd2b 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://udhcp.busybox.net/"
 LICENSE = "GPLv2 & BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.7.0.4


