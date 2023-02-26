Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D02C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 07:33:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61845.1677396776053173284
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 25 Feb 2023 23:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C57340C37;
	Sun, 26 Feb 2023 07:32:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21BB_8lZvven; Sun, 26 Feb 2023 07:32:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D28040C06;
	Sun, 26 Feb 2023 07:32:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 63F5F16375B;
	Sun, 26 Feb 2023 02:32:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] all: unbreak populate_sdk task (again)
Date: Sun, 26 Feb 2023 07:32:51 +0000
Message-Id: <20230226073251.231699-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 26 Feb 2023 07:33:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14234

From: Denys Dmytriyenko <denys@konsulko.com>

Being able to run populate_sdk task against minimal and base images
has always been supported by Arago, though needed to get fixed once
in a while, e.g.:
https://git.yoctoproject.org/meta-arago/commit/?id=3Dd47710c8219e036cb700=
5bc0a22099e63c5e1901

This time around the issue is due to upstream packages lmbench and
mbedtls both installing /usr/bin/hello binary and causing a conflict
when the files collide in the sysroot.

The fix has been submitted upstream to meta-oe and meta-networking
layers of the meta-openembedded repo:
https://patchwork.yoctoproject.org/project/oe/list/?series=3D10748

For now add local bbappends with the same fix, which can be removed
when the fix is merged upstream and backported to kirkstone.

While at it, also look into the conflict caused by matrix launcher
packaging function being reused by multiple subpackages, resulting
in lots of file conflicts between them. There's a lot of rework
required for the matrix (and it might get moved to another layer
altogether), but for now just cutoff the reverse dependency from
development -dev packages.

With this simple change it is now possible to run populate_sdk task
even against the default full/graphics tisdk-default-image.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-benchmark/lmbench/lmbench_%.bbappend              | 2 ++
 .../recipes-connectivity/mbedtls/mbedtls_%.bbappend           | 4 ++++
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc     | 3 +++
 3 files changed, 9 insertions(+)
 create mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%=
.bbappend
 create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtl=
s_%.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappe=
nd b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
new file mode 100644
index 00000000..96dd2010
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
@@ -0,0 +1,2 @@
+ALTERNATIVE:${PN} +=3D "hello"
+ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bba=
ppend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
new file mode 100644
index 00000000..f3c16796
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
@@ -0,0 +1,4 @@
+inherit update-alternatives
+
+ALTERNATIVE:${PN}-programs +=3D "hello"
+ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/=
meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
index 2bcc908b..adb998e1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
@@ -38,3 +38,6 @@ do_install:append(){
     # other appends.
     cd -
 }
+
+RDEPENDS:${PN}-dev =3D ""
+RRECOMMENDS:${PN}-dev =3D ""
--=20
2.25.1


