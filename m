Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 90BC152972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 20:46:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HKjxTa014743;
	Thu, 17 Jul 2014 15:45:59 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HKjxD0005075;
	Thu, 17 Jul 2014 15:45:59 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 17 Jul 2014 15:45:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] New Arago - am180x-evm core-image-minimal build
	is getting MD5 LICENSE errors in daisy
Thread-Index: AQHPnUd+Uo3KwU/Zq0iffnKaMWgqepukn7qAgAAj3RA=
Date: Thu, 17 Jul 2014 20:45:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E4B7C@DFLE08.ent.ti.com>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
In-Reply-To: <CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: New Arago - am180x-evm core-image-minimal build is getting MD5 LICENSE errors in daisy
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
X-List-Received-Date: Thu, 17 Jul 2014 20:46:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Honestly I don't know how many people are still using am18x in the latest m=
aintenance branches/master. The last TI SDK that used am18x was based on da=
nny.
If you used oe-layersetup I would also recommend using either the danny con=
fig or the amsdk-06.00.00.00-config.txt. With that you should be able to ge=
t something working.
The last TI supported kernel for am18 is rather old (2.6.37) and I think so=
me programs like newer udev had issues with such an old kernel so it might =
take a bit of work to get that working with the latest maintenance branches=
.

The current external Linaro toolchain used in Arago does not support ARM9. =
The Arago toolchain is your best bet.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Brian Hutchinson
> Sent: Thursday, July 17, 2014 8:30 AM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] New Arago - am180x-evm core-image-minimal build
> is getting MD5 LICENSE errors in daisy
>=20
> No ARM9 folks on here?
>=20
> On Fri, Jul 11, 2014 at 4:34 PM, Brian Hutchinson <b.hutchman@gmail.com>
> wrote:
>=20
> > So what I did is edit
> > tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-
> > arago-toolchain.bb and replaced the LICENSE md5 with the value it
> > calculated in the error above and that fixed it.  So not sure if a
> > recipe is busted or if I hosed up something somehow but I thought I'd
> > ask about it.
> >
> > So what is the story with ARM9 AM1808?  Can I use Linaro toolchain yet
> > or is there still some compatibility issue that is best if I use the
> > Arago 2011.09?
> >
> > Thanks for any ideas/pointers.
> >
> > Regards,
> >
> > Brian
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

