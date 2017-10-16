Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BE4005299D
	for <meta-arago@arago-project.org>;
	Mon, 16 Oct 2017 11:06:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9GB6NoN020538
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 06:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508151983;
	bh=Mha3SD4X4hfQ5Xj3br3AEbhFIPS6XJ5MdUlbmt3OEos=;
	h=From:To:CC:Subject:Date;
	b=ptD1KIa+5yCgj0GHMtqwTnsSOJZWAo9zduEwcwyTcryiLr30I9O90TyebHQKx7CiZ
	WY+ba6PmSo6wFATdSJPEknPqUIYgjk6mQ+9mDzWRfHiB42mnfYt8wB5paR5cVk2j1h
	4Csuf0MgkdehnwIcKoksRfooxsQkz4pfsEKIZzbQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GB6NV2030833
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 06:06:23 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 06:06:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 06:06:23 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GB6L1v023013;
	Mon, 16 Oct 2017 06:06:22 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Oct 2017 16:36:20 +0530
Message-ID: <1508151980-185900-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty] gstreamer1.0-*-ducati: Update SRCREV
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
X-List-Received-Date: Mon, 16 Oct 2017 11:06:24 -0000
Content-Type: text/plain

This update brings the following changes:
 * mpeg4dec: Enable errorConcealment in mpeg4dec
 * mpeg2dec: close meta-plane fd in finalize
 * gstducati:Enable error concealment for mpeg2dec

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index d5e8d17..6c6a474 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.27"
-SRCREV = "7205d7cb75944e816622d5daca88804819ff16d3"
+PR = "${INC_PR}.28"
+SRCREV = "7f3326b81b838fb6c916acd1d6a3090fda12c772"
 
 BRANCH ?= "master"
 
-- 
1.9.1


