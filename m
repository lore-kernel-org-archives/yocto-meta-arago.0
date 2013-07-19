Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CF1A252A1B
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2013 06:04:24 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6J64MDe030978
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 01:04:23 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6J64KZO031860
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 01:04:21 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Fri, 19 Jul 2013 14:04:20 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH-oe-layersetup 1/2] sample-files: Added conf.sample file
	for GLSDK.
Thread-Index: AQHOe8e+oM8kHwI0tUWgk+X2MHiQpZlrk++A
Date: Fri, 19 Jul 2013 06:04:20 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D544074C@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: [PATCH-oe-layersetup 1/2] sample-files: Added conf.sample file for GLSDK.
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
X-List-Received-Date: Fri, 19 Jul 2013 06:04:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


 * The local-glsdk.conf.sample files conrains the GLSDK branding.
   It will be used to generate local.conf by oe-layertool-setup.sh

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ...-linaro.conf.sample =3D> local-glsdk.conf.sample} |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)  copy sample-files/{local=
-arago-linaro.conf.sample =3D> local-glsdk.conf.sample} (99%)

diff --git a/sample-files/local-arago-linaro.conf.sample b/sample-files/loc=
al-glsdk.conf.sample
similarity index 99%
copy from sample-files/local-arago-linaro.conf.sample
copy to sample-files/local-glsdk.conf.sample
index 24d14dc..a9abea2 100644
--- a/sample-files/local-arago-linaro.conf.sample
+++ b/sample-files/local-glsdk.conf.sample
@@ -146,7 +146,6 @@ PARALLEL_MAKE =3D "-j 1"
 # be appropriate for example
=20
 DISTRO   =3D "arago"
-TOOLCHAIN_BRAND =3D "linaro"
=20
 # Set terminal types by default it expects gnome-terminal  # but we chose =
xterm @@ -158,3 +157,6 @@ BB_GENERATE_MIRROR_TARBALLS =3D "0"
=20
 # Uncomment this to remove work directory after packaging to save disk spa=
ce  #INHERIT +=3D "rm_work"
+
+# Use GLSDK branding
+ARAGO_BRAND =3D "glsdk"
--
1.7.0.4


