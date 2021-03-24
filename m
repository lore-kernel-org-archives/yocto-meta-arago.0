Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 215BB529C8
	for <meta-arago@arago-project.org>;
	Wed, 24 Mar 2021 22:44:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12OMinUD063919;
	Wed, 24 Mar 2021 17:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616625889;
	bh=/wXlftjp0qvBQWL8aa1xPFUI06rvdqcG1qDLSWVMCb4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=nILlQH0VkExNGS3SQuuSWTIRMm7xCWHaqyUG4mJAC6gaUZXTWJqMeBzfkOU/rijnG
	DSFRBZv0Nv+Qth13djQ/WCDPGiuzZ6QPe6SQYtd6rsVomiRvmSh5LhYWXIpTsTpKxP
	C0lZXqi6v01bAh/PL1//Pj/zYjkkR3uIADI41ZEg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12OMinVr111537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Mar 2021 17:44:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 24 Mar 2021 17:44:49 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Wed, 24 Mar 2021 17:44:49 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [dunfell/master][PATCH 2/4]
	images/packagegroups: add extra browser-layer check when including
	chromium
Thread-Index: AQHXICmkuJC8KUIcWEa6TMqs7RXBmqqTvjBA
Date: Wed, 24 Mar 2021 22:44:49 +0000
Message-ID: <f7dcb2b2616644279a3619ef8f9f92cf@ti.com>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
	<1616534107-46438-2-git-send-email-denis@denix.org>
In-Reply-To: <1616534107-46438-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.73.35]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [dunfell/master][PATCH 2/4] images/packagegroups: add extra browser-layer check when including chromium
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
X-List-Received-Date: Wed, 24 Mar 2021 22:44:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
>project.org> On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, March 23, 2021 4:15 PM
>To: meta-arago@arago-project.org
>Cc: Denys Dmytriyenko <denys@konsulko.com>
>Subject: [EXTERNAL] [meta-arago] [dunfell/master][PATCH 2/4]
>images/packagegroups: add extra browser-layer check when including
>chromium
>
>From: Denys Dmytriyenko <denys@konsulko.com>
>
>When pulling in chromium, check that all conditions are met:
>1. browser-layer layer is present
>2. meta-python2 layer is present
>3. wayland distro feature is enabled
>
>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2 +-
> meta-arago-distro/recipes-core/packagegroups/ti-world.bb     | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>index bc77b97..152f857 100644
>--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>@@ -50,7 +50,7 @@ EXTRABROWSERS =3D " \
>
> PYTHON2APPS =3D " \
>
>${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
>-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '',
>d)} \
>+    ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-
>layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'
>',d)} \
> "
>
> DEVTOOLS =3D " \
>diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>index 87f3004..440e9e6 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>@@ -23,7 +23,7 @@ EXTRABROWSERS =3D " \
>
> PYTHON2APPS =3D " \
>
>${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
>-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '',
>d)} \
>+    ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-
>layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'
>',d)} \
> "
>
> DEVTOOLS =3D " \
>--
>2.7.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

