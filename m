Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 81FC7529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:23:19 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1321929oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bbUXc9X3OG6uSZN+1Xzbv4miDyzcREm4V1weDeWlkFc=;
	b=R/nL/JsKCs7JE5fqs9hFLvvTYga3ZBWs/pEFsMUtqLIp28lXycmNl8ZYmebOjPCmDp
	BLPkCgkzF9mj1m+rqrKr1X4+xHJULODEsrbh9PTd5z7eZK7ZqOgX1a19zeq9XGGPTwde
	h9ZLytx409TQgP5f4i3F28V53UkqjAuQ6aZuwPl2vkDT6FxlnjuK4xog3WGZBJ0mJcGB
	AjURr6dXEU91jf9XzNFfsJ0qtnLWlSLPo7TzzYcZD9Hkw0Q7cNas+65RmpWbFGy9g1gp
	VRJWXLhAxTYt3IFKyzuaLRnt/MQAOL4YGdI9vnubp8qClSvaOxRKyVTrVCHQvKPX+UW3
	/VYg==
Received: by 10.60.31.170 with SMTP id b10mr6278450oei.107.1349418199062;
	Thu, 04 Oct 2012 23:23:19 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 5sm6804641oeq.4.2012.10.04.23.23.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:23:18 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:51:33 -0500
Message-Id: <1349419893-21772-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] matrix-lighttpd: Fix PATH environment variable
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
X-List-Received-Date: Fri, 05 Oct 2012 06:23:19 -0000

* Alot of Matrix applications were failing due to an incomplete list of
  paths listed in the PATH environment variable when a shell script is
  executed by PHP.
* Add and configure mod_setenv module to explicitly set the PATH variable
  to properly include all the necessary paths.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-lighttpd-config.bb  |    6 +++---
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index 8ecfa55..25188af 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Lighttpd config for Matrix"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://../lighttpd.conf.matrix;md5=bf036dce30a4114d5942c1f8d0152191"
+LIC_FILES_CHKSUM = "file://../lighttpd.conf.matrix;md5=298ec80f6b2b837211de52081c5eecc5"
 
 inherit allarch
 
-PR = "1"
+PR = "2"
 
 SRC_URI = "file://lighttpd.conf.matrix"
 
@@ -15,7 +15,7 @@ do_install() {
 }
 
 FILES_${PN} = "${sysconfdir}/lighttpd.conf.matrix"
-RDEPENDS_${PN} = "lighttpd"
+RDEPENDS_${PN} = "lighttpd lighttpd-module-setenv"
 
 pkg_postinst_${PN} () {
 if [ -f $D${sysconfdir}/lighttpd.conf ] ; then
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
index d2e9217..82a9fb8 100755
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
@@ -20,7 +20,7 @@ server.modules              = (
 #                               "mod_trigger_b4_dl",
 #                               "mod_auth",
 #                               "mod_status",
-#                               "mod_setenv",
+                                "mod_setenv",
                                 "mod_expire",
 #                               "mod_fastcgi",
 #                               "mod_proxy",
@@ -296,6 +296,9 @@ $HTTP["url"] =~ "\.(jpg|gif|png)$" { expire.url = ( "" => "access 3 years" ) }
 #### setenv
 #setenv.add-request-header  = ( "TRAV_ENV" => "mysql://user@host/db" )
 #setenv.add-response-header = ( "X-Secret-Message" => "42" )
+setenv.add-environment = (
+    "PATH" => "/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:."
+)
 
 ## for mod_trigger_b4_dl
 # trigger-before-download.gdbm-filename = "/home/weigon/testbase/trigger.db"
-- 
1.7.0.4


