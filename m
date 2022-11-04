Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380F7C07E9D
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.235.1667598074394721848
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 15D8C40D89
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H11g4Eyjrmt3 for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0827540D82
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9BC1A163677
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 10/14] qtbase-conf: fix name of WAYLAND_SHELL_INTEGRATION
Date: Fri,  4 Nov 2022 21:41:08 +0000
Message-Id: <20221104214112.1221365-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14106

From: Andrew Davis <afd@ti.com>

The wl-shell is deprecated rename to xdg-shell.
Change this to remove deprecation warning.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 2 +-
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/met=
a-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 928e2cc7..c79ccd47 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -5,7 +5,7 @@ export SSL_CERT_FILE=3D/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=3D/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=3Deglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=3D1
-export QT_WAYLAND_SHELL_INTEGRATION=3Dwl-shell
+export QT_WAYLAND_SHELL_INTEGRATION=3Dxdg-shell
=20
 # SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI ca=
ll
 # from the pthread implementation. Disable this feature temporarily unti=
l
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh=
 b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 96526393..ef49b124 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -6,7 +6,7 @@ export SSL_CERT_FILE=3D/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=3D/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=3Deglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=3D1
-export QT_WAYLAND_SHELL_INTEGRATION=3Dwl-shell
+export QT_WAYLAND_SHELL_INTEGRATION=3Dxdg-shell
=20
 # SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI ca=
ll
 # from the pthread implementation. Disable this feature temporarily unti=
l
--=20
2.25.1


