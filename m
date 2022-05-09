Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0628C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 18:00:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.626.1652119252823579737
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 May 2022 11:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 269A640BC4
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUMBC4yiLBns for <meta-arago@lists.yoctoproject.org>;
	Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BC3440C60
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D8F1A174923
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 14:00:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 3/3] gstreamer1.0-plugins-hevc_git: specify branch
Date: Mon,  9 May 2022 18:00:51 +0000
Message-Id: <20220509180051.2146987-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509180051.2146987-1-denis@denix.org>
References: <20220509180051.2146987-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 May 2022 18:00:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13844

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes these warnings:

| WARNING: gstreamer1.0-plugins-hevc-git-r5.0 do_fetch: URL: git://git.ti=
.com/processor-sdk/gst-plugin-hevc.git;protocol=3Dgit
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.
| WARNING: gstreamer1.0-plugins-hevc-git-r5.0 do_unpack: URL: git://git.t=
i.com/processor-sdk/gst-plugin-hevc.git;protocol=3Dgit
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugi=
ns-ti/gstreamer1.0-plugins-hevc_git.bb
index 33537f6e..0125c245 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2827f94fc0a1ad=
eff4d9702e97ce2979"
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
=20
-SRC_URI =3D "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=
=3Dgit \
+SRC_URI =3D "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=
=3Dgit;branch=3Dmaster \
 	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
 SRCREV =3D "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
=20
--=20
2.25.1


