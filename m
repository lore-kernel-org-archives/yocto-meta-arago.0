Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 64851529AB
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2019 07:58:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4F7vUtc069358
	for <meta-arago@arago-project.org>; Wed, 15 May 2019 02:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557907050;
	bh=gS0LqsNiNsQOzqcBVlmfztb3t5NWWozP8uNLnqCEPTU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oMd4reGaYXF0KHMcdQ3fSvL+shXl6cCSUP239zbP6kU2wnD+WD4O75NGa4Swymw0B
	R/CU+7cXB02P7sOatB7owygk8OSWaVjwGIkF8qjMRqIvterqI6SGGE2D+F0N6/WxCN
	YTiJlgDdIU/7O7/4u+sYEOKmnHuhEomUJLwnfgkY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4F7vUHv068966
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 15 May 2019 02:57:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 15 May 2019 02:57:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 15 May 2019 02:57:30 -0500
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4F7vRiG067587;
	Wed, 15 May 2019 02:57:29 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 May 2019 13:27:25 +0530
Message-ID: <1557907045-23765-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557907045-23765-1-git-send-email-x0038811@ti.com>
References: <1557907045-23765-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master 1/1] gstreamer1.0-plugins-ducati: Update SRCREV with fixes
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
X-List-Received-Date: Wed, 15 May 2019 07:58:02 -0000
Content-Type: text/plain

Follwing issues have been resolved in this update
* Issue with decoding interlaced streams
* Repeated video issue with trick-play

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 7c054ef..2a33f7c 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.30"
-SRCREV = "19e911bb45757d8341ffd7819ca783ca04f5e3b1"
+PR = "${INC_PR}.31"
+SRCREV = "7e3938f0854be99583f8b204f600907ea9e6471d"
 
 BRANCH ?= "master"
 
-- 
1.9.1


