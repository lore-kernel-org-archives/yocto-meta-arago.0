Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 3D9D052AB4
	for <meta-arago@arago-project.org>;
	Sat, 24 Apr 2021 00:27:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13O0Rw47052216;
	Fri, 23 Apr 2021 19:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619224078;
	bh=AUxD+369eDN4AqvpZFiL3gLUsFewEnPoRVi+kxCOpD4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cEDB/5WmSrQXdXRkYISX6a+yuBoAqt8YNscCR22HlzymCa3eSOdfVJKCk7xDQ0EiJ
	o7DaowOsoeExh7Ohb8oYhA6cZjRi2iiuVFGWvxpt1z5y8Hf0BWBw7xjCGC/8lonYCx
	VNvSvzb2mcBTYBNnmQrQmFYvRDLxJ2I+4s9oAJ2w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13O0Rwof030126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Apr 2021 19:27:58 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 23 Apr 2021 19:27:57 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Fri, 23 Apr 2021 19:27:57 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Thread-Topic: [dunfell/master PATCH] ti-test: fix build errors with nested
	conditional operation
Thread-Index: AQHXOJ9dOv6xOOQSx0iKZWoF9WpQgarCz/iA
Date: Sat, 24 Apr 2021 00:27:57 +0000
Message-ID: <e6f4a69a27d44abda45fe8bcc85c73a3@ti.com>
References: <20210424001834.652-1-praneeth@ti.com>
In-Reply-To: <20210424001834.652-1-praneeth@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dunfell/master PATCH] ti-test: fix build errors with nested conditional operation
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
X-List-Received-Date: Sat, 24 Apr 2021 00:27:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Bajjuri, Praneeth
>Sent: Friday, April 23, 2021 7:19 PM
>To: Bajjuri, Praneeth <praneeth@ti.com>
>Cc: Denys Dmytriyenko <denis@denix.org>; Tammana, Gowtham <g-
>tammana@ti.com>; meta-arago@arago-project.org
>Subject: [dunfell/master PATCH] ti-test: fix build errors with nested
>conditional operation
>
>From: Praneeth Bajjuri <praneeth@ti.com>
>
>nested conditional operation like this
>${@oe.utils.conditional(<condition>, ${@bb.utils.contains()}
>
>is causing build issues on some of the older build machines like this.
>
>Missing or unbuildable dependency chain was: ['tisdk-default-image', 'ti-
>test', "'',"]
>ERROR: Nothing RPROVIDES ''omapdrmtest',' (but <>/ti-test.bb RDEPENDS on
>or otherwise requires it)
>NOTE: Runtime target ''omapdrmtest',' is unbuildable, removing...
>Missing or unbuildable dependency chain was: ["'omapdrmtest',"]
>ERROR: Nothing RPROVIDES ''mmip',' (but <>/ti-test.bb RDEPENDS on or
>otherwise requires it)
>NOTE: Runtime target ''mmip',' is unbuildable, removing...
>Missing or unbuildable dependency chain was: ["'mmip',"]
>
>This patch fixes such build issue.
>
>Suggested-by: Denys Dmytriyenko <denis@denix.org>
>Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>index cbc246d5..219b43b6 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>@@ -66,12 +66,14 @@ ARAGO_TI_TEST_append_ti43x =3D " \
>     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test',
>d)} \
> "
>
>+NOT_MAINLINE_MMIP_DEPS =3D "${@bb.utils.contains('MACHINE_FEATURES',
>'mmip', 'omapdrmtest', '', d)}"
>+
> ARAGO_TI_TEST_append_omap-a15 =3D " \
>     omapconf \
>     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
>         ti-ipc-test \
>-        ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest',
>'', d)} \
>         cmem-test \
>+	${NOT_MAINLINE_MMIP_DEPS} \
>     ", d)} \
> "
>
>--
>2.17.1


