Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 0D60952BB4
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 20:23:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KO4xd087885;
	Mon, 5 Apr 2021 15:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617654244;
	bh=WhdzQSf2v5CiCvEmkCiW/EL/TcNi/KCuc3USrtL+Mao=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=kEpplD/ghY7OrOSu8fuJ2SYyh0v7cfiotWZOXb9tfgtNKcPnxmYbemHkbS6sNTOCx
	pGcLD3D3pzJmEKjADmV9TvuC1m5+y3hO3XZCsmvtPovzq9qhUvuhVMIcM+3wQjCNxv
	qPU3UxYt6J9MsTbtNwyr5rRke2iRc8kWyvEYrScA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KO4cF105186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:24:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 15:24:04 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Mon, 5 Apr 2021 15:24:04 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][PATCH 07/29] weston: update
	bbappend 8.0.0 -> 9.0.0
Thread-Index: AQHXKB3mb7lxbBMfBkSbmfBkGi0cd6qmYuyQ
Date: Mon, 5 Apr 2021 20:24:04 +0000
Message-ID: <b18d8b37e7be41339e7527933dfe85f1@ti.com>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
	<1617408644-2675-8-git-send-email-denis@denix.org>
In-Reply-To: <1617408644-2675-8-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [master][PATCH 07/29] weston: update bbappend 8.0.0 -> 9.0.0
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
X-List-Received-Date: Mon, 05 Apr 2021 20:23:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
>project.org> On Behalf Of Denys Dmytriyenko
>Sent: Friday, April 02, 2021 7:10 PM
>To: meta-arago@arago-project.org
>Cc: Denys Dmytriyenko <denys@konsulko.com>
>Subject: [EXTERNAL] [meta-arago] [master][PATCH 07/29] weston: update
>bbappend 8.0.0 -> 9.0.0
>
>From: Denys Dmytriyenko <denys@konsulko.com>
>
>To match upstream oe-core/master.
>
>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> .../wayland/{weston_8.0.0.bbappend =3D> weston_9.0.0.bbappend}
>| 0
> 1 file changed, 0 insertions(+), 0 deletions(-)
> rename meta-arago-distro/recipes-graphics/wayland/{weston_8.0.0.bbappend
>=3D> weston_9.0.0.bbappend} (100%)
>
>diff --git a/meta-arago-distro/recipes-
>graphics/wayland/weston_8.0.0.bbappend b/meta-arago-distro/recipes-
>graphics/wayland/weston_9.0.0.bbappend
>similarity index 100%
>rename from meta-arago-distro/recipes-
>graphics/wayland/weston_8.0.0.bbappend
>rename to meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend
>--
>2.7.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

