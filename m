Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BCDF5A8B6
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:56:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2701.1776714964169803956
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 12:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4881D40C82;
	Mon, 20 Apr 2026 19:56:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgjC3xh2HNmL; Mon, 20 Apr 2026 19:56:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 273B040C2B;
	Mon, 20 Apr 2026 19:56:02 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 285E917C35F;
	Mon, 20 Apr 2026 15:56:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] mesa-demos: set default PREFERRED_VERSION
Date: Mon, 20 Apr 2026 15:55:57 -0400
Message-Id: <20260420195557.22133-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Apr 2026 19:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17476

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Set default PREFERRED_VERSION for mesa-demos to use the version from
OE-Core when not using Arago distro. When Arago distro is used, it
gets changed to our version in arago-prefs.conf
This addresses the signature change issue in yocto-check-layer.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-arago-distro/conf/layer.conf                         | 2 ++
 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/l=
ayer.conf
index 2ad036f5..af3be2b9 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -39,3 +39,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
 "
=20
 HOSTTOOLS_NONFATAL +=3D "corkscrew getent socket"
+
+PREFERRED_VERSION_mesa-demos =3D "9.0.0"
diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/=
meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
index 2da3ceff..62cb0ee6 100644
--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;begi=
nline=3D1;endline=3D20;md5=3Da481
 SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain"
 SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
=20
-DEFAULT_PREFERENCE =3D "-1"
 PV =3D "9.0.0+git"
=20
 inherit meson pkgconfig features_check
--=20
2.35.3


