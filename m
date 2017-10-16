Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EB03A5299D
	for <meta-arago@arago-project.org>;
	Mon, 16 Oct 2017 10:33:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9GAXf4j030164
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 05:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508150021;
	bh=4WSuqhRRs2zB5hwnLTvJxHflL2zieAKm25vipA6+qF8=;
	h=From:To:CC:Subject:Date;
	b=F5Yo3L8bcAVmmfiQi0xEOPEUsRVBiLvsNsibfyreitwmmvWmIuWzIDbEwt0/2xgTo
	U4IpA/+p9BpgysHwdsA48zIgbwzem6DVVvsao+I964g00IxZASb+rilxx3751kvz2R
	8dXsy2SZF46/mU7Qbi4LEQc6FAjZyIo2y1lDQI+k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GAXfvQ017199
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 05:33:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 05:33:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 05:33:41 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GAXeKK015128;
	Mon, 16 Oct 2017 05:33:40 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Oct 2017 16:03:38 +0530
Message-ID: <1508150018-64989-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] gstreamer1.0-*-ducati: mpeg4dec enable error concealment
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
X-List-Received-Date: Mon, 16 Oct 2017 10:33:42 -0000
Content-Type: text/plain

This patch enables error concealment for mpeg4dec

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
index 0ecbd6e..99bedc6 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gst-plugins-ti.inc
 
-PR = "${INC_PR}.1"
-SRCREV = "6ca21aa3ec8b88b051013af503ef6b702d3c5477"
+PR = "${INC_PR}.2"
+SRCREV = "7f3326b81b838fb6c916acd1d6a3090fda12c772"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
-- 
1.9.1


