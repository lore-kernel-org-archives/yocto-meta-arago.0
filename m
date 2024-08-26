Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BABC5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60358.1724699796094593829
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 762A740CB8;
	Mon, 26 Aug 2024 19:16:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vae62TppQMIz; Mon, 26 Aug 2024 19:16:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5FD1640CB0;
	Mon, 26 Aug 2024 19:16:33 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5C1AD164070;
	Mon, 26 Aug 2024 15:16:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 16/16] arago-paths.inc: remove
Date: Mon, 26 Aug 2024 15:16:25 -0400
Message-Id: <20240826191625.8267-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191625.8267-1-denis@denix.org>
References: <20240826191625.8267-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15543

From: Denys Dmytriyenko <denys@konsulko.com>

This include file was referenced from many deprecated components and is
no longer needed, remove.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/includes/arago-paths.inc           | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/includes/arago-paths.inc

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta=
-arago-extras/recipes-ti/includes/arago-paths.inc
deleted file mode 100644
index 3c0c3863..00000000
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-require recipes-ti/includes/ti-paths.inc
-
-export LIBARCH_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-libarch-tree"
-export LINALG_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-linalg-tree"
-export OCL_TIDL_FW_INSTALL_DIR_RECIPE   =3D "${installdir}/ti-opencl-tid=
l-fw-tree"
-export FFTLIB_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-fftlib-tree"
-export FFTW_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-fftw-tree"
-export TIOVX_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-tiovx-lib-tre=
e"
-
-export LIBARCH_INSTALL_DIR    =3D "${STAGING_DIR_TARGET}${LIBARCH_INSTAL=
L_DIR_RECIPE}"
-export LINALG_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${LINALG_INSTALL=
_DIR_RECIPE}"
-export OCL_TIDL_FW_INSTALL_DIR   =3D "${STAGING_DIR_TARGET}${OCL_TIDL_FW=
_INSTALL_DIR_RECIPE}"
-export FFTLIB_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${FFTLIB_INSTALL=
_DIR_RECIPE}"
-export FFTW_INSTALL_DIR       =3D "${STAGING_DIR_TARGET}${FFTW_INSTALL_D=
IR_RECIPE}"
-export TIOVX_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${TIOVX_INSTALL_=
DIR_RECIPE}"
--=20
2.25.1


