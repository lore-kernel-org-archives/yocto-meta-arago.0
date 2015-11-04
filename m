Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5A3CB52A89
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:00:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K0Kc5017938
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K0KeI018126
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:00:20 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4K0JUr001906;	Wed, 4 Nov 2015 14:00:20 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Nov 2015 15:00:12 -0500
Message-ID: <1446667217-21466-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446667217-21466-1-git-send-email-h-gou@ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] arago.conf: enable hardware mode weston for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:00:21 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c26cbc9..5c33666 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -37,6 +37,8 @@ QT_PROVIDER ?= "qt5"
 PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
 PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
 PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
+PACKAGECONFIG_append_pn-weston_ti43x    = " egl"
+PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-- 
1.9.1


