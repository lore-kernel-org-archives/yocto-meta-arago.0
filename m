Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id A504852994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 18:13:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GICGYF004763
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 13:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521223936;
	bh=ej0qaIpdT1OP1wpUwNHniHIDQnrtsjzWKmEj9DAw5wE=;
	h=From:To:Subject:Date;
	b=i0vKq1UkgFHx4VPXW6ku8VPyfgi1kZIeFfxZ6oQ4ke/MuCN8l6gMw8fzqOXO+jAbb
	EOwN2IIfWstkL/PXQo0FU393IY95bU0gKmwH3XfKArby6+12qyRfaBqW3xo5SpdReI
	fYS8ROOkYo70mLItaEQUf2MZYUVOIOef/0k6exZY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GICGkQ018898
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 13:12:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 13:12:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 13:12:15 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GICFr1010064
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 13:12:15 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 14:12:11 -0400
Message-ID: <1521223931-64051-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][matrix-gui-v2-apps][PATCH] video_graphics_demo: add as a new test app
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
X-List-Received-Date: Fri, 16 Mar 2018 18:13:10 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 multimedia_apps/video_graphics/desc_video_graphics_demo.html | 12 ++++++++++++
 multimedia_apps/video_graphics/video_graphics_demo.desktop   | 11 +++++++++++
 2 files changed, 23 insertions(+)
 create mode 100755 multimedia_apps/video_graphics/desc_video_graphics_demo.html
 create mode 100644 multimedia_apps/video_graphics/video_graphics_demo.desktop

diff --git a/multimedia_apps/video_graphics/desc_video_graphics_demo.html b/multimedia_apps/video_graphics/desc_video_graphics_demo.html
new file mode 100755
index 0000000..6a4ac55
--- /dev/null
+++ b/multimedia_apps/video_graphics/desc_video_graphics_demo.html
@@ -0,0 +1,12 @@
+<h1> Video Graphics Demo with GC320  and VIP on two screens</h1>
+
+<p>This application demonstrates the advance processing capabilities of DSS IP with the enhanced eglfs_kms QPA which provides new APIs for application to fully control the DRM overlay planes for image overlay and alpha blending while the the primary plane(CRTC) is still  controllede by QT components for the graphics content drawn by QT. 
+</p>
+
+<h2> Data flow </h2>
+<p>
+VIP capture <br>
+&nbsp;&nbsp;&nbsp; ==>GC320 rotate 90 degree ==> QT QPA (draws the graphics content from qml file, scale, alpha blend and overlay the video with SGX output) <br>
+&nbsp;&nbsp;&nbsp; ==>QT QPA (draws the graphics content from qml file, scale, alpha blend and overlay the video with SGX output) <br>
+</p>
+
diff --git a/multimedia_apps/video_graphics/video_graphics_demo.desktop b/multimedia_apps/video_graphics/video_graphics_demo.desktop
new file mode 100644
index 0000000..1f1ca69
--- /dev/null
+++ b/multimedia_apps/video_graphics/video_graphics_demo.desktop
@@ -0,0 +1,11 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=Video Graphics Demo
+Icon=/usr/share/matrix-gui-2.0/apps/images/qt-icon.png
+Exec= video-graphics-test -platform eglfs
+Type=Application
+Categories=multimedia
+WinType=null
+ProgramType=gui
+X-MATRIX-Lock=qt
+X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/video_graphics/desc_video_graphics_demo.html
-- 
1.9.1


