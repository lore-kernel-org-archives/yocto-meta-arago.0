Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 43FDE52A15
	for <meta-arago@arago-project.org>;
	Thu, 21 Jun 2018 06:29:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5L6Tp17011597
	for <meta-arago@arago-project.org>; Thu, 21 Jun 2018 01:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529562591;
	bh=LGue/vkrBdhoMvNWTN9xTjTYScKWCWFYCHhQxhEIaSI=;
	h=From:To:CC:Subject:Date;
	b=ySz1lG2BMybNYYH51vQCO4xWKuncCGRczhNWsGXATpaH2EYESq2ycgmSRiqXsO0x8
	taxdw+BnlaVuhtaArVhGSWMlvs4SMMLEtEj6K7hGj1w5u+EhwV/IZ2SkiPwtWZgRhY
	nBBinChE4r8w2/D8ewMEOx7dx9xwzRcLJ5BNVbWo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5L6TpJi002140
	for <meta-arago@arago-project.org>; Thu, 21 Jun 2018 01:29:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 21 Jun 2018 01:29:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 21 Jun 2018 01:29:51 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5L6Tnvl031658;
	Thu, 21 Jun 2018 01:29:50 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Jun 2018 11:59:47 +0530
Message-ID: <1529562587-46299-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] gst1.0-plugins-bad: gstwaylandsink: Update SRCREV
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
X-List-Received-Date: Thu, 21 Jun 2018 06:29:57 -0000
Content-Type: text/plain

This patch resets the redraw_pending in PAUSE to READY transition

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index f732a02..9d297c5 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -38,8 +38,8 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
 
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "3a5a7f778b3c3259faab04748e7b10f0fd696aab"
+SRCREV_omap-a15 = "9a1cd733fa57e1eace21524456b652087d04168e"
 SRCREV_ti43x = "3a5a7f778b3c3259faab04748e7b10f0fd696aab"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
-PR = "r27"
+PR = "r29"
-- 
1.9.1


