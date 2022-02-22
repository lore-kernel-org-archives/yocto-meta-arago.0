Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1044.1645573756083871086
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 15:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC94340C30;
	Tue, 22 Feb 2022 23:49:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsOO0gxHJDhi; Tue, 22 Feb 2022 23:49:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A473340A77;
	Tue, 22 Feb 2022 23:49:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 77E3B174738;
	Tue, 22 Feb 2022 18:49:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] README: update meta-ti new layer structure and maintainer
Date: Tue, 22 Feb 2022 23:49:09 +0000
Message-Id: <20220222234910.614211-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

As meta-ti has recently been split into sublayers, update README accordin=
gly.
Also update the layer maintainer entry.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/README | 3 ++-
 meta-arago-extras/README | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 3e0d41d2..42d8e0fa 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -11,6 +11,7 @@ layers: meta
 URI: git://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
+layers: meta-ti-bsp, meta-ti-extras
=20
 URI: git://git.yoctoproject.org/meta-arm
 branch: master
@@ -34,5 +35,5 @@ layers: meta-arago-extras
 Send pull requests to meta-arago@arago-project.org
=20
 Layer maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index d754ffdf..c3e3de2c 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -11,6 +11,7 @@ layers: meta
 URI: git://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
+layers: meta-ti-bsp, meta-ti-extras
=20
 URI: git://git.yoctoproject.org/meta-arm
 branch: master
@@ -29,5 +30,5 @@ revision: HEAD
 Send pull requests to meta-arago@arago-project.org
=20
 Layer maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
--=20
2.25.1

