Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 70ADC5298D
	for <meta-arago@arago-project.org>;
	Tue,  2 Aug 2016 23:55:54 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBB00FT23SESQ80@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 02 Aug 2016 18:55:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=XrhzW351mSj7iYe8_-kA:9
Received: by 100.15.86.14 with SMTP id 5cc2ceb4; Tue, 02 Aug 2016 23:55:39 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 57572161B38;	Tue,  2 Aug 2016 19:55:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 02 Aug 2016 19:55:25 -0400
Message-id: <1470182125-30688-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] config-build-env: clone oe-layersetup over http
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
X-List-Received-Date: Tue, 02 Aug 2016 23:55:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Cloning oe-layersetup from tisdk-build-scripts is mostly for read-only
purposes, so it's safe to use http and is less stressfull on the server.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/config-build-env | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 5f12c69..2d1d74e 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -21,7 +21,7 @@ checkout_layer_scripts() {
 
     if [ ! -d $name ]
     then
-        git clone git://arago-project.org/git/projects/oe-layersetup.git $name
+        git clone http://arago-project.org/git/projects/oe-layersetup.git $name
     elif [ -d $name/.git ]
     then
         #This looks to be a git repo.  Hopefully it is the right one :)
-- 
2.7.4


