Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37875C4167D
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.226.1667598074457158569
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 37D0540D8A
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iyX-L1TvJKU for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E1D640D86
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C0BAA16367D
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 14/14] HACK: packagegroup: disable HEVC gstreamer plugin
Date: Fri,  4 Nov 2022 21:41:12 +0000
Message-Id: <20221104214112.1221365-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14108

From: Denys Dmytriyenko <denys@konsulko.com>

It was based on old gstreamer plugin code base, which no longer builds as=
 it
tries to fetch during configure step some git modules over anonymous git =
that
is now disabled upstream.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-gst-sdk-target.bb          | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-gst-sdk-target.bb
index ef5624ec..845cc7ff 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
@@ -18,8 +18,8 @@ GSTREAMER_DSP =3D " \
     ${@['','gstreamer1.0-plugins-dsp66-dev'][oe.utils.all_distro_feature=
s(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'ds=
p', True, False, d)]} \
 "
=20
+#    gstreamer1.0-plugins-hevc-dev=20
 GSTREAMER_DEPS:append:dra7xx =3D " \
-    gstreamer1.0-plugins-hevc-dev \
     ${GSTREAMER_DSP} \
 "
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb
index 65e315a1..e8a639bd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
@@ -21,8 +21,8 @@ GSTREAMER_DSP =3D " \
     ${@['','gstreamer1.0-plugins-dsp66'][oe.utils.all_distro_features(d,=
 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', =
True, False, d)]} \
 "
=20
+#    gstreamer1.0-plugins-hevc=20
 GSTREAMER_DEPS:append:dra7xx =3D " \
-    gstreamer1.0-plugins-hevc \
     ${GSTREAMER_DSP} \
 "
=20
--=20
2.25.1


