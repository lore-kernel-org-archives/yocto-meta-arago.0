Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 967205298B
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2020 06:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 92F8140C14;
	Wed,  4 Mar 2020 06:27:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PcFSJx4oOE5V; Wed,  4 Mar 2020 06:27:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75E9E40BFC;
	Wed,  4 Mar 2020 06:27:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BFA3817443D;
	Wed,  4 Mar 2020 01:27:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  4 Mar 2020 01:27:31 -0500
Message-Id: <1583303251-43665-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] arago.conf, alsa-plugins: disconnect alsa from pulseaudio
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
X-List-Received-Date: Wed, 04 Mar 2020 06:29:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                     |  4 ++++
 .../recipes-multimedia/alsa/alsa-plugins_%.bbappend          | 12 ------------
 2 files changed, 4 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f760bf9..5bc6a24 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -137,6 +137,10 @@ PACKAGECONFIG_append_pn-libsdl2 = " kmsdrm"
 # Enable cryptodev/devcrypto engine in OpenSSL 1.1
 PACKAGECONFIG_append_pn-openssl = " cryptodev-linux"
 
+# Disable pulseaudio routing in alsa by default
+PACKAGECONFIG_remove_pn-alsa-plugins = "pulseaudio"
+RDEPENDS_pulseaudio-server_remove = "alsa-plugins-pulseaudio-conf"
+
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE = "arago-tiny-image"
 
diff --git a/meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend b/meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend
deleted file mode 100644
index 7e98c00..0000000
--- a/meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-PR_append = ".arago0"
-
-do_install_append() {
-	# We don't want pulse to be the default audio device, even when installed
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
-		mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example || true
-	fi
-}
-
-FILES_${PN}-pulseaudio-conf += "\
-	${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example \
-"
-- 
2.7.4


