Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0763C46CA3
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 20:44:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3756.1701463478073968412
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Dec 2023 12:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D3A8840C56;
	Fri,  1 Dec 2023 20:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_E07Y1o2woM; Fri,  1 Dec 2023 20:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B667440C3A;
	Fri,  1 Dec 2023 20:44:35 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.16.1.2])
	by mail.denix.org (Postfix) with ESMTP id C3795163D79;
	Fri,  1 Dec 2023 15:44:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] arago-gpl-notice: unbreak initscript
Date: Fri,  1 Dec 2023 15:44:27 -0500
Message-Id: <20231201204427.19192-2-denis@denix.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231201204427.19192-1-denis@denix.org>
References: <20231201204427.19192-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Dec 2023 20:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15028

From: Denys Dmytriyenko <denys@konsulko.com>

This was using a SysVinit initscript that was also called from a systemd
unit file when systemd-compat-units were enabled. With systemd and
SysVinit now fully separated in Arago, adjust initscripts accordingly to
work for both init managers.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../arago-gpl-notice/arago-gpl-notice.bb         | 16 +++++++++++-----
 .../arago-gpl-notice/gplv3-notice.service        |  4 ++--
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-no=
tice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notic=
e.bb
index 33aa31f7..6cb428a5 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -15,11 +15,17 @@ SRC_URI =3D " file://print-gplv3-packages.sh \
             file://gplv3-notice.service"
=20
 do_install(){
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${S}/print-gplv3-packages.sh ${D}${sysconfdir}/init.d/g=
plv3-notice
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_uni=
tdir}
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false',=
 d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${S}/print-gplv3-packages.sh ${D}${sysconfdir}/init.d/=
gplv3-notice
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', =
d)}; then
+		install -d ${D}${bindir}
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0755 ${S}/print-gplv3-packages.sh ${D}${bindir}/gplv3-notic=
e
+		install -m 0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_u=
nitdir}
+	fi
 }
=20
 SYSTEMD_SERVICE:${PN} =3D "gplv3-notice.service"
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-no=
tice/gplv3-notice.service b/meta-arago-distro/recipes-core/arago-gpl-noti=
ce/arago-gpl-notice/gplv3-notice.service
index 50cb8398..13aaf814 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/gp=
lv3-notice.service
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/gp=
lv3-notice.service
@@ -3,8 +3,8 @@ Description=3DPrint notice about GPLv3 packages
=20
 [Service]
 Type=3Doneshot
-ExecStart=3D/etc/init.d/gplv3-notice
-WorkingDirectory=3D/etc/init.d
+ExecStart=3D/usr/bin/gplv3-notice
+WorkingDirectory=3D/usr/bin
 StandardOutput=3Dtty
=20
 [Install]
--=20
2.35.3


