Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 20D9B529A4
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2012 00:38:53 +0000 (UTC)
Received: by oagn12 with SMTP id n12so5947453oag.38
	for <meta-arago@arago-project.org>;
	Mon, 01 Oct 2012 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7ubyWznpVcKtL694Tc/R2DLFWAZ713pi2ZFJkQjzRH4=;
	b=UctVXLruJsdvwlbfDVgyQ4rYUAi0zoTzVtw8T4SZscJb9n/Un0lBT1Av5PaZZbpsPu
	8vZ5iBckuPeIKYLGFzAsDXr53OFfEtf1HM28eqUzoPP66SEKI8G1TbW4uPtnBcVi770j
	BTHBPAzIjijEHLuS0yD1F6iVJfS4at2T3+96sZdmiUF/GPdmChKRAXyZ2Z1vUANCKatM
	phjxCxJa76cbxz33RE5AMdTUFBR+2Mc67t1MKD/8fC9KvUAg//Fy7UtDTU2u4eTRTIZK
	i7sIm5/utktUvxEEajVo+yljhCxb7gTWGHmNRJSqfhTXyB1jAnCbYLy0+LAkrKiV/zFZ
	XOTQ==
Received: by 10.182.164.103 with SMTP id yp7mr12895683obb.26.1349138332514;
	Mon, 01 Oct 2012 17:38:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id
	rg10sm17704723obc.14.2012.10.01.17.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 17:38:52 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon,  1 Oct 2012 20:06:00 -0500
Message-Id: <1349139960-7647-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] matrix: Update port
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
X-List-Received-Date: Tue, 02 Oct 2012 00:38:53 -0000

* Switch port used by Matrix from 8080 to 80
* Switched the port used by lighttpd from 8080 to 80.
* Switched the port used by Matrix browser from 8080 to 80.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui/init            |    2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 .../recipes-core/matrix/matrix-lighttpd-config.bb  |    6 ++++--
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index 349da53..6885f41 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -2,7 +2,7 @@
 
 matrixgui="/usr/bin/matrix_browser"
 ROTATION=__MATRIX_ROT__
-GUI_OPTS="-qws $ROTATION http://localhost:8080/"
+GUI_OPTS="-qws $ROTATION http://localhost:80/"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 test -x "$matrixgui" || exit 0
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 6e66723..6634fcb 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r9"
+PR = "r10"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index da7a044..8ecfa55 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -1,10 +1,12 @@
-DESCRIPTION = "ligHTTPD config for matrix"
+DESCRIPTION = "Lighttpd config for Matrix"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://../lighttpd.conf.matrix;md5=58caecbd847bcc4d5141dea2ee4c42ec"
+LIC_FILES_CHKSUM = "file://../lighttpd.conf.matrix;md5=bf036dce30a4114d5942c1f8d0152191"
 
 inherit allarch
 
+PR = "1"
+
 SRC_URI = "file://lighttpd.conf.matrix"
 
 do_install() {
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
index dc6215f..d2e9217 100755
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
@@ -142,7 +142,7 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 ######### Options that are good to be but not neccesary to be changed #######
 
 ## bind to port (default: 80)
-server.port                = 8080
+server.port                = 80
 
 ## bind to localhost (default: all interfaces)
 #server.bind                = "grisu.home.kneschke.de"
-- 
1.7.0.4


