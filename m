Return-Path: <eyalr@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A058F52A23
	for <meta-arago@arago-project.org>;
	Sun,  3 Dec 2017 10:39:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3Ad8xA001815
	for <meta-arago@arago-project.org>; Sun, 3 Dec 2017 04:39:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297548;
	bh=ye1fos/gHxVv+z4FRKJ9yAeN7dx2CDhn480ruHGxYd0=;
	h=From:To:CC:Subject:Date;
	b=WChoMbXTmJfLbE6co5uAa+DJytEAbouHmPvqOxOxdCXQqYFilwhBm9qjTfd0kOAfi
	qlmIWztgPIYaV+SITUW3NfBwNJeUKrR4YqQvP/qS/hEVVPsWwjgAdQ3nOYsM0OTLQO
	lOxGrdexaYwTT8kt7YYrJOrn6XjBmSboMzN8J2fs=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3Ad7cs002759
	for <meta-arago@arago-project.org>; Sun, 3 Dec 2017 04:39:07 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:39:07 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version
	R8.7_SP3
Thread-Index: AdNsIuzxfVM0HZj8T4WuxXAxtMxYZA==
Date: Sun, 3 Dec 2017 10:39:06 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A85F9@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version R8.7_SP3
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Dec 2017 10:39:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb      | 12 ++++++--=
----
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl=
18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18x=
x.bb
index 1151012..0288a54 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -4,19 +4,19 @@
 require hostap.inc
=20
 LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D36b27801447e0662ee0138d17fe9=
3880"
+LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed84640=
18a3"
=20
-PR_append =3D "d"
+PR_append =3D "e"
=20
 FILESEXTRAPATHS_append :=3D ":${THISDIR}/hostap-daemon"
=20
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
-PV =3D "R8.6-devel-ti+git${SRCPV}"
+PV =3D "R8.7_SP3-devel-ti+git${SRCPV}"
=20
-# Tag: R8.6
-SRCREV =3D "f80fe345acf103ba6882ac8396f19584ac184904"
-BRANCH =3D "upstream_24"
+# Tag: R8.7_SP3
+SRCREV =3D "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
+BRANCH =3D "upstream_25_rebase"
=20
 PROVIDES +=3D "hostap-daemon"
 RPROVIDES_${PN} +=3D "hostap-daemon"
--=20
2.7.4


