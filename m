Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0020F529BC
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 18:37:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GIbmdn027554
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 13:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531766268;
	bh=hpP4KZlxlwd6Ec0GypCnZAWGZh8ObnyN1TqXBEYQGN8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fdVe0VqhLD/TjeCRC5gPn7mx+PEFgt9BgBjw/x13oONlGjZdH5kRE9gNRYliaYScv
	6IlKV6eGzNPjby/0VCHib61Eblcc5WQoo+80jazw8fwve37huFTRluGDTeZD9abRWW
	PrcE1YaFLjYHxrRmGm3KKc7Aa05X7zXq7ZgUVXgs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GIbmGr010468
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 13:37:48 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 13:37:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 13:37:48 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GIbm9h023924
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 13:37:48 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Jul 2018 14:37:44 -0400
Message-ID: <1531766264-22936-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531766264-22936-1-git-send-email-e-ruei1@ti.com>
References: <1531766264-22936-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH 2/2] videoanalytics_opencv_opencl_Opengl_demo: use qwindow-compositor instead of Weston
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
X-List-Received-Date: Mon, 16 Jul 2018 18:37:56 -0000
Content-Type: text/plain

This is a tentattive hack to run the demo on qwindow-compositor instead of
Weston to work around the Weston2.0.0 full-screen pop-up dispaly issue


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../videoanalytics_opencv_opencl_opengl_demo.desktop                     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop b/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop
index 90931c2..b4cc6f3 100644
--- a/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop
+++ b/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop
@@ -7,4 +7,5 @@ Type=Application
 Exec=qt-opencv-opencl-opengl-multithreaded
 Categories=videoanalytics
 ProgramType=gui
+WinType=qwindow
 X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/videoanalytics_opencv_opencl_opengl_demo/desc_videoanalytics_opencv_opencl_opengl_demo.html
-- 
1.9.1


