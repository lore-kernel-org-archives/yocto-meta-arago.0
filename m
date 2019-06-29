Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1A13E529FD
	for <meta-arago@arago-project.org>;
	Sat, 29 Jun 2019 04:39:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5T4cHHA087846
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 23:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561783097;
	bh=erguH6nuh0ZQ38pueRTpaNaKLd7KUzL0FEwsblak/GA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X0+UylfxV2LtNVzArPdJp1LxnlszyQqY92bWD23WwxaighclWZGBClF0YC4xDAEUz
	xUtzN82wDNqxEZQPECZfvegTlE6Dsk0G2PSLsU+JXX9t0iKHvLEMxkhELVBVqTUoV2
	ayvLKOpK21bAcd3ZVfYBPWVJyoanxyrruVM/EJbw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5T4cGGa089618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 23:38:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 23:38:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 23:38:16 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5T4cGWq081432;
	Fri, 28 Jun 2019 23:38:16 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5T4cGm25487; Fri, 28 Jun 2019 23:38:16 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 28 Jun 2019 23:39:53 -0500
Message-ID: <20190629043954.7786-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190629043954.7786-1-g-tammana@ti.com>
References: <20190629043954.7786-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 2/3] weston: Update gbm dependency to virtual
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
X-List-Received-Date: Sat, 29 Jun 2019 04:39:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gbm providers are different for different EVMs, update dependency to
virtual provider.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../recipes-graphics/wayland/weston_5.0.0.bbappend            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
index cc456b41..f622f670 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -1,8 +1,8 @@
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/libgbm mtdev"
 
-PR_append = ".arago31"
+PR_append = ".arago32"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
2.22.0


