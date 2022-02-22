Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.9183.1645504914269138504
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B24CC40C7F
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1z-DobPEzrKO for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8C8140C85
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7BDA317476B
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 08/23] uvc-gadget: explicitly specify source branch
Date: Tue, 22 Feb 2022 04:41:36 +0000
Message-Id: <20220222044151.2844138-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

bitbake now requires it, as default master is no longer deterministic.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git=
.bb b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
index 39f8cb3f..79ec067d 100644
--- a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "UVC gadget userspace sample application"
 LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://uvc-gadget.c;beginline=3D1;endline=3D18;md5=
=3D414860c3c534dc95d81da9564cfb8d2a"
=20
-SRC_URI =3D "git://git.ideasonboard.org/uvc-gadget.git"
+SRC_URI =3D "git://git.ideasonboard.org/uvc-gadget.git;branch=3Dmaster"
=20
 PV =3D "1.1+git${SRCPV}"
 SRCREV =3D "aa82df887ab995473cd83c89777cdf4bc4685dd0"
--=20
2.25.1

