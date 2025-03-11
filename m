Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3454C35FF5
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.20219.1741723306412150430
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A50F40CAA;
	Tue, 11 Mar 2025 20:01:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBOCuDQHOnD4; Tue, 11 Mar 2025 20:01:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6BE6840CB0;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7CAB71642EF;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 8/8] netopeer2-server: move and clean up
Date: Tue, 11 Mar 2025 16:01:39 -0400
Message-Id: <20250311200139.3845524-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311200139.3845524-1-denis@denix.org>
References: <20250311200139.3845524-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15987

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Combine with bbappend
* Shorten SUMMARY, split DESCRIPTION
* Update DEPENDS - remove systemd and add sysrepo-native
* Don't hardcode /usr when passing to CMake
* Also pass -DSYSREPO_SETUP=3DOFF to CMake
* Update installing scripts - remove user/group, add permissions

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-Add-EST-Yang-Models.patch            |  0
 .../netopeer2-server/netopeer2-server         |  0
 .../netopeer2-serverd.service                 |  0
 .../sysrepo}/netopeer2-server_git.bb          | 38 +++++++++++--------
 .../netopeer2-server_git.bbappend             |  5 ---
 5 files changed, 22 insertions(+), 21 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server =3D> recipes-=
extended/sysrepo}/netopeer2-server/0001-Add-EST-Yang-Models.patch (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server =3D> recipes-=
extended/sysrepo}/netopeer2-server/netopeer2-server (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server =3D> recipes-=
extended/sysrepo}/netopeer2-server/netopeer2-serverd.service (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server =3D> recipes-=
extended/sysrepo}/netopeer2-server_git.bb (46%)
 delete mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/ne=
topeer2-server_git.bbappend

diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2=
-server/0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-extend=
ed/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-=
server/0001-Add-EST-Yang-Models.patch
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/000=
1-Add-EST-Yang-Models.patch
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2=
-server/netopeer2-server b/meta-arago-extras/recipes-extended/sysrepo/net=
opeer2-server/netopeer2-server
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-=
server/netopeer2-server
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/net=
opeer2-server
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2=
-server/netopeer2-serverd.service b/meta-arago-extras/recipes-extended/sy=
srepo/netopeer2-server/netopeer2-serverd.service
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-=
server/netopeer2-serverd.service
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/net=
opeer2-serverd.service
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2=
-server_git.bb b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-ser=
ver_git.bb
similarity index 46%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-=
server_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git=
.bb
index 89a05b2b..073aed5e 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server=
_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
@@ -1,21 +1,22 @@
-SUMMARY =3D "Netopeer2 is a set of tools implementing network configurat=
ion tools based on the NETCONF Protocol."
-DESCRIPTION =3D "Netopeer2 is based on the new generation of the NETCONF=
 and YANG libraries - libyang and libnetconf2. The Netopeer server uses s=
ysrepo as a NETCONF datastore implementation."
+SUMMARY =3D "Implementation of network configuration tools based on NETC=
ONF Protocol"
+DESCRIPTION =3D "Netopeer2 is based on the new generation of the NETCONF=
 and YANG libraries - \
+libyang and libnetconf2. The Netopeer server uses sysrepo as a NETCONF d=
atastore implementation."
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41daedff0b24958b2eba4f9086d78=
2e1"
=20
-SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps;bran=
ch=3Dmaster \
-          ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
-	        'file://netopeer2-server', '', d)} \
-          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
-	        'file://netopeer2-serverd.service', '', d)} \
-          "
+SRC_URI =3D " \
+    git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps;branch=3Dmast=
er \
+    file://0001-Add-EST-Yang-Models.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'file://netopeer=
2-server', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://netopeer2=
-serverd.service', '', d)} \
+"
=20
 PV =3D "2.2.35+git"
 SRCREV =3D "6d1cb61ef3ce2274a91dc9cbc51318bcd0b54697"
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "libyang libnetconf2 sysrepo systemd"
+DEPENDS =3D "libyang libnetconf2 sysrepo sysrepo-native"
 RDEPENDS:${PN} +=3D "bash curl"
=20
 FILES:${PN} +=3D "${datadir}/yang* ${datadir}/netopeer2/* ${libdir}/sysr=
epo-plugind/*"
@@ -23,8 +24,14 @@ FILES:${PN} +=3D "${datadir}/yang* ${datadir}/netopeer=
2/* ${libdir}/sysrepo-plugin
 inherit cmake pkgconfig
 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', ''=
, d)}
=20
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX=3D/usr -DCMAKE_BUILD_TYPE:Str=
ing=3DRelease -DINSTALL_MODULES=3DOFF -DGENERATE_HOSTKEY=3DOFF -DMERGE_LI=
STEN_CONFIG=3DOFF"
+EXTRA_OECMAKE =3D " \
+    -DCMAKE_INSTALL_PREFIX=3D${prefix} \
+    -DCMAKE_BUILD_TYPE:String=3DRelease \
+    -DSYSREPO_SETUP=3DOFF \
+    -DINSTALL_MODULES=3DOFF \
+    -DGENERATE_HOSTKEY=3DOFF \
+    -DMERGE_LISTEN_CONFIG=3DOFF \
+"
=20
 SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "netopeer2-serverd.service"
@@ -32,12 +39,11 @@ SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
=20
 do_install:append () {
     install -d ${D}${sysconfdir}/netopeer2/scripts
-    install -o root -g root ${S}/scripts/setup.sh ${D}${sysconfdir}/neto=
peer2/scripts/setup.sh
-    install -o root -g root ${S}/scripts/merge_hostkey.sh ${D}${sysconfd=
ir}/netopeer2/scripts/merge_hostkey.sh
-    install -o root -g root ${S}/scripts/merge_config.sh ${D}${sysconfdi=
r}/netopeer2/scripts/merge_config.sh
-    install -d ${D}${sysconfdir}/netopeer2
-    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${S}/scripts/setup.sh ${D}${sysconfdir}/netopeer2/sc=
ripts/setup.sh
+    install -m 0755 ${S}/scripts/merge_hostkey.sh ${D}${sysconfdir}/neto=
peer2/scripts/merge_hostkey.sh
+    install -m 0755 ${S}/scripts/merge_config.sh ${D}${sysconfdir}/netop=
eer2/scripts/merge_config.sh
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
+        install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${UNPACKDIR}/netopeer2-server ${D}${sysconfdir}/=
init.d/
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2=
-server_git.bbappend b/meta-arago-extras/recipes-sysrepo/netopeer2-server=
/netopeer2-server_git.bbappend
deleted file mode 100644
index f8a9febe..00000000
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server=
_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-SRC_URI +=3D "file://0001-Add-EST-Yang-Models.patch"
-
-FILES:${PN} +=3D "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysre=
po-plugind/*"
--=20
2.25.1


