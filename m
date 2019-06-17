Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EBD6152092
	for <meta-arago@arago-project.org>;
	Mon, 17 Jun 2019 12:33:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HCWbib037104
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560774757;
	bh=TfFv4mjeCNsmpm5zeM5Q77dROnrwg3fW1FZDgGW/WCQ=;
	h=From:To:Subject:Date;
	b=Hs8jT5XOvBqIWTXJGjQPiW1ZOlujGNkFz0BLmyaB4PjwfcvpNT0vswzXuKZ6rhM+b
	TKc4NtYFeE0/tjwXpxB+v2C37geUQ/WbrTCCvVB1gXmVyJ+2+pXhQ8g6bNKr9rPWSn
	99tnJKUBymVWo1iqrET7DFaeOV+304rvkIV211w8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HCWba5056264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:32:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 17 Jun 2019 07:32:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 17 Jun 2019 07:32:36 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HCWaEP093765
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:32:36 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Jun 2019 08:32:16 -0400
Message-ID: <20190617123216.63767-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] Revert "videoanalytics_opencv_opencl_Opengl_demo: use qwindow-compositor instead of Weston"
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
X-List-Received-Date: Mon, 17 Jun 2019 12:33:18 -0000
Content-Type: text/plain

This reverts commit 5abdf6d0e0fbfc54aab8c8488ec42932351e27b9.
The original patch is no long needed beacuse the Weston 2.0
issue has been fixed at Weston 5.0.
---
 .../videoanalytics_opencv_opencl_opengl_demo.desktop             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop b/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop
index b4cc6f3..90931c2 100644
--- a/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop
+++ b/videoanalytics_apps/videoanalytics_opencv_opencl_opengl_demo/videoanalytics_opencv_opencl_opengl_demo.desktop
@@ -7,5 +7,4 @@ Type=Application
 Exec=qt-opencv-opencl-opengl-multithreaded
 Categories=videoanalytics
 ProgramType=gui
-WinType=qwindow
 X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/videoanalytics_opencv_opencl_opengl_demo/desc_videoanalytics_opencv_opencl_opengl_demo.html
-- 
2.17.1


