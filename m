Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 31AC252092
	for <meta-arago@arago-project.org>;
	Wed,  3 Oct 2018 10:10:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93AAUIi118877
	for <meta-arago@arago-project.org>; Wed, 3 Oct 2018 05:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538561430;
	bh=XuvjXV1hrPJCLaJm0hYdWDVBDViGtizZqZJ6Z/t3WRk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BshnCilnbFlg2EOgINeJiWS8QTmfyjOUjjIKoq3yW03frLOJfNRuYD64tx+Lb5dfn
	OoQm/bu7ANMnyKAsjxQTcKgSVVtBq4w3cfoe5Wc+QGuLNDT7GRStHkyqJ7+hMc2o1F
	oIfpp/gM/SH77CmKhsYrSn5HUO5U8cM5TINoqAfw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93AAUL8003171
	for <meta-arago@arago-project.org>; Wed, 3 Oct 2018 05:10:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 3 Oct 2018 05:10:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 3 Oct 2018 05:10:30 -0500
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93AAQIW010521;
	Wed, 3 Oct 2018 05:10:29 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Oct 2018 15:40:24 +0530
Message-ID: <1538561424-29788-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538561424-29788-1-git-send-email-x0038811@ti.com>
References: <1538561424-29788-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: karthik.ramanan@ti.com
Subject: [rocko/master 1/1] omapdrmtest: Update SRCREV with latest fix
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
X-List-Received-Date: Wed, 03 Oct 2018 10:10:39 -0000
Content-Type: text/plain

This updates brings UYVY format support with
eglCreateImageKHR

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 80ab68e..c877e58 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,8 +7,8 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r27"
-SRCREV = "b6c02d24be6f8dae939168c154cf2345b33e459d"
+PR = "r28"
+SRCREV = "20338b9f575ffe9c18c12bbed41c16069d27ccf4"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


