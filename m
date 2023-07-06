Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61165EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 16:43:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.29630.1688661775144792592
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 09:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23CC540C85;
	Thu,  6 Jul 2023 16:42:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNh8YTtNrHsw; Thu,  6 Jul 2023 16:42:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 03CA840C16;
	Thu,  6 Jul 2023 16:42:52 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BAF81163BDE;
	Thu,  6 Jul 2023 12:42:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] opencl-examples-rtos: remove dangling bbappend
Date: Thu,  6 Jul 2023 16:42:50 +0000
Message-Id: <20230706164250.1888789-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706164250.1888789-1-denis@denix.org>
References: <20230706164250.1888789-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 16:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14771

From: Denys Dmytriyenko <denys@konsulko.com>

Underlying opencl-examples-rtos has recently been removed from
meta-arago-extras, so remove the corresponding bbappend here.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ocl-rtos/opencl-examples-rtos_git.bbappend              | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examp=
les-rtos_git.bbappend

diff --git a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rto=
s_git.bbappend b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples=
-rtos_git.bbappend
deleted file mode 100644
index f7acb63b..00000000
--- a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.b=
bappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR:append =3D ".arago0"
-
-CM_NAME =3D "OpenCL"
-CM_VERSION =3D "${PV}"
-CM_ROOT_DIR =3D "opencl_rtos_${RELEASE_TARGET}_${@'${PV}'.replace('.', '=
_')}"
-CM_DESCRIPTION =3D "OpenCL is a framework for writing programs that exec=
ute across heterogeneous systems"
--=20
2.25.1


