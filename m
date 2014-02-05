Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CA90052A1B
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 17:32:55 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15HWrsw013876
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 11:32:54 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15HWpVR010187
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 23:02:52 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 6 Feb 2014 01:32:51 +0800
From: Aravind Batni <aravindbr@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [PATCH] ti-csl: new recipe providing CSL for
	TI-KeyStone2 devices -This package provides chip support	library
	interface files
Thread-Index: AQHPIfmeAXWX5qKwZ0CZXMX7Y6qeypqm5qDw
Date: Wed, 5 Feb 2014 17:32:50 +0000
Message-ID: <941289A393E94C478C153EF5E432FDBB3EA68B50@DBDE04.ent.ti.com>
References: <1391549971-21990-1-git-send-email-aravindbr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159948BED@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159948BED@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-csl: new recipe providing CSL for	TI-KeyStone2 devices -This package provides chip support	library interface files
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 17:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback.  See response in-lined.

-Best Regards,
Aravind


> -----Original Message-----
> From: Maupin, Chase
> Sent: Tuesday, February 04, 2014 5:37 PM
> To: Aravind Batni; meta-arago@arago-project.org; Nelson, Sam
> Subject: RE: [meta-arago] [PATCH] ti-csl: new recipe providing CSL for TI=
-
> KeyStone2 devices -This package provides chip support library interface f=
iles
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Aravind Batni
> >Sent: Tuesday, February 04, 2014 4:40 PM
> >To: meta-arago@arago-project.org; Nelson, Sam
> >Cc: Aravind Batni
> >Subject: [meta-arago] [PATCH] ti-csl: new recipe providing CSL for
> >TI-KeyStone2 devices -This package provides chip support library
> >interface files
>=20
> Thanks for the submission.  Some review comments below.
>=20
> This looks like a malformed commit message
>=20
> >
> >Signed-off-by: Aravind Batni <aravindbr@ti.com>
> >---
> > meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   27
> >++++++++++++++++++++
> > 1 file changed, 27 insertions(+)
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-
> >csl_git.bb
> >
> >diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> >b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> >new file mode 100644
> >index 0000000..2896506
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> >@@ -0,0 +1,27 @@
> >+DESCRIPTION =3D "TI CSL"
> >+LICENSE =3D "TI BSD"
>=20
> Any reason this can't just be BSD?
>=20
[Aravind Batni] The components were approved by TI OSRB for TI BSD (has TI =
copyright statement on the top and BSD license text below). Not sure if we =
can change this to BSD=20
> >+LIC_FILES_CHKSUM =3D
> >"file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
> >+
> >+COMPATIBLE_MACHINE =3D "keystone-evm"
> >+ALLOW_EMPTY_${PN} =3D "1"
>=20
> Why do you want an empty package?  Judging from below this is because
> you are only trying to install headers right and those will be part of th=
e dev
> package?  Just want to make sure I understand your purpose here.
>=20
> >+
> >+PR =3D "r1"
>=20
> Start with r0
>=20
[Aravind Batni]  Fixed
> >+BRANCH=3D"master"
> >+LLD-NAME=3D"csl"
>=20
> Unused variable?
>=20
[Aravind Batni] Removed the unused variable
> >+SRC_URI =3D "git://git.ti.com/keystone-rtos/common-csl-
> >ip.git;protocol=3Dgit;branch=3D${BRANCH}"
> >+
> >+S =3D "${WORKDIR}/git"
> >+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17 SRCREV =3D
> >+"f6f90144c14e1ee783c4b893b52e54830be8166e"
>=20
> Just a nitpick but this would make more sense being declared before the
> SRC_URI line.  Next to the BRANCH setting.
>=20
[Aravind Batni] Fixed
> >+
> >+do_install () {
> >+    install -d ${D}/${includedir}/ti/csl
> >+    cp -r ${S}/* ${D}/${includedir}/ti/csl
>=20
> Use install command.  Also, no need for the / between ${D} and ${included=
ir}
>=20
> >+#   Retain only header files
> >+    cd ${D}/${includedir}/ti/csl
> >+    find . \( -name "*.xdt" -o -name "*.bld" -o -name "*.bat" -o
> >-name "*.c" -o -name "*.xdc" -o -name "*.asm" -o -name "*.xs" \) |
> >xargs rm -rf
>=20
> This seems kludgy.  Why not just find all the .h files and then install t=
hose
> with a for loop?
>=20
> >+    rm -rf build docs
> >+    mkdir -p src/ip/serdes_sb
>=20
[Aravind Batni] How about something like this: find ${S} -name "*.h" -type =
f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl=20
> Implicit assumption that you are in a certain directory.  Please referenc=
e
> everything from ${D}
>=20
> >+    cp -r ${S}/src/ip/serdes_sb/V0 src/ip/serdes_sb
>=20
> Same comment about the assumption of directory location.
>=20
[Aravind Batni]  same as before: How about this: find ${S}/src/ip/serdes_sb=
/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/=
csl/src/ip/serdes_sb/V0=20
> >+}
> >+
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

