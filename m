Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395E9D0E6FA
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 15:18:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19330.1764083911572055905
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 07:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5211840C82;
	Tue, 25 Nov 2025 15:18:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmaAKzlWEmUd; Tue, 25 Nov 2025 15:18:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3464040A2F;
	Tue, 25 Nov 2025 15:18:27 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 6E9671756B1;
	Tue, 25 Nov 2025 10:18:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH v2] arago.conf: set preferred runtime provider for weston-init
Date: Tue, 25 Nov 2025 10:18:25 -0500
Message-Id: <20251125151825.20660-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Nov 2025 15:18:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16836

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes: 64dcb725 ("weston-init-arago: add weston-init to the rprovides")

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - fix typo in commit message

 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 61041568..abbe4faf 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -71,6 +71,7 @@ PACKAGECONFIG:pn-glmark2 =3D "drm-gles2 wayland-gles2"
 # Set this to empty string to prevent xwayland config from being added
 PACKAGECONFIG:pn-weston-init-arago =3D ""
 PREFERRED_RPROVIDER_virtual-emptty-conf =3D "weston-init-arago"
+PREFERRED_RPROVIDER_weston-init =3D "weston-init-arago"
=20
 # Enable testing for opencl and vulkan with piglit
 PACKAGECONFIG:append:pn-piglit =3D " \
--=20
2.35.3


