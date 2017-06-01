Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5944752A49
	for <meta-arago@arago-project.org>;
	Thu,  1 Jun 2017 12:49:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v51Cn8PN005671
	for <meta-arago@arago-project.org>; Thu, 1 Jun 2017 07:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496321348;
	bh=M4wNBF34mrH7ZQTgDtMug7ohHFsFWBILXg4v1dnf08s=;
	h=From:To:Subject:Date;
	b=K+II1TOLRNFB4XfUQrAC+h/+o4/VDlt1s2nt0tJtA4MY2igJ7629i3DEcuZnS0JEE
	wq87Yqd3onAt0uyMvyQK1WooWvIBYAd6kyw68BID+ld1b65VdKxgnLn3EO+smxJElj
	3fY/12eOY2N5FgQFMV4L4yMNuKRR2lHFPEXbyzX8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v51Cn8uo021121
	for <meta-arago@arago-project.org>; Thu, 1 Jun 2017 07:49:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 07:49:07 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v51Cn7SH005179	for <meta-arago@arago-project.org>;
	Thu, 1 Jun 2017 07:49:08 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Jun 2017 08:49:03 -0400
Message-ID: <1496321343-17626-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v2] gstreamer1.0-plugins-bad: Apply gstwaylandsink scale-up issue fix for AM4
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
X-List-Received-Date: Thu, 01 Jun 2017 12:49:08 -0000
Content-Type: text/plain

Pick the patch:
1. 0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch

Signed-off-by: Pooja Prajod <a0132412@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
index ff61132..d9762af 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
@@ -28,6 +28,7 @@ SRC_URI_append_ti43x = " \
     file://0003-kmssink-add-YUYV-support.patch \
     file://0001-gstwaylandsink-add-input-format-I420-support.patch \
     file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
+    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
 "
 
 SRC_URI_append_ti33x = " \
-- 
1.9.1


