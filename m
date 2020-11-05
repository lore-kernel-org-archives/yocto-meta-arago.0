Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 28F72529D8
	for <meta-arago@arago-project.org>;
	Thu,  5 Nov 2020 22:57:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5MsGhN052767;
	Thu, 5 Nov 2020 16:54:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604616856;
	bh=VK6e0KB5fZV5JnEubyOj5vgkc+g3dBoKVr/b6oifVcs=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=YubMSIsUgBzslN6qMJhHoiDYanw08MFR7Ucc7zUoBWzdpTdLvS1ppeElFlyJLVun6
	UCq53no0uCEdqKK8r6gW0kGsWxSSOOMp595NC33eKWqbNIzybav5aPJFvKj/tOqDsK
	QXggcALIJLWRkEi+GrfElbC3suHYGPjU5Fabrh30=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5MsGfD016660
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Nov 2020 16:54:16 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 5 Nov 2020 16:54:15 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Thu, 5 Nov 2020 16:54:15 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Paul Barker <pbarker@konsulko.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master/dunfell PATCH]
	matrix-gui-pm-demos: Allow empty package
Thread-Index: AQHWs1/fJtY5Eu0j7kieBz/loz3GDam6I15A
Date: Thu, 5 Nov 2020 22:54:15 +0000
Message-ID: <a545abad45834306b42868c6987b11dd@ti.com>
References: <20201105103816.2865115-1-pbarker@konsulko.com>
In-Reply-To: <20201105103816.2865115-1-pbarker@konsulko.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.32.166]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master/dunfell PATCH] matrix-gui-pm-demos: Allow empty package
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
X-List-Received-Date: Thu, 05 Nov 2020 22:57:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
>project.org> On Behalf Of Paul Barker
>Sent: Thursday, November 05, 2020 4:38 AM
>To: meta-arago@arago-project.org
>Subject: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-pm-
>demos: Allow empty package
>
>The matrix-gui-pm-demos recipe splits its binaries into several
>subpackages leaving the default package empty. The dependencies for the
>default package are set so it makes sense to allow this empty package to
>be created.
>
>Signed-off-by: Paul Barker <pbarker@konsulko.com>
>---
> meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
>demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
>demos_2.0.bb
>index 0116f5ea..a9ebb84f 100644
>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
>@@ -10,6 +10,7 @@ S =3D "${WORKDIR}/git/power_apps"
>
> # Make sure power submenu and app images has been installed
> RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power
>matrix-gui-generic-pm"
>+ALLOW_EMPTY_${PN} =3D "1"

Just curious, I assume that the deployment of the dependent packages is sti=
ll
ensured even without this change. This just makes it apparent to the user t=
hat
the default package is empty. Or is it that the deployment of dependent pac=
kages
is broken without this.

Thanks,
Gowtham

> # Break out the individual files into separate packages.  That way only
>the
> # PM features supported for each device can be installed.  Prepend the
>list
>--
>2.29.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

