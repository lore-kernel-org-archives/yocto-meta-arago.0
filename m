Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D391052A4D
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 16:00:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61G0n76011762
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 11:00:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61G0nAQ032657
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 11:00:49 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Jul 2013 11:00:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 11:00:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/2] Add arago-glsdk-console-image
Thread-Index: AQHOdnJVRXXmRiV3rUqwXy76fuFKDJlP+q1g
Date: Mon, 1 Jul 2013 16:00:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962C0F4@DLEE11.ent.ti.com>
References: <20130701154737.GA1753@ti.com>
In-Reply-To: <20130701154737.GA1753@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Add arago-glsdk-console-image
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
X-List-Received-Date: Mon, 01 Jul 2013 16:00:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Monday, July 01, 2013 10:48 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 0/2] Add arago-glsdk-console-image
>
>* Create a packagegroup and corresponding filesystem image.
>
>Siddharth Heroor (2):
>  packagegroups: Add new packagegroup for glsdk console
>  images: Add new arago-glsdk-console-image
>
> .../images/arago-glsdk-console-image.bb            |   16
>+++++++++
> .../packagegroup-arago-glsdk-console.bb            |   35
>++++++++++++++++++++

Why not base this from the arago-base-tisdk-image?  The main difference is =
that this would add things in the packagegroup-arago-base-tisdk group as we=
ll, but that also has many useful features as well as the "arago-gpl-notice=
" package which the OSRB requires for shipping anything GPLv3.

> 2 files changed, 51 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-distro/recipes-core/images/arago-
>glsdk-console-image.bb
> create mode 100644 meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-glsdk-console.bb
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

