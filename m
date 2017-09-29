Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3144F52A34
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINXLg024512
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709413;
	bh=occhx35xLbe+/OKlcFac69qcI338pR8E4vNv88wIVfE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=g8Z4VTtfMaIQNqJIAJVHx8oMTTdyAkv1vjvvJEmrzyzyKIQfMNXcPXO5oXK/HWsZz
	SB4typFBbQkT8NkvDSTSiQ4sw0sPZR2k1jNc/NjcyjaVLaNax2KSSIyZoU3IAlheZK
	9MYck9mr8jUAc4DAh2cRWzb6FO/f8TkGUr2QbndE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINXT8010196
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8S006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:07 -0400
Message-ID: <1506709407-16448-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 03/ arago-core-tisdk-image: add additional packagegroup for X11 (xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:36 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/images/arago-core-tisdk-image.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-image.bbappend
index 2c804f0..58195b3 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -1,7 +1,9 @@
-PR_append = ".tisdk13"
+PR_append = ".tisdk14"
 
 IMAGE_INSTALL_append = " \                                                                                                                   
       packagegroup-arago-tisdk-hmi-sdk-host \ 
+      ${@bb.utils.contains('MACHINE_FEATURES','xsgx','packagegroup-arago-tisdk-qte-sdk-host','',d)} \
+      ${@bb.utils.contains('MACHINE_FEATURES','xsgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
  "
 
 # The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
-- 
1.9.1


