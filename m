Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id E0581529DF
	for <meta-arago@arago-project.org>;
	Mon, 27 Oct 2014 16:47:56 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NE400J0M3YTKO60@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 27 Oct 2014 11:47:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Tp9RX4Tk c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=Ke31zAVeutNptqGCdD4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4443120092;	Mon,
	27 Oct 2014 12:47:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 27 Oct 2014 12:47:17 -0400
Message-id: <1414428437-31225-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] arago.conf: fix qtwebkit depending on gstreamer-1.x, while we still use gstreamer-0.10.x
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
X-List-Received-Date: Mon, 27 Oct 2014 16:47:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 90a9ca8..cc49224 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -33,6 +33,9 @@ PACKAGECONFIG_pn-weston = "fbdev launch libinput"
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples"
 
+# Configure gstreamer-0.10.x as a dependency instead of gstreamer-1.x
+PACKAGECONFIG_pn-qtwebkit = "gstreamer010 qtlocation qtmultimedia qtsensors"
+
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
-- 
2.1.2


