Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0F769529BA
	for <meta-arago@arago-project.org>;
	Sat, 27 Apr 2019 03:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C35F40B86;
	Sat, 27 Apr 2019 03:41:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Utk3L93ki75g; Sat, 27 Apr 2019 03:41:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6989407DA;
	Sat, 27 Apr 2019 03:41:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4A2D216E503;
	Fri, 26 Apr 2019 23:41:27 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 26 Apr 2019 23:41:26 -0400
Message-Id: <1556336486-43081-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] arago.conf: ensure all gstreamer plugins for keystone/omapl1 don't pull GFX deps
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
X-List-Received-Date: Sat, 27 Apr 2019 03:41:54 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a0ede15..dbf726f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -104,7 +104,12 @@ PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
 PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
 
 # No GFX on Keystone or OMAPL1
+PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-base_keystone = "wayland egl gles2"
+PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-good_keystone = "wayland egl gles2"
 PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-bad_keystone = "wayland egl gles2"
+
+PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-base_omapl1 = "wayland egl gles2"
+PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-good_omapl1 = "wayland egl gles2"
 PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-bad_omapl1 = "wayland egl gles2"
 
 PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
-- 
2.7.4


