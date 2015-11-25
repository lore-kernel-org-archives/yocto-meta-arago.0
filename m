Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6058F52A90
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 23:08:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN842u010147
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN8338017183
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:08:03 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPN83pd018422	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 17:08:03 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 18:07:55 -0500
Message-ID: <1448492879-1050-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
References: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] arago.conf: Configure Weston based on the availability of SGX
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
X-List-Received-Date: Wed, 25 Nov 2015 23:08:07 -0000
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


