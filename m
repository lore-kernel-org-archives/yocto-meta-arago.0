Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 71E3052A19
	for <meta-arago@arago-project.org>;
	Tue,  1 Dec 2015 15:30:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1FUZCx030088
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1FUZ08029297
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:30:34 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FUY6r003898	for <meta-arago@arago-project.org>;
	Tue, 1 Dec 2015 09:30:35 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Dec 2015 10:30:14 -0500
Message-ID: <1448983818-21402-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
References: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/5] arago.conf: Configure Weston based on the availability of SGX
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
X-List-Received-Date: Tue, 01 Dec 2015 15:30:43 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4:
For ti43x: replace fbdev with egl only if SGX is included at MACHINE_FEATURES

Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 meta-arago-distro/conf/distro/arago.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 14af8c4..1ee4e58 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -42,8 +42,8 @@ QT_PROVIDER ?= "qt5"
 PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
 PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
 PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
-PACKAGECONFIG_append_pn-weston_ti43x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
+PACKAGECONFIG_append_pn-weston_ti43x    = "${@base_contains('MACHINE_FEATURES', 'sgx', ' egl', '', d)}"
+PACKAGECONFIG_remove_pn-weston_ti43x    = "${@base_contains('MACHINE_FEATURES', 'sgx', 'fbdev', '', d)}"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-- 
1.9.1


