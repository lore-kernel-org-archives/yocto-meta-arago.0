Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D0AA85296D
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2018 15:58:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9IFvrNR105151
	for <meta-arago@arago-project.org>; Thu, 18 Oct 2018 10:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539878273;
	bh=pRz1gHKOQPIlg/eY2t6aX8321bYeFCkzcbA0eqh03qg=;
	h=From:To:Subject:Date;
	b=EIwvKsGZOde6XL5ZG1JRTaCL2rMFru/pWx1Kob62nYT8qJI5uN4+v4S9Skyv0/QsW
	9L/rOQKX/jRJUdh03t/PT5yyXjC982nMrJ8LCJOOWq1b1MDuTt3gXd+jNxNoL+T0tO
	KN9zLFCMLpM8MtIDGbL73yiyCUCuAa7G4pxbVJlA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9IFvrfW031773
	for <meta-arago@arago-project.org>; Thu, 18 Oct 2018 10:57:53 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 18 Oct 2018 10:57:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 18 Oct 2018 10:57:53 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9IFvqXV029796
	for <meta-arago@arago-project.org>; Thu, 18 Oct 2018 10:57:53 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 18 Oct 2018 11:57:07 -0400
Message-ID: <1539878227-19641-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] weston-conf: replace panel-location with panel-position at weston.ini
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
X-List-Received-Date: Thu, 18 Oct 2018 15:58:03 -0000
Content-Type: text/plain

The panel-location has been replaced with panel-position since Weston 2.0.0

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
index 3fb2018..8a9dd99 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
@@ -4,7 +4,7 @@ require-input=false
 [shell]
 locking=false
 animation=zoom
-panel-location=top
+panel-position=top
 startup-animation=fade
 
 [screensaver]
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
index a78a843..c0ae9f9 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
@@ -4,7 +4,7 @@ require-input=false
 [shell]
 locking=false
 animation=zoom
-panel-location=top
+panel-position=top
 startup-animation=fade
 
 [screensaver]
-- 
1.9.1


