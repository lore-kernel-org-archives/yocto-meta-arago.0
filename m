Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F59C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 17:58:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43503.1702490324680561788
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 09:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 697A240C50;
	Wed, 13 Dec 2023 17:58:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5rxM9dQA3f7; Wed, 13 Dec 2023 17:58:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4022140C2E;
	Wed, 13 Dec 2023 17:58:42 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id F36C4163DB9;
	Wed, 13 Dec 2023 12:58:40 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/2] meta-arago-demos: add layer README and COPYING.MIT license
Date: Wed, 13 Dec 2023 17:58:32 +0000
Message-Id: <20231213175833.473745-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Dec 2023 17:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15058

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 COPYING.MIT =3D> meta-arago-demos/COPYING.MIT    | 0
 {meta-arago-extras =3D> meta-arago-demos}/README | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 copy COPYING.MIT =3D> meta-arago-demos/COPYING.MIT (100%)
 copy {meta-arago-extras =3D> meta-arago-demos}/README (90%)

diff --git a/COPYING.MIT b/meta-arago-demos/COPYING.MIT
similarity index 100%
copy from COPYING.MIT
copy to meta-arago-demos/COPYING.MIT
diff --git a/meta-arago-extras/README b/meta-arago-demos/README
similarity index 90%
copy from meta-arago-extras/README
copy to meta-arago-demos/README
index 5b6e8a15..bb586c14 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-demos/README
@@ -1,4 +1,4 @@
-meta-arago-extras provides additional TI SDK applications that are distr=
o-agnostic
+meta-arago-demos provides demo applications to showcase in TI SDK produc=
ts
=20
 This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
 the stable/maintenance branches (currently "master") of the correspondin=
g layers:
--=20
2.25.1


