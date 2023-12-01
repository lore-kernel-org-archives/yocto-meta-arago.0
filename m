Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE89C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 20:44:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3755.1701463477933016232
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Dec 2023 12:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D0F5E40C50;
	Fri,  1 Dec 2023 20:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hff7N6-LJ_AV; Fri,  1 Dec 2023 20:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4D12409AE;
	Fri,  1 Dec 2023 20:44:35 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.16.1.2])
	by mail.denix.org (Postfix) with ESMTP id A6179163D77;
	Fri,  1 Dec 2023 15:44:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/2] bt-enable: unbreak initscript
Date: Fri,  1 Dec 2023 15:44:26 -0500
Message-Id: <20231201204427.19192-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Dec 2023 20:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15027

From: Denys Dmytriyenko <denys@konsulko.com>

This was using a SysVinit initscript that was also called from a systemd
unit file when systemd-compat-units were enabled. With systemd and
SysVinit now fully separated in Arago, adjust initscripts accordingly to
work for both init managers.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-connectivity/bt-enable/bt-enable.bb  | 16 +++++++++++-----
 .../bt-enable/bt-enable/bt-enable.service        |  4 ++--
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.b=
b b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
index 9759e688..cb7fa93f 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -21,9 +21,15 @@ SYSTEMD_SERVICE:${PN} =3D "bt-enable.service"
 RDEPENDS:${PN} +=3D "bash"
=20
 do_install () {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 bt-enable.sh ${D}${sysconfdir}/init.d/
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m0644 bt-enable.service ${D}${systemd_system_unitdir}
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false',=
 d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 bt-enable.sh ${D}${sysconfdir}/init.d/
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', =
d)}; then
+		install -d ${D}${bindir}
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0755 bt-enable.sh ${D}${bindir}
+		install -m 0644 bt-enable.service ${D}${systemd_system_unitdir}
+	fi
 }
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/b=
t-enable.service b/meta-arago-distro/recipes-connectivity/bt-enable/bt-en=
able/bt-enable.service
index 2bde23ad..9ba631a7 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enabl=
e.service
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enabl=
e.service
@@ -4,8 +4,8 @@ After=3Dnetwork.target
=20
 [Service]
 Type=3Doneshot
-ExecStart=3D/etc/init.d/bt-enable.sh
-WorkingDirectory=3D/etc/init.d
+ExecStart=3D/usr/bin/bt-enable.sh
+WorkingDirectory=3D/usr/bin
 StandardOutput=3Dsyslog
=20
 [Install]
--=20
2.35.3


