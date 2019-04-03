Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1E80752093
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2019 20:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 550B340BA8;
	Wed,  3 Apr 2019 20:00:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ose0yX3uv3kt; Wed,  3 Apr 2019 20:00:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36690407E7;
	Wed,  3 Apr 2019 20:00:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0263416D9F0;
	Wed,  3 Apr 2019 16:00:48 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  3 Apr 2019 16:00:46 -0400
Message-Id: <1554321647-3468-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] arago.conf: clean up qtbase PACKAGECONFIG a bit
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
X-List-Received-Date: Wed, 03 Apr 2019 20:01:10 -0000

xkbcommon is no longer needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 992c8a8..a0ede15 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -94,9 +94,8 @@ PACKAGECONFIG_append_pn-systemd = " coredump"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples xkbcommon-evdev accessibility gif"
+PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput"
 PACKAGECONFIG_FONTS_pn-qtbase = "fontconfig"
-PACKAGECONFIG_append_pn-qtbase = "gbm kms"
 
 # Add gstreamer in package configuration to enable video
 PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
-- 
2.7.4


