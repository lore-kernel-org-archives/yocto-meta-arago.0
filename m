Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.9112.1645504919654495879
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1CF6540A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnW2pSdlqTYz for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C080740C8F
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A908817476F
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 12/23] linuxptp: make bbappend version-specific
Date: Tue, 22 Feb 2022 04:41:40 +0000
Message-Id: <20220222044151.2844138-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This bbappend is specific to TI 3.0 fork and breaks with latest 3.1.1 rec=
ipe.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../linuxptp/{linuxptp_%.bbappend =3D> linuxptp_3.0.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/linuxptp/{linuxptp_%.bbapp=
end =3D> linuxptp_3.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.b=
bappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bb=
append
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bb=
append
rename to meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bb=
append
--=20
2.25.1

