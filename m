Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id B11635297D
	for <meta-arago@arago-project.org>;
	Mon, 31 Aug 2015 17:02:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTY006W4HZEDA20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 31 Aug 2015 12:02:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=uRRa74qj2VoA:10 a=sozttTNsAAAA:8
	a=oLkbeX7OleCgVqKSzBoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C0799161BCA;	Mon,
	31 Aug 2015 13:02:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 31 Aug 2015 13:02:01 -0400
Message-id: <1441040521-4327-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1441040521-4327-1-git-send-email-denis@denix.org>
References: <1441040521-4327-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] arago.conf: enable egl and disable fbdev only for weston on omap-a15
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
X-List-Received-Date: Mon, 31 Aug 2015 17:02:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6c61804..6057846 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -38,7 +38,9 @@ GST_PROVIDER ?= "1.0"
 QT_PROVIDER ?= "qt5"
 
 # Distro-specific package configuration
-PACKAGECONFIG_pn-weston = "fbdev kms egl launch libinput"
+PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
+PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
+PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-- 
2.2.0


