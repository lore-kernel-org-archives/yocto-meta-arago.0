Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 90D1A52A80
	for <meta-arago@arago-project.org>;
	Thu, 14 Apr 2016 19:59:34 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5N006LA3IUOI90@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Apr 2016 14:59:19 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=_NoZ9A7RUhDd5kAIUmcA:9
Received: by 100.15.86.14 with SMTP id 0dc20ce8; Thu, 14 Apr 2016 19:59:19 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9151C161FA9;	Thu,
	14 Apr 2016 15:59:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Apr 2016 15:59:15 -0400
Message-id: <1460663957-25942-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] pulseaudio: remove old bbappend, no longer needed
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
X-List-Received-Date: Thu, 14 Apr 2016 19:59:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/pulseaudio/pulseaudio_%.bbappend              | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_%.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_%.bbappend
deleted file mode 100644
index 2fc3ce6..0000000
--- a/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# Removing pulseaudio-module-console-kit which depends on console-kit.
-# Console-kit has x11 dependencies which can't be built do to Arago being a non x11 distro.
-RDEPENDS_pulseaudio-server := "${@oe_filter_out('pulseaudio-module-console-kit','${RDEPENDS_pulseaudio-server}', d)}"
-- 
2.2.0


