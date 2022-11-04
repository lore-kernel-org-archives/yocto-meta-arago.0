Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBBFC43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.210.1667598074650673648
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 197A240D52
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtaQR-G2H0Nb for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D9DC40D7F
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B4C33163682
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 13/14] HACK: packagegroup: disable tensorflow-lite
Date: Fri,  4 Nov 2022 21:41:11 +0000
Message-Id: <20221104214112.1221365-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14110

From: Denys Dmytriyenko <denys@konsulko.com>

Tensorflow analytics demo has been disabled for some time. With recent up=
stream
changes, these 2+ year-old tensorflow-lite recipes no longer parse and ne=
ed to
be updated/maintained. Moreover, there are couple dedicated layers that p=
rovide
tensorflow recipes, so there's no need to carry it locally.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index e110fad8..b6fe62ab 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -37,29 +37,29 @@ PDM_ANOMALY_PKG_DEV =3D "\
=20
=20
 EXTRA_PACKAGES =3D ""
-EXTRA_PACKAGES:append:ti33x =3D " \
-                                arm-compute-library-dev \
-                                tensorflow-lite-dev \
-                                tensorflow-lite-staticdev \
-                                ${PDM_ANOMALY_PKG_DEV} \
-"
-EXTRA_PACKAGES:append:ti43x =3D " \
-                                arm-compute-library-dev \
-                                tensorflow-lite-dev \
-                                tensorflow-lite-staticdev \
-                                ${PDM_ANOMALY_PKG_DEV} \
-"
-EXTRA_PACKAGES:append:omap-a15 =3D " \
-                                arm-compute-library-dev \
-                                tensorflow-lite-dev \
-                                tensorflow-lite-staticdev \
-                                ${PDM_ANOMALY_PKG_DEV} \
-"
-EXTRA_PACKAGES:append:am65xx =3D " arm-compute-library-dev \
-                             tensorflow-lite-dev \
-                             tensorflow-lite-staticdev \
-                             ${PDM_ANOMALY_PKG_DEV} \
-"
+#EXTRA_PACKAGES:append:ti33x =3D " \
+#                                arm-compute-library-dev \
+#                                tensorflow-lite-dev \
+#                                tensorflow-lite-staticdev \
+#                                ${PDM_ANOMALY_PKG_DEV} \
+#"
+#EXTRA_PACKAGES:append:ti43x =3D " \
+#                                arm-compute-library-dev \
+#                                tensorflow-lite-dev \
+#                                tensorflow-lite-staticdev \
+#                                ${PDM_ANOMALY_PKG_DEV} \
+#"
+#EXTRA_PACKAGES:append:omap-a15 =3D " \
+#                                arm-compute-library-dev \
+#                                tensorflow-lite-dev \
+#                                tensorflow-lite-staticdev \
+#                                ${PDM_ANOMALY_PKG_DEV} \
+#"
+#EXTRA_PACKAGES:append:am65xx =3D " arm-compute-library-dev \
+#                             tensorflow-lite-dev \
+#                             tensorflow-lite-staticdev \
+#                             ${PDM_ANOMALY_PKG_DEV} \
+#"
=20
 IPCDEV =3D " \
 	ti-ipc-dev \
--=20
2.25.1


