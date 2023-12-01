Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C311FC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 20:50:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3879.1701463811179565474
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Dec 2023 12:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8464140C3A;
	Fri,  1 Dec 2023 20:50:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RuHX71PQQWY; Fri,  1 Dec 2023 20:50:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13A3E409AE;
	Fri,  1 Dec 2023 20:50:08 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.16.1.2])
	by mail.denix.org (Postfix) with ESMTP id 371E0163D77;
	Fri,  1 Dec 2023 15:50:08 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] weston-init: provide a custom beaglebone weston.ini file
Date: Fri,  1 Dec 2023 15:50:06 -0500
Message-Id: <20231201205006.3991-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Dec 2023 20:50:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15029

From: Denys Dmytriyenko <denys@konsulko.com>

AM335x has some display/graphics hardware limitations and moreover
BeagleBone Black only has external HDMI output, hence add a custom
weston.ini that sets core/gbm-format=3Drgb565 and output/name=3DHDMI-A-1
to work out of the box. The rest of the .ini file is unmodified from
the generic one.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../wayland/weston-init/beaglebone/weston.ini | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-ini=
t/beaglebone/weston.ini

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/beagl=
ebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init=
/beaglebone/weston.ini
new file mode 100644
index 00000000..9fd9851d
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/w=
eston.ini
@@ -0,0 +1,85 @@
+# configuration file for Weston
+
+[core]
+idle-time=3D0
+#modules=3Dxwayland.so,cms-colord.so
+#shell=3Ddesktop-shell.so
+gbm-format=3Drgb565
+require-input=3Dfalse
+
+[shell]
+locking=3Dfalse
+animation=3Dzoom
+panel-position=3Dtop
+startup-animation=3Dfade
+#background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg
+#background-color=3D0xff002244
+#background-type=3Dtile
+#clock-format=3Dminutes
+#panel-color=3D0x90ff0000
+#locking=3Dtrue
+#animation=3Dzoom
+#startup-animation=3Dfade
+#binding-modifier=3Dctrl
+#num-workspaces=3D6
+#cursor-theme=3Dwhiteglass
+#cursor-size=3D24
+
+#lockscreen-icon=3D/usr/share/icons/gnome/256x256/actions/lock.png
+#lockscreen=3D/usr/share/backgrounds/gnome/Garden.jpg
+#homescreen=3D/usr/share/backgrounds/gnome/Blinds.jpg
+#animation=3Dfade
+
+#[launcher]
+#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=3D/usr/bin/gnome-terminal
+
+#[launcher]
+#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=3D/usr/bin/weston-terminal
+
+#[launcher]
+#icon=3D/usr/share/icons/hicolor/24x24/apps/google-chrome.png
+#path=3D/usr/bin/google-chrome
+
+#[launcher]
+#icon=3D/usr/share/icons/gnome/24x24/apps/arts.png
+#path=3D/build/weston-0lEgCh/weston-1.11.0/weston-flower
+
+#[input-method]
+#path=3D/usr/libexec/weston-keyboard
+
+[output]
+name=3DHDMI-A-1
+#mode=3D1680x1050
+#transform=3D90
+#icc_profile=3D/usr/share/color/icc/colord/Bluish.icc
+
+#[output]
+#name=3DVGA1
+#mode=3D173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
+#transform=3Dflipped
+
+#[output]
+#name=3DX1
+#mode=3D1024x768
+#transform=3Dflipped-90
+
+[libinput]
+touchscreen_calibrator=3Dtrue
+#enable_tap=3Dtrue
+
+#[touchpad]
+#constant_accel_factor =3D 50
+#min_accel_factor =3D 0.16
+#max_accel_factor =3D 1.0
+
+[screen-share]
+command=3D/usr/bin/weston --backend=3Drdp-backend.so --shell=3Dfullscree=
n-shell.so --no-clients-resize
+
+#[xwayland]
+#path=3D/usr/bin/Xwayland
+
+[autolaunch]
+# launch the calibrator on startup if a touchscreen is detected
+path=3D/usr/bin/weston-launch-calibrator
--=20
2.35.3


