Return-Path: <thomas.kaufmann@duagon.com>
Received: from antispamrelay02.bull-services.ch
	(antispamrelay02.bull-services.ch [62.12.170.133])
	by arago-project.org (Postfix) with ESMTPS id 8544852A3C
	for <meta-arago@arago-project.org>;
	Mon, 25 Apr 2016 13:01:02 +0000 (UTC)
Received: from 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch
	([46.14.158.220]) by mx-gate02-zrh.antispameurope.com; 
	Mon, 25 Apr 2016 15:01:00 +0200
Received: from chdua14.duagon.ads (192.168.0.83) by chdua14.duagon.ads
	(192.168.0.83) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Mon, 25 Apr 2016 15:00:50 +0200
Received: from chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528]) by
	chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528%12]) with mapi id
	15.00.1104.000; Mon, 25 Apr 2016 15:00:50 +0200
From: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] sdk created with arago fido contains hardcoded
	paths to build system in setup script
Thread-Index: AdGE/L2mSD49ZUE5RwaYG0D7c2UiiQRZjrSAAZO9VtAAkBQ00A==
Date: Mon, 25 Apr 2016 13:00:49 +0000
Message-ID: <d35d04c33c514e5683f4511952048a06@chdua14.duagon.ads>
References: <87f35714305b4138b6523b1f5d7f04f4@chdua14.duagon.ads>
	<20160414173319.GI10048@edge> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.0.189]
MIME-Version: 1.0
X-cloud-security-sender: thomas.kaufmann@duagon.com
X-cloud-security-recipient: meta-arago@arago-project.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
	mx-gate02-zrh with A39961928004
X-cloud-security-connect: 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch[46.14.158.220],
	TLS=1, IP=46.14.158.220
X-cloud-security: scantime:2.320
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: sdk created with arago fido contains hardcoded paths to build system in setup script
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
X-List-Received-Date: Mon, 25 Apr 2016 13:01:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi again

Just a quick followup. The problems with non expanded variables vanished, a=
fter I cleaned out my work directory and rebuilt everything.
The linux-ti-staging is still drawn into my build occasionally, I don't rea=
lly understand why. But for now I think its fine.

Regards Thomas

> -----Original Message-----
> From: Thomas Kaufmann
> Sent: Friday, April 22, 2016 6:26 PM
> To: 'Denys Dmytriyenko' <denys@ti.com>
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] sdk created with arago fido contains hardcoded
> paths to build system in setup script
>=20
> Hi Denys
>=20
> Thank you so much for this hint, I think it pointed me to the right direc=
tion.
> I based an own sdk and toolchain recipe on meta-toolchain-arago*.
> It took me some time to ge rid of the unneeded stuff, but now it bakes.
>=20
> Also, I now base my images arago-base-minimal instead of core-image-
> minimal.
>=20
> One issue remains, the sw_mainfest target() task fails, I think because o=
f a
> non expanded shell variable.
> In the log it looks for a file with ${image} in the name. So all varaible=
s except
> one are expanded in the call.
> So for the time being I commented out most of sw_mainfest target() in
> tisdk_image.bbclass.
>=20
> Another strange behavior is, about every second time I bitbake it parses
> linux-ti-staging, which I don't use and I did not find the relevant refer=
ence to
> it so far.
>=20
> Regards Thomas
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Thursday, April 14, 2016 7:33 PM
> > To: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] sdk created with arago fido contains
> > hardcoded paths to build system in setup script
> >
> > On Wed, Mar 23, 2016 at 12:12:08PM +0000, Thomas Kaufmann wrote:
> > > Hi I tried to get an answer to this from the TI e2e community, but
> > > so far without luck:
> > >
> > >
> >
> https://e2e.ti.com/support/embedded/linux/f/354/p/500188/1811754#1811
> > 7
> > > 54
> > >
> > > My issue is this:
> > >
> > > When I create a SDK for my target platform using arago with the
> > > populate_sdk command in bitbake. I receive a self extracting shell
> > > script, which unpacks all the rootfs, compilers, libraries and
> > > everything. Basically the SDK is working and I am able to develop
> > > for my
> > target with it.
> > >
> > > One thing bothers me:
> > >
> > > in the environment-setup-cortexa8hf-vfp-non-linux-gnueabi file which
> > > needs to be sourced before using the SDK, there are some hardcoded
> > > paths which point to the linaro toolchain as it is installed on the
> > > original system, where I actually build the SDK,
> > >
> > > e.g.: export CFLAGS=3D"
> > > -isystem/home/tkaufmann/gcc-linaro-4.9-2015.05-x86_64_arm-linux-
> > gnueab
> > > ihf/arm-linux-gnueabihf/include -fstack-protector -O2 -pipe -g
> > > -feliminate-unused-debug-types"
> > >
> > > similar things are in CFLAGS, CXXFLAGS, LDFLAGS and CPPFLAGS
> > >
> > > The plan was to use the compiler and sysroot as it is available in th=
e SDK.
> > > This is working so far for sinple projects without separately
> > > installing the linaro toolchain. Why are these linaro based paths in
> > > the environment-setup script and how do I get rid of this to not
> > > confuse
> > the users of the SDK?
> > >
> > > I appreciate your feedback
> >
> > Thomas,
> >
> > Sorry for the delay. I just checked our SDK and there are no hardcoded
> > paths in there.
> >
> > Trying to figure out what's different I see that your setup script is
> > called "environment-setup-cortexa8hf-vfp-non-linux-gnueabi" while ours
> > is just simple "environment-setup". Also I see you mention
> > populate_sdk in bitbake and now it becomes clear - you should be using
> > meta-toolchain- arago-tisdk recipe where lots of stuff gets cleanup and
> configured properly...
> >
> > Attached is the current environment-setup script from our SDK.
> >
> > --
> > Denys

