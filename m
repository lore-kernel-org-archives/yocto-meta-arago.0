Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B7A75529B9
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 18:52:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q87IqkSh000905;
	Fri, 7 Sep 2012 13:52:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q87Iqkvc013773;
	Fri, 7 Sep 2012 13:52:46 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 7 Sep 2012 13:52:46 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH 1/2] pinmux-utility:
	Add	pinmux utility tool
Thread-Index: AQHNjSnkU9R6RY6/fUS2lBzOnDj4l5d/OYUw
Date: Fri, 7 Sep 2012 18:52:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B7D3E@DFLE09.ent.ti.com>
References: <1347040028-10047-1-git-send-email-fcooper27jr@gmail.com>
In-Reply-To: <1347040028-10047-1-git-send-email-fcooper27jr@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 1/2] pinmux-utility: Add	pinmux utility tool
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
X-List-Received-Date: Fri, 07 Sep 2012 18:52:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. A version 2 of this patch will be submitted soon.

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Friday, September 07, 2012 12:47 PM
To: meta-arago@arago-project.org
Cc: Franklin S. Cooper Jr
Subject: [meta-arago] [meta-arago-distro][PATCH 1/2] pinmux-utility: Add pi=
nmux utility tool

* Add Windows base pinmux utility.
* This application is packaged in the Sitara SDK.
* Port pinmux-utility from arago.
* The current recipe pulls in an zip file that doesn't contain license
  information. License information will be added in an updated recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../pinmux-utility/pinmux-utility.inc              |   19 +++++++++++++++
 .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   24 ++++++++++++++++=
++++
 2 files changed, 43 insertions(+), 0 deletions(-)  create mode 100644 meta=
-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc
 create mode 100644 meta-arago-distro/recipes-arago/pinmux-utility/pinmux-u=
tility_2.3.1.0.bb

diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.=
inc b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc
new file mode 100644
index 0000000..e10ee67
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Texas Instruments Pinmux Utility"
+LICENSE =3D "BSD"
+
+PR =3D "r0"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+S =3D "${WORKDIR}"
+
+installdir =3D "host-tools/pinmux_utils/windows"
+
+do_install() {
+    install -d ${D}/${installdir}
+    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
+    install ${S}/setup.exe ${D}/${installdir}
+    install ${S}/Release_Notes.txt ${D}/${installdir} }
+
+FILES_${PN} +=3D "${installdir}/*"
diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_=
2.3.1.0.bb b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_=
2.3.1.0.bb
new file mode 100644
index 0000000..624ffae
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.
+++ 1.0.bb
@@ -0,0 +1,24 @@
+require pinmux-utility.inc
+
+PR_append =3D "-arago0"
+
+SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxU=
tility_v2_03_01_00.zip;name=3Dbase"
+
+SRC_URI[base.md5sum] =3D "31f28b06f72c042e5400fc53b4a29c0e"
+SRC_URI[base.sha256sum] =3D "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f=
06e1d8d23f317a452f9"
+
+# Currently for omapl138 devices we are using a different pinmux=20
+utility # program.  This requires a separate SRC_URI as well as a=20
+different # do_install.
+SRC_URI_omapl138 =3D "\
+    https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_AM18xx=
_01_00_1076_03.zip;name=3Domapl138 \
+    "
+
+do_install_omapl138() {
+    install -d ${D}/${installdir}
+    cp -rf ${S}/bin ${D}/${installdir}/
+    cp -rf ${S}/configurations ${D}/${installdir}/ }
+
+SRC_URI[omapl138.md5sum] =3D "5a4eb834bde44c662aaf669882adbfe6"
+SRC_URI[omapl138.sha256sum] =3D "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcd=
c0bd18c34cd0221d9d450d0"
--
1.7.0.4



