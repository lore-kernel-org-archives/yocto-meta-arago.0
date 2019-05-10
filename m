Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B2F5852987
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2019 19:17:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4AJH2sW082530
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 14:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557515822;
	bh=lPAdi5qdZVw8tGSiLy4yVsIP+15VrLj6CXm0S6dFDiQ=;
	h=From:To:CC:Subject:Date;
	b=Ie+ltSQSYWjD5tMmEa2J6HWDIG/44D6qAXHenSv+axWLs+gHNGgjjnBsbMus+DXX4
	cJO64bwEo1w5vs071oc4csuUDFJ8LlFT144h1enyoGtyjIvIrrOrcsBXteL/v2AL2O
	uvsP5kG6Gj3bMSGmExKN8xQ3lhPiAQwj1loPnFMU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4AJH2OB061303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 14:17:02 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 10 May 2019 14:17:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 10 May 2019 14:17:01 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4AJH1I9120372;
	Fri, 10 May 2019 14:17:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 May 2019 15:04:49 -0400
Message-ID: <1557515089-18833-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: x0157990@ti.com
Subject: [master/thud][PATCH] qt-opencv-opencl-opengl-multithreaded: bump SRCREV for build fix
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
X-List-Received-Date: Fri, 10 May 2019 19:17:32 -0000
Content-Type: text/plain

* migrate to QT 5.11

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 6e8093a..2f644f6 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
@@ -9,12 +9,12 @@ DEPENDS += "opencv opencl virtual/egl ti-cgt6x-native clocl-native dsplib-c66x"
 COMPATIBLE_MACHINE = "dra7xx"
 
 PV = "1.3.3"
-PR = "r2"
+PR = "r3"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "a5dad4fbb470e526f6058095cf08a01f51abb02d"
+SRCREV = "80051ec8befd921e40cfb74a49234ed045576bbc"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


