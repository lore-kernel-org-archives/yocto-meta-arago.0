Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1198C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 12:41:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2964.1684440847033990089
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 13:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q7bG7Vus;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: b-brnich@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IKE5qJ119221
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 15:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684440845;
	bh=RAlMwXgKDk8zuEKIEN8hhKfhFLW9Y517x6sw+5jJs8o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Q7bG7VushyTHhH9qARPoTjJA1soLlPuRsrc6LPeMFjQabRlTaw6RgzX0MUXPOyLum
	 JrN92YY3BaQU31ndFCHpqfMYPU+3GcmyRMjbOZFOocDLjSuNve+Oa5zjcuUfRt4/D5
	 MQ1UfM6A9ECGFwIVr3qymoHqWLFgYeNNqnsPPJZQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IKE5sQ041425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 15:14:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 15:14:04 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.023; Thu, 18 May 2023 15:14:05 -0500
From: "Brnich, Brandon" <b-brnich@ti.com>
To: "Ravikumar, Rahul" <r-ravikumar@ti.com>,
        "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "Choudhary, Jayesh" <j-choudhary@ti.com>,
        "Bhatia, Aradhya"
	<a-bhatia1@ti.com>,
        "Thakkar, Devarsh" <devarsht@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to enable kmssink plugin
Thread-Topic: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
Thread-Index: AQHZiYxhzQW68J5m4UatP/OO+ziE569gdnMQ
Date: Thu, 18 May 2023 20:14:04 +0000
Message-ID: <8c10625d586e4b37b2d85aacbbbed3eb@ti.com>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
In-Reply-To: <20230518132636.17398-1-r-ravikumar@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.25.106]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 May 2023 12:41:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14424

Hi Rahul,


> -----Original Message-----
> From: Ravikumar, Rahul <r-ravikumar@ti.com>
> Sent: Thursday, May 18, 2023 8:27 AM
> To: meta-arago@lists.yoctoproject.org; Eatmon, Ryan <reatmon@ti.com>
> Cc: Choudhary, Jayesh <j-choudhary@ti.com>; Bhatia, Aradhya <a-
> bhatia1@ti.com>; Brnich, Brandon <b-brnich@ti.com>; Thakkar, Devarsh
> <devarsht@ti.com>; Ravikumar, Rahul <r-ravikumar@ti.com>
> Subject: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
> enable kmssink plugin
>=20
> Enable building kmssink plugin in gstreamer1.0-plugins-bad
>=20
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf

I do not think this is the proper place to enable this plugin. We have a bb=
apend file=20
that is located in meta-arago-extras/recipes-multimedia/gstreamer/ where we=
 are=20
updating the package config to build kmssink.=20

I have a patch that is responsible for updating these bbapend files as the =
multimedia
and graphics team is cleaning up gstreamer for kirkstone.

>  PACKAGECONFIG:append:pn-gstreamer1.0 =3D " tracer-hooks"
>=20
> +# Enable kmssink in gstreamer
> +PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad =3D " kms"
> +
>  # Disable pulseaudio routing in alsa by default
> PACKAGECONFIG:remove:pn-alsa-plugins =3D "pulseaudio"
>  RDEPENDS:pulseaudio-server:remove =3D "alsa-plugins-pulseaudio-conf"
> --
> 2.17.1


