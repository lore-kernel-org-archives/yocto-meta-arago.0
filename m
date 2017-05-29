Return-Path: <poojaprajod@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EECE7529BB
	for <meta-arago@arago-project.org>;
	Mon, 29 May 2017 08:45:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4T8jLPN012156
	for <meta-arago@arago-project.org>; Mon, 29 May 2017 03:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496047521;
	bh=5/P4E3gwCwqulm0WMF/hmOuS1AuOnbwvmb5AIxY2b8E=;
	h=From:To:CC:Subject:Date;
	b=qbx6XxydbyJ8erFapwdYoia3iMdk6Av4JRaNH4m1YH8xG8DQmljgQhLHXA6N2lkHo
	/sTabJ5cuAUCuszLSnIERpiL16+ixNGP7+EBe268npV+qHA1YD5D64enivX7cxEiqb
	3e8XxTKXt4cgr9u0GiqRZYFdkskEgqpX6enjatkA=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4T8jLk6023331
	for <meta-arago@arago-project.org>; Mon, 29 May 2017 03:45:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 29 May 2017 03:45:21 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4T8jJoH011986;
	Mon, 29 May 2017 03:45:20 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 May 2017 14:15:17 +0530
Message-ID: <1496047517-69192-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [morty/master] gstducati: Update SRCREV and PR to pick bug fixes
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
X-List-Received-Date: Mon, 29 May 2017 08:45:22 -0000
Content-Type: text/plain

Pick the following bug fixes on ducati:
1. decoder: Increase number of buffers in pool
2. mpeg2dec: Fix negotiation issue with playbin

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 3f806eb..0cd7a23 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.24"
-SRCREV = "e797c1d832cc8ee1dd66d1683991cb6d7316ed63"
+PR = "${INC_PR}.25"
+SRCREV = "f4cd1300aa5afadc81c2b4099ea1ee1cb29e6856"
 
 BRANCH ?= "master"
 
-- 
1.9.1


