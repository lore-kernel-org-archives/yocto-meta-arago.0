Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF41CC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 21:59:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11381.1647035971779935411
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 13:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6D29F40B13;
	Fri, 11 Mar 2022 21:59:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ofz1waZvNeAC; Fri, 11 Mar 2022 21:59:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AB4740A03;
	Fri, 11 Mar 2022 21:59:29 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1971C16CEAA;
	Fri, 11 Mar 2022 16:59:29 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] README: update mailing list address
Date: Fri, 11 Mar 2022 21:59:28 +0000
Message-Id: <20220311215928.60477-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Mar 2022 21:59:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13626

From: Denys Dmytriyenko <denys@konsulko.com>

The mailing list has moved from arago-project.org to yoctoproject.org

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/README | 2 +-
 meta-arago-extras/README | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 42d8e0fa..2a3ae586 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -32,7 +32,7 @@ branch: master
 revision: HEAD
 layers: meta-arago-extras
=20
-Send pull requests to meta-arago@arago-project.org
+Send pull requests to meta-arago@lists.yoctoproject.org
=20
 Layer maintainers:
 Ryan Eatmon <reatmon@ti.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index c3e3de2c..5b6e8a15 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -27,7 +27,7 @@ URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
=20
-Send pull requests to meta-arago@arago-project.org
+Send pull requests to meta-arago@lists.yoctoproject.org
=20
 Layer maintainers:
 Ryan Eatmon <reatmon@ti.com>
--=20
2.25.1


