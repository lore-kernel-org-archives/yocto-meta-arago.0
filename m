Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 96DD952007
	for <meta-arago@arago-project.org>;
	Sat,  2 Apr 2016 03:39:44 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z0017HM5TOJ20@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 01 Apr 2016 22:39:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=-URT4zrCuLegeZwgawMA:9
Received: by 100.15.86.14 with SMTP id 196e3d63; Sat, 02 Apr 2016 03:39:29 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 00C07161F76;	Fri,
	1 Apr 2016 23:39:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 01 Apr 2016 23:39:28 -0400
Message-id: <1459568368-18419-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ffmpeg: add bbappend to disable x264, set commercial flags
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
X-List-Received-Date: Sat, 02 Apr 2016 03:39:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
new file mode 100644
index 0000000..551ffcd
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
@@ -0,0 +1,4 @@
+PR_append = "-arago0"
+
+PACKAGECONFIG_remove = "x264"
+LICENSE_FLAGS = ""
-- 
2.2.0


