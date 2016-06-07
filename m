Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 893BA529BF
	for <meta-arago@arago-project.org>;
	Tue,  7 Jun 2016 23:24:54 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8F0023TD1F0690@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Jun 2016 18:24:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=uwlju1ptAXh-gqke-2gA:9
Received: by 100.15.86.14 with SMTP id 5f96290c; Tue, 07 Jun 2016 23:24:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 27BA8162042;	Tue,
	7 Jun 2016 19:24:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 07 Jun 2016 19:24:50 -0400
Message-id: <1465341890-24552-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] recipes-apps: consolidate different demo apps under one location
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
X-List-Received-Date: Tue, 07 Jun 2016 23:24:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../qt-apps => recipes-apps/image-gallery}/image-gallery_git.bb           | 0
 .../posix-smp-demo/posix-smp-demo.inc                                     | 0
 .../posix-smp-demo/posix-smp-demo_git.bb                                  | 0
 .../0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch       | 0
 .../0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch       | 0
 .../{recipes-qt/qt-apps => recipes-apps/thermostat-demo}/qt-tstat_2.0.bb  | 0
 .../video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb     | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/{recipes-qt/qt-apps => recipes-apps/image-gallery}/image-gallery_git.bb (100%)
 rename meta-arago-extras/{recipes-demo-applications => recipes-apps}/posix-smp-demo/posix-smp-demo.inc (100%)
 rename meta-arago-extras/{recipes-demo-applications => recipes-apps}/posix-smp-demo/posix-smp-demo_git.bb (100%)
 rename meta-arago-extras/{recipes-qt/qt-apps => recipes-apps/thermostat-demo}/qt-tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch (100%)
 rename meta-arago-extras/{recipes-qt/qt-apps => recipes-apps/thermostat-demo}/qt-tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch (100%)
 rename meta-arago-extras/{recipes-qt/qt-apps => recipes-apps/thermostat-demo}/qt-tstat_2.0.bb (100%)
 rename meta-arago-extras/{recipes-demo-applications => recipes-apps}/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb (100%)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
rename to meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
diff --git a/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
similarity index 100%
rename from meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo.inc
rename to meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
diff --git a/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo_git.bb b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo_git.bb
rename to meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo_git.bb
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
rename to meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
rename to meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
rename to meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
diff --git a/meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
rename to meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
-- 
2.2.0


