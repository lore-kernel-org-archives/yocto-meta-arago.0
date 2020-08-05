Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id ADCBB52960
	for <meta-arago@arago-project.org>;
	Wed,  5 Aug 2020 21:22:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 075LJKo1109469
	for <meta-arago@arago-project.org>; Wed, 5 Aug 2020 16:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596662360;
	bh=bqcgH8hrHC2y+dH0AB8Z2+0vZPLZlvU9ItyfrxifouE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=QePfQ+gEeo1w61NlXlCZWjF9+cquBotzN02taipkI6hDfRnIe4D07v7J5/YDi4O6i
	IYY7Ue99VtkZD9NBRSD6hhV616lmOqCKJXQ2XvdCEIFaC1+JvW/JGE35bCMEUhr3y2
	jmIgkJ9alrnox/2jlazKxfAY99Vb36YEf9DHzShg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 075LJKli076213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Aug 2020 16:19:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 5 Aug 2020 16:19:20 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Wed, 5 Aug 2020 16:19:20 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [dunfell][PATCH] wayland-ivi-extension: Update
	patch to weston-8
Thread-Index: AQHWa2rhhzZMcxg7Xkux31uEYonOvKkqBQkw
Date: Wed, 5 Aug 2020 21:19:20 +0000
Message-ID: <b0b05a239ed74d35b9fb174988e43021@ti.com>
References: <20200604000622.4119-1-g-tammana@ti.com>
	<20200710181804.GA12263@beryl> <20200805205623.GV14660@beryl>
In-Reply-To: <20200805205623.GV14660@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.31.203]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dunfell][PATCH] wayland-ivi-extension: Update patch to weston-8
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
X-List-Received-Date: Wed, 05 Aug 2020 21:22:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, August 05, 2020 3:56 PM
>To: Tammana, Gowtham
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [dunfell][PATCH] wayland-ivi-extension: Update p=
atch
>to weston-8
>
>Ping.

I missed this. Let me push a new version.

Thanks,
Gowtham

>
>On Fri, Jul 10, 2020 at 02:18:04PM -0400, Denys Dmytriyenko wrote:
>> Gowtham,
>>
>> Looks like you renmaed the patch, but didn't update the recipe for the n=
ew
>> name:
>> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-arago=
-
>distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb;hb=3DHEAD
>> It now gives a warning about not being able to locate the patch.
>>
>> Denys
>>
>>
>> On Wed, Jun 03, 2020 at 07:06:22PM -0500, Gowtham Tammana wrote:
>> > dunfell uses weston-8, update the ivi-id-agent dependencies patch to
>> > use libweston-desktop-8.
>> >
>> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> > ---
>> >  ...i-id-agent-update-dependencies-to-build-on-weston-8.patch} | 4 ++-=
-
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >  rename meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
>extension/{03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch =
=3D>
>03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch} (94%)
>> >
>> > diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
>extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
>b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-=
id-
>agent-update-dependencies-to-build-on-weston-8.patch
>> > similarity index 94%
>> > rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
>extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
>> > rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
>extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
>> > index 1b5f64e4..1b18d9bf 100644
>> > --- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension=
/03-
>ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
>> > +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension=
/03-
>ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
>> > @@ -1,7 +1,7 @@
>> >  From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 200=
1
>> >  From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.c=
om>
>> >  Date: Mon, 6 Jan 2020 06:45:54 -0500
>> > -Subject: [PATCH] ivi-id-agent: update dependencies to build on weston=
 7
>> > +Subject: [PATCH] ivi-id-agent: update dependencies to build on weston=
 8
>> >
>> >  upgrade libweston-desktop version.
>> >
>> > @@ -22,7 +22,7 @@ index 3e604a5..ff47808 100644
>> >   pkg_check_modules(WESTON weston>=3D6.0.0 REQUIRED)
>> >   pkg_check_modules(PIXMAN pixman-1 REQUIRED)
>> >  -pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
>> > -+pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-7 REQUIRED)
>> > ++pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-8 REQUIRED)
>> >
>> >   find_package(Threads REQUIRED)
>> >
>> > --
>> > 2.26.2
>> >
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

