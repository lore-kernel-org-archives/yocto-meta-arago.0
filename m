Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC3EC6FA98
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.894.1663041769927806925
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38F2040D7B
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lV3y7zQod67D for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 289CD40D85
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9C32A1749DE
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 37/52] all: Remove reference to
 arago-project.org
Date: Tue, 13 Sep 2022 04:02:31 +0000
Message-Id: <20220913040246.2365077-38-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14006

From: Ryan Eatmon <reatmon@ti.com>

arago-project.org is being shut down in August.  This
commit changes the last recipes that point to that
old site to point to git.ti.com, or just rmeove the
reference entirely.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/README                                      | 2 +-
 meta-arago-distro/classes/tisdk-bundle.bbclass                | 2 +-
 meta-arago-distro/conf/distro/arago.conf                      | 2 --
 meta-arago-distro/recipes-core/base-files/base-files/issue    | 2 +-
 .../recipes-core/base-files/base-files/issue.net              | 2 +-
 .../recipes-core/feed-config/arago-feed-config_1.0.bb         | 2 +-
 .../recipes-tisdk/oe-layersetup/oe-layersetup.bb              | 2 +-
 .../recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb | 4 ++--
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 2 +-
 9 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 2a3ae586..49e9d9e1 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -27,7 +27,7 @@ URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
=20
-URI: git://arago-project.org/git/meta-arago
+URI: git://git.yoctoproject.org/meta-arago
 branch: master
 revision: HEAD
 layers: meta-arago-extras
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index a3c5ee11..6a0b4eca 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -635,7 +635,7 @@ EOF
=20
         if [ "$extra_files" =3D=3D "1" ]
         then
-            source=3D"$source"" <br>Files from:<br><a href=3Dgit://arago=
-project.org/git/meta-arago.git>git://arago-project.org/git/meta-arago.gi=
t</a><br><a href=3Dgit://arago-project.org/git/meta-ti.git>git://arago-pr=
oject.org/git/meta-ti.git</a>"
+            source=3D"$source"" <br>Files from:<br><a href=3Dhttps://git=
.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><=
br><a href=3Dhttps://git.yoctoproject.org/meta-ti>https://git.yoctoprojec=
t.org/meta-ti</a>"
         fi
=20
         case "$package" in
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 542e20cb..61e0eabc 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -10,8 +10,6 @@ OPKG_ARGS:remove =3D "--prefer-arch-to-version"
=20
 TI_MIRROR =3D "http://software-dl.ti.com/processor-sdk-mirror/sources/"
 MIRRORS +=3D " \
-ftp://.*/.*       http://arago-project.org/files/sources/ \n \
-https?$://.*/.*   http://arago-project.org/files/sources/ \n \
 bzr://.*/.*      ${TI_MIRROR} \n \
 cvs://.*/.*      ${TI_MIRROR} \n \
 git://.*/.*      ${TI_MIRROR} \n \
diff --git a/meta-arago-distro/recipes-core/base-files/base-files/issue b=
/meta-arago-distro/recipes-core/base-files/base-files/issue
index 4f22fd99..53d4b7d4 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/issue
+++ b/meta-arago-distro/recipes-core/base-files/base-files/issue
@@ -4,5 +4,5 @@
 |__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_| =20
               |___|                    |___|           =20
=20
-Arago Project http://arago-project.org \n \l
+Arago Project \n \l
=20
diff --git a/meta-arago-distro/recipes-core/base-files/base-files/issue.n=
et b/meta-arago-distro/recipes-core/base-files/base-files/issue.net
index 8ce72070..7ff60fd5 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/issue.net
+++ b/meta-arago-distro/recipes-core/base-files/base-files/issue.net
@@ -4,5 +4,5 @@
 |__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_| =20
               |___|                    |___|           =20
=20
-Arago Project http://arago-project.org %h
+Arago Project %h
=20
diff --git a/meta-arago-distro/recipes-core/feed-config/arago-feed-config=
_1.0.bb b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.=
0.bb
index 4239bc8f..927a83d3 100644
--- a/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
@@ -7,7 +7,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 FEEDNAMEPREFIX ?=3D ""
 FEEDURIPREFIX ?=3D "feeds/"
-DISTRO_FEED_URI ?=3D "http://arago-project.org"
+DISTRO_FEED_URI ?=3D ""
=20
 do_compile() {
 	mkdir -p ${S}/${sysconfdir}/opkg/
diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.=
bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
index cfed0179..917aa1bf 100644
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -8,6 +8,6 @@ inherit allarch
=20
 BRANCH ?=3D "master"
 SRCREV =3D "e58f941784fb45fd826779a45b33973e6342700f"
-SRC_URI =3D "git://arago-project.org/git/projects/oe-layersetup.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/arago-project/oe-layersetup.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-=
examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-cr=
ypto-examples_git.bb
index 943a1b2b..6cd8d466 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "TI Cryptography Example Applications"
-HOMEPAGE =3D "http://arago-project.org/git/projects/?p=3Dcrypto-example-=
apps.git;a=3Dsummary"
+HOMEPAGE =3D "https://git.ti.com/cgit/arago-project-org/crypto-example-a=
pps/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://AES/aes_256.c;beginline=3D9;endline=3D35;md=
5=3D8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION =3D "console"
@@ -10,7 +10,7 @@ PR =3D "r7"
 BRANCH ?=3D "master"
 SRCREV =3D "6f4b09fffe970bb6b448369875874e798ef282f6"
=20
-SRC_URI =3D "git://arago-project.org/git/projects/crypto-example-apps.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/arago-project-org/crypto-example-apps.=
git;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index f3fcdad3..e30c5e27 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -4,7 +4,7 @@ FILESEXTRAPATHS:prepend :=3D "${ARAGOBASE}/meta-arago-ext=
ras/recipes-extended/ltp/
 require recipes-extended/ltp/ltp_${PV}.bb
=20
 SUMMARY =3D "Embedded Linux Device Driver Tests based on Linux Test Proj=
ect"
-HOMEPAGE =3D "http://arago-project.org/git/projects/test-automation/ltp-=
ddt.git"
+HOMEPAGE =3D "https://git.ti.com/cgit/test-automation/ltp-ddt/"
=20
 PROVIDES +=3D "ltp"
=20
--=20
2.25.1


