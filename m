Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id D76A95299D
	for <meta-arago@arago-project.org>;
	Mon, 31 Jul 2017 11:31:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VBVLuE027792
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501500681;
	bh=MEl9/GuYI/o9h3N2yCk4d+XxEis4Ok1/aqXqTKVVLEI=;
	h=From:To:CC:Subject:Date;
	b=buEsy9CggpdtjKRZ1gpG+sZh6trfcByADP8yPO9dg613yx5IV7bHXbnZsXeq2zbm8
	dVqt3ZD8eVCjdbmZruWif3f5htsj+jUbmlhwTDvK2eYmniTBEyV66FQ7iJon4x2yPK
	Q1bFGQKoxaiSbn4PMeiUG62UFWdCC5tGbBXQc8Ns=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBVLqX022028
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:31:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 06:31:20 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBVJwB025497;
	Mon, 31 Jul 2017 06:31:19 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Jul 2017 17:01:17 +0530
Message-ID: <1501500677-150188-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] gst*-ducati: Update SRCREV with bug fixes
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
X-List-Received-Date: Mon, 31 Jul 2017 11:31:22 -0000
Content-Type: text/plain

This change fixes an issue with mpeg4dec to
skip frame processing for large frame size

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 0cd7a23..fed2e72 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.25"
-SRCREV = "f4cd1300aa5afadc81c2b4099ea1ee1cb29e6856"
+PR = "${INC_PR}.26"
+SRCREV = "c8f6051ac3dff629aa00c22667fcc33cb1cfd074"
 
 BRANCH ?= "master"
 
-- 
1.9.1


