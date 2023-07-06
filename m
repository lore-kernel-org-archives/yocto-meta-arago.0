Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5885BEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 16:47:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29711.1688662038255725516
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 09:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A9F840C83;
	Thu,  6 Jul 2023 16:47:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ud_obkdnkvDp; Thu,  6 Jul 2023 16:47:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 715C240C16;
	Thu,  6 Jul 2023 16:47:16 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 33A9E163BDE;
	Thu,  6 Jul 2023 12:47:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] gstreamer: update plugins-good bbappend and corresponding patches
Date: Thu,  6 Jul 2023 16:47:15 +0000
Message-Id: <20230706164715.1889150-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706164715.1889150-1-denis@denix.org>
References: <20230706164715.1889150-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 16:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14773

From: Denys Dmytriyenko <denys@konsulko.com>

Rename bbappend for latest version. Add missing Upstream-Status to patche=
s.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch           | 2 ++
 ...002-Adding-support-for-bayer-formats-with-IR-component.patch | 2 ++
 ...2-v4l2-Give-preference-to-contiguous-format-if-support.patch | 2 ++
 ....20.%.bbappend =3D> gstreamer1.0-plugins-good_1.22.%.bbappend} | 0
 4 files changed, 6 insertions(+)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plug=
ins-good_1.20.%.bbappend =3D> gstreamer1.0-plugins-good_1.22.%.bbappend} =
(100%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-ara=
go-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l=
2-Changes-for-DMA-Buf-import-j721s2.patch
index b3314abc..4ef17a8d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -8,6 +8,8 @@ error flag from the driver. This buffer which registered =
with driver is
 used a an offset buffer without any new allocation in downstram pool.
 Set buffer offset to ref_frames plus 3.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
 ---
  sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patc=
h b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood/0002-Adding-support-for-bayer-formats-with-IR-component.patch
index 4e3f2c64..719b54bd 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
@@ -7,6 +7,8 @@ Add support for bayer formats with IR component.
 this is required for cameras like ov2312 which
 captures both RGB and IR
=20
+Upstream-Status: Pending
+
 Signed-off-by: Rahul T R <r-ravikumar@ti.com>
 ---
  sys/v4l2/ext/videodev2.h |  9 +++++++
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.pa=
tch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
index e71c2d67..f6307411 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
@@ -12,6 +12,8 @@ to NV12M over NV12.
 The logic to give preference to NV12 before NV12M whenever GST_VIDEO_FOR=
MAT_NV12
 is set.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
 Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
 ---
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-good_1.22.%.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-p=
lugins-good_1.20.%.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-good_1.22.%.bbappend
--=20
2.25.1


