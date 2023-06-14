Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3694EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 22:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5963.1686783343661291244
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 15:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 79E3D40C30;
	Wed, 14 Jun 2023 22:55:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGd2Z1mqkqaY; Wed, 14 Jun 2023 22:55:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5CAED40A46;
	Wed, 14 Jun 2023 22:55:41 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5DF89163A68;
	Wed, 14 Jun 2023 15:40:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] matrix: remove setenv and expire lighttpd modules
Date: Wed, 14 Jun 2023 19:40:58 +0000
Message-Id: <20230614194058.1201367-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 22:55:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14634

From: Denys Dmytriyenko <denys@konsulko.com>

New version of lighttpd no longer packages setenv and expire as separate
modules, as those are now built-in[0], remove corresponding references.

[0] https://www.lighttpd.net/2023/5/10/1.4.70/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb         | 2 +-
 meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb b/met=
a-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
index 9299a929..d983bfaf 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
@@ -61,6 +61,6 @@ do_install(){
 GUIDEPS =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui=
-browser refresh-screen",'',d)}"
 GUIDEPS:omapl138 =3D ""
=20
-RDEPENDS:${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi=
 lighttpd-module-deflate lighttpd-module-expire php php-cgi php-cli ${GUI=
DEPS}"
+RDEPENDS:${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi=
 lighttpd-module-deflate php php-cgi php-cli ${GUIDEPS}"
=20
 FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
index 16d08d1e..c932e67f 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -20,7 +20,7 @@ do_install() {
 }
=20
 FILES:${PN} =3D "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
-RDEPENDS:${PN} =3D "lighttpd lighttpd-module-setenv"
+RDEPENDS:${PN} =3D "lighttpd"
=20
 pkg_postinst_ontarget:${PN} () {
 if [ -f ${sysconfdir}/lighttpd/lighttpd.conf ] ; then
--=20
2.25.1


