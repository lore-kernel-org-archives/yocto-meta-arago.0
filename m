Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 03E2D529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:17:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IHoDV005937
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:17:50 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IHodZ025128
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:17:50 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 12:17:50 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Aravind Batni <aravindbr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] ti-csl: new recipe providing CSL for
	TI-KeyStone2 devices
Thread-Index: AQHPIp4rH6877x6jP0Cz0UGnyAn1Dpqm99nw
Date: Wed, 5 Feb 2014 18:17:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994C2C5@DLEE11.ent.ti.com>
References: <1391624082-26580-1-git-send-email-aravindbr@ti.com>
In-Reply-To: <1391624082-26580-1-git-send-email-aravindbr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] ti-csl: new recipe providing CSL for	TI-KeyStone2 devices
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
X-List-Received-Date: Wed, 05 Feb 2014 18:17:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Aravind Batni
>Sent: Wednesday, February 05, 2014 1:15 PM
>To: meta-arago@arago-project.org
>Cc: Aravind Batni
>Subject: [meta-arago] [PATCH v2] ti-csl: new recipe providing CSL
>for TI-KeyStone2 devices
>
>-This package provides chip support library interface files
>
>Signed-off-by: Aravind Batni <aravindbr@ti.com>
>---
>* grouped SRC_URI and SRCREV together
>* Modified do_install to copy the needed files only instead of
>copy everything
>  delete unwanted files.
>---
>---
> meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   22
>++++++++++++++++++++
> 1 file changed, 22 insertions(+)
> create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-
>csl_git.bb
>
>diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>new file mode 100644
>index 0000000..37f7937
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>@@ -0,0 +1,22 @@
>+DESCRIPTION =3D "TI CSL"
>+LICENSE =3D "TI BSD"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
>+
>+COMPATIBLE_MACHINE =3D "keystone-evm"
>+ALLOW_EMPTY_${PN} =3D "1"
>+
>+PR =3D "r0"
>+BRANCH=3D"master"
>+SRC_URI =3D "git://git.ti.com/keystone-rtos/common-csl-
>ip.git;protocol=3Dgit;branch=3D${BRANCH}"
>+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
>+SRCREV =3D "f6f90144c14e1ee783c4b893b52e54830be8166e"
>+
>+S =3D "${WORKDIR}/git"
>+
>+do_install () {
>+    cd ${S}
>+    install -d ${D}${includedir}/ti/csl
>+    find . -name "*.h" -type f | xargs -I {} cp --parents {}
>${D}${includedir}/ti/csl
>+    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {}
>cp --parents {} ${D}${includedir}/ti/csl/src/ip/serdes_sb/V0
>+}
>+
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

