Return-Path: <poojaprajod@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6232252A2A
	for <meta-arago@arago-project.org>;
	Mon, 29 May 2017 09:07:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4T97JRM014873
	for <meta-arago@arago-project.org>; Mon, 29 May 2017 04:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496048839;
	bh=oGZZawAcr4co4cQxx7R5bB9ses43suPwgej8WX7OQUw=;
	h=From:To:CC:Subject:Date;
	b=WL+IZlj1SV5c+zJKlxdHZVIj/d3N+OtUzPHnHpqaloeVKoqS6G7ARLItrWmr3u0wz
	NlV5Zoo+0eVsUf7Y2jhrURQxiHOM6kk8/HIxfyEOndO08tKpWs5Qlcs0fSfl73tUrv
	gxN1pbS1RkWeWP0DEfAwFYNjEgViqeXko9CszRbo=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4T97JTg023640
	for <meta-arago@arago-project.org>; Mon, 29 May 2017 04:07:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 29 May 2017 04:07:18 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4T97Gr9004637;
	Mon, 29 May 2017 04:07:17 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 May 2017 14:37:14 +0530
Message-ID: <1496048834-85427-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [morty/master] gstvpe: Update SRCREV and PR to pick bug fix
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
X-List-Received-Date: Mon, 29 May 2017 09:07:19 -0000
Content-Type: text/plain

Pick the bug fix:
1. gstvpe: Increase number of buffers in pool

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index a991e00..00a6232 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.15"
-SRCREV = "3c44b9f4769d8a2b1e3b3441d789a62047c7f940"
+PR = "${INC_PR}.16"
+SRCREV = "4fe4beaa1498e27878bf04020aef0099c17f2262"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
-- 
1.9.1


