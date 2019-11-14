Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 61B9052988
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 00:07:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE06N9E119160
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 18:06:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573689983;
	bh=nl95X757I89GCuerB/sUzZYdzlqDA75Q0h9hsOQT9O0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=KnYlRRd3HTgqBlQshU4t8IOGNRcqvwKK/pWDN6Kxb7awVGD1Zi6IuqBEIv9Ifh0dw
	HA9bKP7q6Fed4S6v0V7pKjLHSA+mkDddlxKURs++iHg7ifqoqGwPV5A8WmxxOFbLQe
	vC3ZB6SlDzCDR97hyeQdaRfuHUkL4sElv22iiWQk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAE06NH0033154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 18:06:23 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 13 Nov 2019 18:06:05 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1847.003; Wed, 13 Nov 2019 18:06:05 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [thud/master] [PATCH 3/3]
	packagegroup-arago-tisdk-addons: add tensorflow-lite
Thread-Index: AQHVmbivvOTPloHXl0Kp5z9DzbF/dqeJyskA
Date: Thu, 14 Nov 2019 00:06:05 +0000
Message-ID: <45e458a07f084539a873d37d30b8ccb1@ti.com>
References: <20191113001349.30916-1-a0271529@ti.com>
	<20191113001349.30916-3-a0271529@ti.com>
In-Reply-To: <20191113001349.30916-3-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.112.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [thud/master] [PATCH 3/3] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Thu, 14 Nov 2019 00:07:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NACK. This patch is no longer needed with the updated patch for tensorflow-=
lite: http://patchwork.dal.design.ti.com/patch/51102/.

-----Original Message-----
From: Gou, Hongmei=20
Sent: Tuesday, November 12, 2019 7:14 PM
To: meta-arago@arago-project.org
Cc: Gou, Hongmei
Subject: [meta-arago] [thud/master] [PATCH 3/3] packagegroup-arago-tisdk-ad=
dons: add tensorflow-lite

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons.bb
index 14b2370c..73f3f950 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
 LICENSE =3D "MIT"
-PR =3D "r76"
+PR =3D "r77"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -154,6 +154,7 @@ EXTRA_PACKAGES_append_ti33x =3D " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
                                 tensorflow-lite-examples \
+                                tensorflow-lite \
                                 pdm-anomaly-detection \
 "
=20
@@ -161,6 +162,7 @@ EXTRA_PACKAGES_append_ti43x =3D " voxelsdk \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
                                 tensorflow-lite-examples \
+                                tensorflow-lite \
                                 pdm-anomaly-detection \
 "
=20
@@ -170,12 +172,14 @@ EXTRA_PACKAGES_append_omap-a15 =3D " voxelsdk \
                                    arm-compute-library \
                                    ${ARMNN_PACKAGES} \
                                    tensorflow-lite-examples \
+                                   tensorflow-lite \
                                    pdm-anomaly-detection \
 "
=20
 EXTRA_PACKAGES_append_am65xx =3D " arm-compute-library \
                              ${ARMNN_PACKAGES} \
                              tensorflow-lite-examples \
+                             tensorflow-lite \
                              pdm-anomaly-detection \
 "
=20
--=20
2.17.1


