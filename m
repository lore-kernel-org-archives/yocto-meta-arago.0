Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4448752A0A
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 09:02:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9A92CkA028960
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507626132;
	bh=C45Ho252RH2vGz/G04h623euNy88+MlXlBwAVbzam5k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kIve7+XSEJLxSCaJymr4lvf2xBkD2nu88emkfz7PBUve93w9S/4pQEj14G501x954
	pYwSQntikDFMrCaeIWzw16VVOJRj/dR6HFnHFN1OBMmd2QxVcfluRdaqfNYKrWkHXN
	lxgioUTRCTHmblTk0SXmHEx6Me1Js2/gQGGaOx0s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A92C8T002266
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:02:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 04:02:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 04:02:11 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A928TT030144;
	Tue, 10 Oct 2017 04:02:10 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Oct 2017 14:32:02 +0530
Message-ID: <1507626126-149180-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507626126-149180-1-git-send-email-a0393906@ti.com>
References: <1507626126-149180-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 2/6] gstreamer1.0-*-ducati: Update SRCREV
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
X-List-Received-Date: Tue, 10 Oct 2017 09:02:12 -0000
Content-Type: text/plain

This update brings the following fixes:
 * mpeg2dec: close meta-plane fd in finalize
 * gstducati:Enable error concealment for mpeg2dec
 * videnc:Fix memory leak issue
 * mpeg4dec: skip frame processing for large frame size
 * decoder: Increase number of buffers in pool
 * mpeg2dec: Fix negotiation issue with playbin

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 3f806eb..3f15005 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.24"
-SRCREV = "e797c1d832cc8ee1dd66d1683991cb6d7316ed63"
+PR = "${INC_PR}.25"
+SRCREV = "09dc7c9e0064533026fc1f09f762e13a49495dec"
 
 BRANCH ?= "master"
 
-- 
1.9.1


