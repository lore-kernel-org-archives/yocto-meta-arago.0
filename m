Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 9ECF252A0A
	for <meta-arago@arago-project.org>;
	Sat,  6 Oct 2012 15:59:55 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2492373oag.38
	for <meta-arago@arago-project.org>;
	Sat, 06 Oct 2012 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lbGJp4wTFs6QjodQt4LBopWV6iprw+69jD0yEGY/TdM=;
	b=rSOIC/9yTyDlnCdzRfq77GuB8kNc0ueX8BfZppqmXXHaFNeLcrtOdbvQ1F9+Ikrrt7
	1X9VIoau/roCwiX/ddfR2rW6/8bGZqWFBMF20JuLuRCGfgKdkCRSO1VsZg4yowvehjko
	1JZd471KYqkKYj9znRhVJDc0S0nWXJMBpDPcS0uXTQlJJr0yoqkc4/En3jBWo9pzrdEg
	nDM58gd4rSHOgzLs/iQFJfZLgjnzJsE+kJubdOvusVbDYnqr/KXYNp7pAA7FjUjztexf
	4sL5jmI8mLdlov4fBY70rx0LHRxnEnn4wIgMGwbTn0hvQCog/dPllSrW1TB+qA0A8IAF
	hecQ==
Received: by 10.182.146.77 with SMTP id ta13mr9294108obb.97.1349539194917;
	Sat, 06 Oct 2012 08:59:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ig3sm12525682obb.0.2012.10.06.08.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 08:59:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat,  6 Oct 2012 11:27:16 -0500
Message-Id: <1349540836-30639-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] matrix-lighttpd: Fix PATH environment variable
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
X-List-Received-Date: Sat, 06 Oct 2012 15:59:55 -0000

* Alot of Matrix applications were failing due to an incomplete list of
  paths listed in the PATH environment variable when a shell script is
  executed by PHP.
* Add and configure mod_setenv module to explicitly set the PATH variable
  to properly include all the necessary paths.
* Add proper license file. Grabbed COPYING file from lighttpd v1.4.30

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update PR syntax
Grabbed the license file COPYING from lighttpd and use that for the checksum.

 .../recipes-core/matrix/matrix-lighttpd-config.bb  |   11 +++++--
 .../matrix/matrix-lighttpd-config/COPYING          |   31 ++++++++++++++++++++
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    5 ++-
 3 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/COPYING

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index 8ecfa55..f47b0e0 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -1,21 +1,26 @@
 DESCRIPTION = "Lighttpd config for Matrix"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://../lighttpd.conf.matrix;md5=bf036dce30a4114d5942c1f8d0152191"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
 inherit allarch
 
-PR = "1"
+PR = "r2"
 
 SRC_URI = "file://lighttpd.conf.matrix"
 
+# Grabbed COPYING file from lighttpd_1.4.30
+SRC_URI += "file://COPYING"
+
+S = "${WORKDIR}"
+
 do_install() {
 	install -d ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd.conf.matrix
 }
 
 FILES_${PN} = "${sysconfdir}/lighttpd.conf.matrix"
-RDEPENDS_${PN} = "lighttpd"
+RDEPENDS_${PN} = "lighttpd lighttpd-module-setenv"
 
 pkg_postinst_${PN} () {
 if [ -f $D${sysconfdir}/lighttpd.conf ] ; then
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/COPYING b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/COPYING
new file mode 100644
index 0000000..1333e45
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/COPYING
@@ -0,0 +1,31 @@
+
+
+Copyright (c) 2004, Jan Kneschke, incremental
+ All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+- Redistributions of source code must retain the above copyright notice, this
+  list of conditions and the following disclaimer.
+
+- Redistributions in binary form must reproduce the above copyright notice,
+  this list of conditions and the following disclaimer in the documentation
+  and/or other materials provided with the distribution.
+
+- Neither the name of the 'incremental' nor the names of its contributors may
+  be used to endorse or promote products derived from this software without
+  specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+THE POSSIBILITY OF SUCH DAMAGE.
+
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


