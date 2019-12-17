Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 40970529B5
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 11:33:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHBVbkV035940
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576582297;
	bh=cy2FSLzRqGMFzJC+DbFhwYl3zibpxhRDXdshkcWUPTc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=L0RtPi0Y7QMXtP7NCPxOnVNg9jY6x9rKAeKVkc8vyU+HJHpu5AztnICW3R+IgfRkz
	lMqZ90Q4oyQQEeXKmiZ7E6wQ8REZXTAkLozoKmPoC4O2h/1kI6c9G5aUqMXhhIAI35
	IJkj/ENMjuxTF8QdXA2541qrbcuaJocC0OqZaakE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHBVb6m123890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:37 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 05:31:37 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 05:31:37 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master/thud/ti2019.05] [PATCH 2/2]
	tidl-import: add support for tensorflow-lite floating point models
Thread-Index: AQHVsT3NA3c1qnzYdkm2Qxk5VJ546Ke+OJfw
Date: Tue, 17 Dec 2019 11:31:37 +0000
Message-ID: <9964bbc3d2a14b398cc106a060759f87@ti.com>
References: <20191212224014.23027-1-a0271529@ti.com>
	<20191212224014.23027-2-a0271529@ti.com>
In-Reply-To: <20191212224014.23027-2-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master/thud/ti2019.05] [PATCH 2/2] tidl-import: add support for tensorflow-lite floating point models
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
X-List-Received-Date: Tue, 17 Dec 2019 11:33:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please backport to ti2019.05.

Thank you,
Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Gou, Hongmei
Sent: Thursday, December 12, 2019 5:40 PM
To: meta-arago@arago-project.org
Cc: Gou, Hongmei
Subject: [EXTERNAL] [meta-arago] [master/thud/ti2019.05] [PATCH 2/2] tidl-i=
mport: add support for tensorflow-lite floating point models

* The newer version also has the following changes:
  1. Bug fixes for ResNet-18 model
  2. Conv2d kernel types are automatically set when models are imported,
     and do not need to be explicitly configured.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-ti/tidl-utils/tidl-import_git.bb         | 12 +++++++++---
 .../recipes-ti/tidl-utils/tidl-utils.inc             |  6 +++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/m=
eta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index ad1dad13..72ef8773 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://modules/ti_dl/inc/itidl_ti.h;b=
eginline=3D1;endline=3D34;m
=20
 S =3D "${WORKDIR}/git/src/importTool/"
=20
-DEPENDS =3D "protobuf zlib protobuf-native"
+DEPENDS =3D "protobuf zlib protobuf-native flatbuffers tensorflow-lite fla=
tbuffers-native tensorflow-lite-native"
=20
 EXTRA_OEMAKE +=3D "TIARM_TOOLS=3D${GCC_ARM_NONE_TOOLCHAIN}"
 EXTRA_OEMAKE +=3D "XDAIS_PATH=3D${XDAIS_INSTALL_DIR}"
@@ -18,8 +18,14 @@ EXTRA_OEMAKE +=3D "CORE=3Deve"
 EXTRA_OEMAKE +=3D "TARGET_BUILD=3Drelease"
 EXTRA_OEMAKE +=3D "TARGET_PLATFORM=3DPC"
=20
-EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUXENV=3Dx86 LINUX_IMPORT_TOOL=
=3D64BIT PROTOBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=
=3D${STAGING_DIR_NATIVE}/usr/include"
-EXTRA_MAKE_ARGS_class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/bi=
n/${TARGET_PREFIX} PROTOBUF_LIB_DIR=3D${STAGING_LIBDIR} PROTOBUF_INC_DIR=3D=
${STAGING_INCDIR} LINUXENV=3Doearm"
+EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUXENV=3Dx86 LINUX_IMPORT_TOOL=
=3D64BIT \
+                   PROTOBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROTOB=
UF_INC_DIR=3D${STAGING_DIR_NATIVE}/usr/include \
+                   FLATBUFFERS_INC_DIR=3D${STAGING_DIR_NATIVE}$/usr/includ=
e/flatbuffers \
+                   TF_LITE_GENERATED_PATH=3D${STAGING_DIR_NATIVE}/usr/incl=
ude/tensorflow/lite/schema"
+EXTRA_MAKE_ARGS_class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/bi=
n/${TARGET_PREFIX} \
+                                PROTOBUF_LIB_DIR=3D${STAGING_LIBDIR} PROTO=
BUF_INC_DIR=3D${STAGING_INCDIR} \
+                                FLATBUFFERS_INC_DIR=3D${STAGING_INCDIR}/fl=
atbuffers \
+                                TF_LITE_GENERATED_PATH=3D${STAGING_INCDIR}=
/tensorflow/lite/schema LINUXENV=3Doearm"
=20
 EXTRA_OEMAKE +=3D "${EXTRA_MAKE_ARGS}"
=20
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-=
arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 1fd3063f..61bb50e6 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,4 +1,4 @@
 SRC_URI =3D "git://git.ti.com/tidl/tidl-utils.git;protocol=3Dgit;branch=3D=
master"
-SRCREV =3D "c88b229e70db220ddbf394f3e77c3d5930a0e35a"
-PV =3D "01.01.02.00"
-PR =3D "r2"
+SRCREV =3D "99ff282fbc440a68170736e7b5de2ff5a2984386"
+PV =3D "01.01.03.00"
+PR =3D "r0"
--=20
2.17.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

