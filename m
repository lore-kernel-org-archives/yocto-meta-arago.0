Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C98DC77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 19:45:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.105043.1682970344799528050
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 May 2023 12:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B008F40C1C;
	Mon,  1 May 2023 19:45:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8qy-iYBSeuI; Mon,  1 May 2023 19:45:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94A8C40C13;
	Mon,  1 May 2023 19:45:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E44F916387A;
	Mon,  1 May 2023 15:45:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] arago.conf: bump distro version
Date: Mon,  1 May 2023 19:45:41 +0000
Message-Id: <20230501194541.1823840-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 May 2023 19:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14388

From: Denys Dmytriyenko <denys@konsulko.com>

There are some relatively major changes coming to meta-ti in the form
of kernel 6.1 LTS, 2023 U-boot with binman and reworking GP/HS machine
configs and firmware handling, as well as slight layer restructuring
in meta-arago itself. Arago distro version hasn't been bumped for a
while and it is a good time to do so now while things are considerably
stable.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 094e67da..07cff76b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME =3D "Arago"
-DISTRO_VERSION =3D "2022.02"
+DISTRO_VERSION =3D "2023.04"
 DISTRO_FEED_URI ?=3D "http://lcpd.itg.ti.com"
 BUILD_VARIANT =3D "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENA=
BLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
 TISDK_VERSION ?=3D "live"
--=20
2.25.1


