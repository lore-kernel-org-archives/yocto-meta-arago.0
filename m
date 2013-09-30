Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A210352990
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 21:06:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UL6hRr026926
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 16:06:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UL6hYd018797
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 16:06:43 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 30 Sep 2013 16:06:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-prefs: Update preferred U-Boot version
Thread-Index: AQHOviBTVT1qpU2PT0Cb5LVB/uEY2JnexZoA
Date: Mon, 30 Sep 2013 21:06:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159771D9F@DLEE11.ent.ti.com>
References: <1380577383-21395-1-git-send-email-Chase.Maupin@ti.com>
	<6CEE7915-A431-4995-BD40-B8D536EBB528@ti.com>
	<20130930210208.GF24472@edge>
In-Reply-To: <20130930210208.GF24472@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-prefs: Update preferred U-Boot version
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
X-List-Received-Date: Mon, 30 Sep 2013 21:06:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sending a new version to replace this.  Ignore this patch


>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, September 30, 2013 4:02 PM
>To: Cooper Jr., Franklin
>Cc: Maupin, Chase; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] arago-prefs: Update preferred U-
>Boot version
>
>On Mon, Sep 30, 2013 at 09:00:04PM +0000, Cooper Jr., Franklin
>wrote:
>> A similar change doesn't have to be made for 335x?
>
>No, there's no PREFERRED_VERSION for it by default - will pick up
>the highest
>enabled.
>
>
>> > On Sep 30, 2013, at 3:58 PM, "Maupin, Chase"
><chase.maupin@ti.com> wrote:
>> >
>> > * The latest version has switched to rc2 instead of rc1.
>Update
>> >  the preferred version to avoid messages about not being able
>to
>> >  find the rc1 version.
>> >
>> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> > ---
>> > .../conf/distro/include/arago-prefs.inc            |    2 +-
>> > 1 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/meta-arago-distro/conf/distro/include/arago-
>prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > index 70f02b9..5ac21ed 100644
>> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > @@ -32,7 +32,7 @@ PREFERRED_VERSION_linux-libc-headers_am437x-
>evm =3D "3.8"
>> > PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "linux-ti-
>staging"
>> > PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-
>staging"
>> > PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
>> > -PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D
>"2013.07+2013.10-rc1"
>> > +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D
>"2013.07+2013.10-rc2"
>> >
>> > PREFERRED_VERSION_linux-libc-headers_am180x-evm =3D "2.6.37.2"
>> > PREFERRED_PROVIDER_virtual/kernel_am180x-evm =3D "linux-
>omapl138-psp"
>> > --
>> > 1.7.0.4
>> >
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

