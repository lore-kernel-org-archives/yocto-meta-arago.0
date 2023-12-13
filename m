Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3EEC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 17:58:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.43121.1702490324397811919
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 09:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 73A3540C2E;
	Wed, 13 Dec 2023 17:58:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4vb1-thvjsK; Wed, 13 Dec 2023 17:58:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C72340C3A;
	Wed, 13 Dec 2023 17:58:42 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0CAE6163DC2;
	Wed, 13 Dec 2023 12:58:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] meta-arago-test: minor README correction
Date: Wed, 13 Dec 2023 17:58:33 +0000
Message-Id: <20231213175833.473745-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213175833.473745-1-denis@denix.org>
References: <20231213175833.473745-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Dec 2023 17:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15057

From: Denys Dmytriyenko <denys@konsulko.com>

This layer does not depend on meta-qt5.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-test/README | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-test/README b/meta-arago-test/README
index 6f912472..8f1f9993 100644
--- a/meta-arago-test/README
+++ b/meta-arago-test/README
@@ -23,10 +23,6 @@ branch: master
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
=20
-URI: https://github.com/meta-qt5/meta-qt5
-branch: master
-revision: HEAD
-
 Send pull requests to meta-arago@lists.yoctoproject.org
=20
 Layer maintainers:
--=20
2.25.1


