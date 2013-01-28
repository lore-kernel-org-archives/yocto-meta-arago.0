Return-Path: <mtadyshak@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9DD1A52A2F
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 19:08:11 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0SJ8AWD025994;
	Mon, 28 Jan 2013 13:08:10 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0SJ8AXf022289;
	Mon, 28 Jan 2013 13:08:10 -0600
Received: from DLEE08.ent.ti.com ([fe80::8145:89a6:94e5:8cad]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 28 Jan 2013 13:08:10 -0600
From: "Tadyshak, Michael" <mtadyshak@ti.com>
To: "fcooperjr27@gmail.com" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 24/31] pinmux-utility: Pull in Pin Mux Utility v2.4.1.0
Thread-Index: AQHN+0ck/zt7e2k1JkeOPSLxyObMMJhfHo3A
Date: Mon, 28 Jan 2013 19:08:10 +0000
Message-ID: <A0F5DB9C3FC2094990C156EEB8AF40AC43BDD73C@DLEE08.ent.ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
	<1359150851-23602-23-git-send-email-fcooper@ti.com>
In-Reply-To: <1359150851-23602-23-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Feb 2013 19:51:16 +0000
Subject: Re: [PATCH 24/31] pinmux-utility: Pull in Pin Mux Utility v2.4.1.0
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
X-List-Received-Date: Mon, 28 Jan 2013 19:08:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Franklin:

I have PMU v2.5.1.0.    That supports AM335x Silicon Rev 1.x and 2.x.  This=
 can now be put on ti.com and be patched into AMSDK.  (some time this week)=
  I need to add to the release notes and make a v2.5.2.0 first.

Michael

-----Original Message-----
From: fcooperjr27@gmail.com [mailto:fcooperjr27@gmail.com]=20
Sent: Friday, January 25, 2013 3:54 PM
To: meta-arago@arago-project.org
Cc: Tadyshak, Michael
Subject: [PATCH 24/31] pinmux-utility: Pull in Pin Mux Utility v2.4.1.0

From: Michael Tadyshak <mtadyshak@ti.com>

* Update to AM335x design spreadsheet v0.89
* Move MII Rx link signals to MISC category separate from IO Sets
* Remove note about McASP voltage restraints
* Remove PRU_PRUSS1 IO Sets

Signed-off-by: Michael Tadyshak <mtadyshak@ti.com>
---
 ...tility_2.3.1.0.bb =3D> pinmux-utility_2.4.1.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)  rename meta-arago-extras=
/recipes-devtools/pinmux-utility/{pinmux-utility_2.3.1.0.bb =3D> pinmux-uti=
lity_2.4.1.0.bb} (76%)

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utili=
ty_2.3.1.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-ut=
ility_2.4.1.0.bb
similarity index 76%
rename from meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utilit=
y_2.3.1.0.bb
rename to meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_=
2.4.1.0.bb
index 6cd5b0c..c34f9fd 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.=
1.0.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2
+++ .4.1.0.bb
@@ -5,14 +5,14 @@ COMPATIBLE_MACHINE =3D "am335x-evm|am37x-evm|am3517-evm|b=
eagleboard"
=20
 PR =3D "r0"
=20
-SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxU=
tility_v2_03_01_00.zip;name=3Dbase;subdir=3D${P}"
+SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/850/5562/PinMuxU=
tility_v2_04_01_00.zip;name=3Dbase;subdir=3D${P}"
=20
 # Temporarily add LICENSE file here since zip files don't contain any lice=
nse information. This file was grabbed  # from the License Agreement screen=
 when installing this application.
 SRC_URI +=3D "file://LICENSE"
=20
-SRC_URI[base.md5sum] =3D "31f28b06f72c042e5400fc53b4a29c0e"
-SRC_URI[base.sha256sum] =3D "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f=
06e1d8d23f317a452f9"
+SRC_URI[base.md5sum] =3D "f65ec03bbbb9e14126ac8ce2795acede"
+SRC_URI[base.sha256sum] =3D "a95fe1b436419bf97bfdcc0b7ce95e497558ad81190d9=
5dc0869ef9fc794094c"
=20
 S =3D "${WORKDIR}/${P}"
=20
--
1.7.0.4


