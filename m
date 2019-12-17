Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8855F529B5
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 11:33:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHBVXBp097267
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576582293;
	bh=EmpZaXUPaRtBJWhhoVtrYDKJZ6xbqD9J9tRLKjj194w=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=rjYlbOHcJJq88T+xEVftbwat7ZhxI2mQ/9yqMHj9mbT+TwwTy4aGS3qCpvszkZ/bC
	lygiyP/+bzDigb+cT8RRGKnfPyI4qpADRDYami+KF+Ih9Bi5jOsajjQ6maRXVFqYS6
	mxWD4PD3k7z0Yjr7RkReIRm9bm2Tlvqa+AaLD02U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHBVXNm023811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:33 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 05:31:33 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 05:31:33 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master/thud/ti2019.05] [PATCH 1/2]
	tensorflow-lite: extends to native and nativesdk
Thread-Index: AQHVsT3L8DZco4OeL0iZnnF7e3H5K6e+OHhg
Date: Tue, 17 Dec 2019 11:31:33 +0000
Message-ID: <9af9fa18de5a4abe835569871e280be3@ti.com>
References: <20191212224014.23027-1-a0271529@ti.com>
In-Reply-To: <20191212224014.23027-1-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master/thud/ti2019.05] [PATCH 1/2] tensorflow-lite: extends to native and nativesdk
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
X-List-Received-Date: Tue, 17 Dec 2019 11:33:11 -0000
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
Subject: [EXTERNAL] [meta-arago] [master/thud/ti2019.05] [PATCH 1/2] tensor=
flow-lite: extends to native and nativesdk

* This is required to build tidl-import-tool to support
  tensorflow-lite models (floating point only for now)

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-l=
ite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-=
lite_1.15.bb
index 9d07b11b..b238c85e 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.1=
5.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.1=
5.bb
@@ -41,7 +41,7 @@ SRC_URI[mobilenet_v1_quant.sha256sum] =3D "d32432d28673a9=
36b2d6281ab0600c71cf7226d
=20
 SRCREV =3D "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
=20
-PR =3D "r2"
+PR =3D "r3"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -138,3 +138,5 @@ PACKAGES +=3D "${PN}-examples"
 FILES_${PN}-examples =3D "${datadir}/${PN}-${PV}/examples"
=20
 ALLOW_EMPTY_${PN} =3D "1"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.17.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

