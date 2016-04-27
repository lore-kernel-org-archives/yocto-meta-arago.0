Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id 649A15296F
	for <meta-arago@arago-project.org>;
	Wed, 27 Apr 2016 19:59:05 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6B00699661IY90@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 27 Apr 2016 14:58:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=fQGo9Woc_CnQBA2Q9icA:9
Received: by 100.15.86.14 with SMTP id 095d19ea; Wed, 27 Apr 2016 19:58:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 975F8161FAE;	Wed,
	27 Apr 2016 15:58:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 27 Apr 2016 15:58:48 -0400
Message-id: <1461787128-7954-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: simplify weston PACKAGECONFIG settings
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
X-List-Received-Date: Wed, 27 Apr 2016 19:59:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4816598..1d68622 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -42,14 +42,7 @@ GST_PROVIDER ?= "1.0"
 QT_PROVIDER ?= "qt5"
 
 # Distro-specific package configuration
-PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
-PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
-PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
-PACKAGECONFIG_append_pn-weston_ti43x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
-PACKAGECONFIG_append_pn-weston_ti33x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti33x    = "fbdev"
-
+PACKAGECONFIG_pn-weston = "egl kms launch libinput"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-- 
2.2.0


