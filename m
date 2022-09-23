Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7383CC07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:33:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.354.1663954430270923559
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 624F740D98;
	Fri, 23 Sep 2022 17:33:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgHpa61NmUql; Fri, 23 Sep 2022 17:33:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4650940D96;
	Fri, 23 Sep 2022 17:33:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 330B51749CE;
	Fri, 23 Sep 2022 13:33:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH v2] websocketd: enable network access for
 compile task
Date: Fri, 23 Sep 2022 17:33:47 +0000
Message-Id: <20220923173347.836948-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:33:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14043

From: Denys Dmytriyenko <denys@konsulko.com>

Since go modules do own fetching during compile time.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - also export https_proxy

 .../recipes-devtools/websocketd/websocketd_0.4.1.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4=
.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 2ec6a19a..66475726 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -12,7 +12,10 @@ SRCREV =3D "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
=20
 # bitbake only exports proxy variables during fetching, but go handles
 # module fetching on its own during compile and needs proxy settings
+# along with network access for the task
 export http_proxy
+export https_proxy
+do_compile[network] =3D "1"
=20
 # Development package contains all the examples in different languages
 INSANE_SKIP:${PN}-dev =3D "file-rdeps"
--=20
2.25.1


