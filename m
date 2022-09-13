Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6A6C6FD38
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.883.1663041767722473968
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23BB840D4E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hS2Oz6ReIpAO for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0FD1740D68
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 531D71749CE
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 02/52] wayland: weston: Disable weston
 systemd service
Date: Tue, 13 Sep 2022 04:01:56 +0000
Message-Id: <20220913040246.2365077-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13986

From: Priya N S <priya.ns@ti.com>

Disable the weston systemd service since there is a weston initscript
that performs touchscreen calibration and other customizations.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbapp=
end b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 15835c8f..1a32f196 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR:append =3D ".arago10"
+PR:append =3D ".arago11"
=20
 SRC_URI:append =3D " \
     file://runWeston \
@@ -11,10 +11,13 @@ SRC_URI:append =3D " \
 do_install:append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
+    rm -rf ${D}${systemd_system_unitdir}
=20
     install -d ${D}${sysconfdir}/profile.d
     install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.=
d/
 }
=20
+FILES:${PN}:remove =3D "${systemd_system_unitdir}/weston.service ${syste=
md_system_unitdir}/weston.socket"
 FILES:${PN} +=3D "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
+SYSTEMD_SERVICE:${PN}:remove =3D "weston.service weston.socket"
--=20
2.25.1


