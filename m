Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45381C64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 04:42:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.38610.1677300159364716715
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 20:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 31ED340C06;
	Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgvMsD8QYNlK; Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 184C140C8C;
	Sat, 25 Feb 2023 04:42:37 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D3AA3163765;
	Fri, 24 Feb 2023 23:42:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 3/6] packagegroup-addons: disable glsdk-example-apps due to dependency on libkms
Date: Sat, 25 Feb 2023 04:42:32 +0000
Message-Id: <20230225044235.1967733-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225044235.1967733-1-denis@denix.org>
References: <20230225044235.1967733-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 25 Feb 2023 04:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14232

From: Denys Dmytriyenko <denys@konsulko.com>

glsdk-example-apps uses the old libkms from libdrm, which recently got re=
moved
upstream:

https://gitlab.freedesktop.org/mesa/drm/-/commit/2b997bb4bb688be00620887c=
8646ff24ccb9396b

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 9962867b..cdf73b29 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -65,8 +65,11 @@ UTILS:append:omapl138 =3D " ti-ipc-rtos-fw"
=20
 UTILS:append:dra7xx =3D " \
                         ${UTILS_DSP} \
-                        ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
'glsdk-example-apps','',d)} \
 "
+# glsdk-example-apps depends on libkms, which has been removed upstream =
from libdrm:
+# https://gitlab.freedesktop.org/mesa/drm/-/commit/2b997bb4bb688be006208=
87c8646ff24ccb9396b
+#                        ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,'glsdk-example-apps','',d)} \
+#"
=20
 EXTRA_PACKAGES =3D " \
     nodejs \
--=20
2.25.1


