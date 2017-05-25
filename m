Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7193D52AA4
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 23:26:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4PNQZBb003136
	for <meta-arago@arago-project.org>; Thu, 25 May 2017 18:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1495754795;
	bh=807dNRiKf0PHNM18sEYrKvQi9D7zZ4hi6pSaWpW7gdM=;
	h=From:To:Subject:Date;
	b=v3nqCM3L31gt+IiNKVBYU4cNd7UksUorC3LKrhYp1hMKLEWfXnANyJzg0FazQqBha
	dxRmY+wgZdLBOWTtghv6q8m5PuBG8VpJGbYDCoKv6+0MqOggT8gJtwew/0kMy+fmLJ
	kg0Za7DrR0WUPiLohFxD0Osp8RSQNfVFei7X/AWA=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4PNQZTt005868
	for <meta-arago@arago-project.org>; Thu, 25 May 2017 18:26:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 25 May 2017 18:26:35 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4PNQZ1I014386	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 18:26:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 May 2017 19:26:30 -0400
Message-ID: <1495754790-61777-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] gstreamer1.0-plugins-bad: Apply gstwaylandsink scale-up issue fix to AM3/4
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
X-List-Received-Date: Thu, 25 May 2017 23:26:37 -0000
Content-Type: text/plain

Pick the patch:
1. 0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch

Signed-off-by: Pooja Prajod <a0132412@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend                   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
index ff61132..3e6c8a5 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
@@ -28,11 +28,13 @@ SRC_URI_append_ti43x = " \
     file://0003-kmssink-add-YUYV-support.patch \
     file://0001-gstwaylandsink-add-input-format-I420-support.patch \
     file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
+    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
 "
 
 SRC_URI_append_ti33x = " \
     file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
     file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
+    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
 "
 
 SRC_URI_append_omap-a15 = " \
-- 
1.9.1


