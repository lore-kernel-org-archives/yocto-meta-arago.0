Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 2654152A52
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 09:02:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9A92E3M009792
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507626134;
	bh=xIQjx1qV3hN6MWWo0ySCyY8EHVyESQMLckKyCPJbmdc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k1Pq8S82FubUpa7Qpi9baSDtBM6Gk8JACNwQyEAuJF2rF2wEH3AEj8iQX1pZ8zW/d
	1rXDyI2Lb3D38o1zfeFiBX+23bZmTxueWnikgpVAwafI9kXWuaEKMIoJYCkCAxarkP
	4bdM46gnnVIPiFdCUw3Ko5+av5BiXTBkxHkaQYDI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A92Es2002629
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:02:14 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 04:02:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 04:02:14 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A928TW030144;
	Tue, 10 Oct 2017 04:02:13 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Oct 2017 14:32:05 +0530
Message-ID: <1507626126-149180-5-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507626126-149180-1-git-send-email-a0393906@ti.com>
References: <1507626126-149180-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 5/6] glsdk-example-apps: Update SRCREV
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
X-List-Received-Date: Tue, 10 Oct 2017 09:02:15 -0000
Content-Type: text/plain

This update brings in the following fixes:
 * Makefile: fix library linking issues
 * v4l2-m2m: add support for DSS WB device
 * vpe: Rename testcase to v4l2-m2m

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index fc1ff46..9515735 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -14,9 +14,9 @@ inherit autotools pkgconfig
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 	 "
 
-SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
+SRCREV = "491b3129a5c5267d72aba8878b50731f27356d3a"
 
-PR = "r47"
+PR = "r48"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
1.9.1


