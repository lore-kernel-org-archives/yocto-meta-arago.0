Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7AD3D52090
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 13:21:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TDL2wi015176
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 07:21:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TDL17M022113
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 07:21:01 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 29 Jan 2015 07:21:01 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] crda: Fix issue with upstream repository
Thread-Index: AQHQO8UU/U2whhjFv0miv/85Nj4a4pzXFLoA
Date: Thu, 29 Jan 2015 13:21:01 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140E7C45@DFLE09.ent.ti.com>
References: <1422537068-15904-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1422537068-15904-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] crda: Fix issue with upstream repository
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
X-List-Received-Date: Thu, 29 Jan 2015 13:21:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

I also ran into this issue and tested a similar patch last night.=20

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of R, Karthik
Sent: Thursday, January 29, 2015 8:11 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] [PATCH] crda: Fix issue with upstream repository

* The download from wireless.kernel.org is not working.
* Pointing to an alternate source
* Adapted to the new way of picking up the required
  version of the regulatory.bin

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/crda/crda_1.1.3.bbappend  |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.=
bbappend

diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappen=
d b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
new file mode 100644
index 0000000..6dd888a
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
@@ -0,0 +1,15 @@
+SRC_URI =3D "ftp://www.kernel.org/pub/software/network/crda/${BP}.tar.bz2;=
name=3Dcrda \
+          =20
+ftp://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-20=
13.01.11.tar.gz;name=3Dbin \ "
+
+SRC_URI[bin.md5sum] =3D "57f2d4c2cdfa2d20c859bca202dd6ece"
+SRC_URI[bin.sha256sum] =3D "608c2fea6ca840a51bc1a8c35c53ca4c20a78d4f78c3bc=
7cbdcd53dee0cc0cf8"
+
+
+do_install() {
+    oe_runmake SBINDIR=3D${sbindir}/ install
+
+    install -d ${D}${libdir}/crda/
+
+    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin=20
+${D}${libdir}/crda/regulatory.bin }
--
1.7.9.5

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

