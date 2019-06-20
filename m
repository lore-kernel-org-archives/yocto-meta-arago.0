Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A0706529A4
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 19:44:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KJhlHi112662
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561059827;
	bh=/sLaYstyPZot/HDwjtfYy4OCgUuOvHCaH2xJlhGhlGk=;
	h=From:To:Subject:Date;
	b=ct5lak80DQ82VfjpRhC93AWFG6pcMy1hm1QjcFG2gwoB5BNGKBlt9KkExwkdTvakD
	OvmKxSiHH9OtGmDS2Et1ELLg4REf1OSOoGzbxWeXNtiNG8vPwN/OKMHoylMYrYItxQ
	eFaX+RMIxVX1GWAQh95lRZMjNqCaGSby4DxOGKX4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KJhlVj053401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:43:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 14:43:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 14:43:47 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KJhlla058248
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:43:47 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 15:42:55 -0400
Message-ID: <20190620194255.4161-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/ti2019.01][PATCH] arago.conf: add xkbcommon-evdev back to qtbase PACKAGECONFIG
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
X-List-Received-Date: Thu, 20 Jun 2019 19:44:30 -0000
Content-Type: text/plain

xkbcommon-evdev is required for keyboard input

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 7fde15de..a7f55f0c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -99,7 +99,7 @@ PACKAGECONFIG_append_pn-systemd = " coredump"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput"
+PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput xkbcommon-evdev"
 PACKAGECONFIG_FONTS_pn-qtbase = "fontconfig"
 
 # Add gstreamer in package configuration to enable video
-- 
2.17.1


