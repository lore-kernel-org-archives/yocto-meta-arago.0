Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.9105.1645504912189709879
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D86140AE9
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eze6Kmmm0-Wr for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8275E40A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3EF3717476E
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 03/23] linux-libc-headers: correct the version to be 5.10
Date: Tue, 22 Feb 2022 04:41:31 +0000
Message-Id: <20220222044151.2844138-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This actually pulls the correct 5.10 branch, but when merging from Dunfel=
l,
it was not renamed correctly by mistake. Update the recipe name according=
ly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../{linux-libc-headers_5.4.bb =3D> linux-libc-headers_5.10.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-h=
eaders_5.4.bb =3D> linux-libc-headers_5.10.bb} (100%)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-li=
bc-headers_5.4.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/l=
inux-libc-headers_5.10.bb
similarity index 100%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-lib=
c-headers_5.4.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-=
headers_5.10.bb
--=20
2.25.1

