Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9AB9352A20
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2014 22:36:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s14Mavxf002430
	for <meta-arago@arago-project.org>; Tue, 4 Feb 2014 16:36:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14MavgU021146
	for <meta-arago@arago-project.org>; Tue, 4 Feb 2014 16:36:57 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 4 Feb 2014 16:36:57 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Aravind Batni <aravindbr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [PATCH] ti-csl: new recipe providing CSL for
	TI-KeyStone2 devices -This package provides chip support	library
	interface files
Thread-Index: AQHPIfJZVDVPG63kxkiC+fxmXLz0I5qlrYcA
Date: Tue, 4 Feb 2014 22:36:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159948BED@DLEE11.ent.ti.com>
References: <1391549971-21990-1-git-send-email-aravindbr@ti.com>
In-Reply-To: <1391549971-21990-1-git-send-email-aravindbr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-csl: new recipe providing CSL for	TI-KeyStone2 devices -This package provides chip support	library interface files
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
X-List-Received-Date: Tue, 04 Feb 2014 22:36:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Aravind Batni
>Sent: Tuesday, February 04, 2014 4:40 PM
>To: meta-arago@arago-project.org; Nelson, Sam
>Cc: Aravind Batni
>Subject: [meta-arago] [PATCH] ti-csl: new recipe providing CSL for
>TI-KeyStone2 devices -This package provides chip support library
>interface files

Thanks for the submission.  Some review comments below.

This looks like a malformed commit message

>
>Signed-off-by: Aravind Batni <aravindbr@ti.com>
>---
> meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   27
>++++++++++++++++++++
> 1 file changed, 27 insertions(+)
> create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-
>csl_git.bb
>
>diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>new file mode 100644
>index 0000000..2896506
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>@@ -0,0 +1,27 @@
>+DESCRIPTION =3D "TI CSL"
>+LICENSE =3D "TI BSD"

Any reason this can't just be BSD?

>+LIC_FILES_CHKSUM =3D
>"file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
>+
>+COMPATIBLE_MACHINE =3D "keystone-evm"
>+ALLOW_EMPTY_${PN} =3D "1"

Why do you want an empty package?  Judging from below this is because you a=
re only trying to install headers right and those will be part of the dev p=
ackage?  Just want to make sure I understand your purpose here.

>+
>+PR =3D "r1"

Start with r0

>+BRANCH=3D"master"
>+LLD-NAME=3D"csl"

Unused variable?

>+SRC_URI =3D "git://git.ti.com/keystone-rtos/common-csl-
>ip.git;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+S =3D "${WORKDIR}/git"
>+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
>+SRCREV =3D "f6f90144c14e1ee783c4b893b52e54830be8166e"

Just a nitpick but this would make more sense being declared before the SRC=
_URI line.  Next to the BRANCH setting.

>+
>+do_install () {
>+    install -d ${D}/${includedir}/ti/csl
>+    cp -r ${S}/* ${D}/${includedir}/ti/csl

Use install command.  Also, no need for the / between ${D} and ${includedir=
}

>+#   Retain only header files
>+    cd ${D}/${includedir}/ti/csl
>+    find . \( -name "*.xdt" -o -name "*.bld" -o -name "*.bat" -o
>-name "*.c" -o -name "*.xdc" -o -name "*.asm" -o -name "*.xs" \) |
>xargs rm -rf

This seems kludgy.  Why not just find all the .h files and then install tho=
se with a for loop?

>+    rm -rf build docs
>+    mkdir -p src/ip/serdes_sb

Implicit assumption that you are in a certain directory.  Please reference =
everything from ${D}

>+    cp -r ${S}/src/ip/serdes_sb/V0 src/ip/serdes_sb

Same comment about the assumption of directory location.

>+}
>+
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

