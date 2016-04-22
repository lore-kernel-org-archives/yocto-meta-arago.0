Return-Path: <thomas.kaufmann@duagon.com>
Received: from antispamrelay02.bull-services.ch
	(antispamrelay02.bull-services.ch [62.12.170.133])
	by arago-project.org (Postfix) with ESMTPS id D35445296F
	for <meta-arago@arago-project.org>;
	Fri, 22 Apr 2016 16:26:15 +0000 (UTC)
Received: from 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch
	([46.14.158.220]) by mx-gate02-zrh.antispameurope.com; 
	Fri, 22 Apr 2016 18:26:13 +0200
Received: from chdua14.duagon.ads (192.168.0.83) by chdua14.duagon.ads
	(192.168.0.83) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Fri, 22 Apr 2016 18:26:11 +0200
Received: from chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528]) by
	chdua14.duagon.ads ([fe80::11cc:5f18:bf89:c528%12]) with mapi id
	15.00.1104.000; Fri, 22 Apr 2016 18:26:11 +0200
From: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] sdk created with arago fido contains hardcoded
	paths to build system in setup script
Thread-Index: AdGE/L2mSD49ZUE5RwaYG0D7c2UiiQRZjrSAAZO9VtA=
Date: Fri, 22 Apr 2016 16:26:10 +0000
Message-ID: <9d91361199a5476096e4b9b1f58e9e90@chdua14.duagon.ads>
References: <87f35714305b4138b6523b1f5d7f04f4@chdua14.duagon.ads>
	<20160414173319.GI10048@edge>
In-Reply-To: <20160414173319.GI10048@edge>
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
	mx-gate02-zrh with 882CA1928001
X-cloud-security-connect: 220.158.14.46.static.wline.lns.sme.cust.swisscom.ch[46.14.158.220],
	TLS=1, IP=46.14.158.220
X-cloud-security: scantime:.4829
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
X-List-Received-Date: Fri, 22 Apr 2016 16:26:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys

Thank you so much for this hint, I think it pointed me to the right directi=
on.
I based an own sdk and toolchain recipe on meta-toolchain-arago*.
It took me some time to ge rid of the unneeded stuff, but now it bakes.

Also, I now base my images arago-base-minimal instead of core-image-minimal=
.

One issue remains, the sw_mainfest target() task fails, I think because of =
a non expanded shell variable.
In the log it looks for a file with ${image} in the name. So all varaibles =
except one are expanded in the call.
So for the time being I commented out most of sw_mainfest target() in tisdk=
_image.bbclass.

Another strange behavior is, about every second time I bitbake it parses li=
nux-ti-staging, which I don't use and I did not find the relevant reference=
 to it so far.

Regards Thomas

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, April 14, 2016 7:33 PM
> To: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] sdk created with arago fido contains hardcoded
> paths to build system in setup script
>=20
> On Wed, Mar 23, 2016 at 12:12:08PM +0000, Thomas Kaufmann wrote:
> > Hi I tried to get an answer to this from the TI e2e community, but so
> > far without luck:
> >
> >
> https://e2e.ti.com/support/embedded/linux/f/354/p/500188/1811754#1811
> 7
> > 54
> >
> > My issue is this:
> >
> > When I create a SDK for my target platform using arago with the
> > populate_sdk command in bitbake. I receive a self extracting shell
> > script, which unpacks all the rootfs, compilers, libraries and
> > everything. Basically the SDK is working and I am able to develop for m=
y
> target with it.
> >
> > One thing bothers me:
> >
> > in the environment-setup-cortexa8hf-vfp-non-linux-gnueabi file which
> > needs to be sourced before using the SDK, there are some hardcoded
> > paths which point to the linaro toolchain as it is installed on the
> > original system, where I actually build the SDK,
> >
> > e.g.: export CFLAGS=3D"
> > -isystem/home/tkaufmann/gcc-linaro-4.9-2015.05-x86_64_arm-linux-
> gnueab
> > ihf/arm-linux-gnueabihf/include -fstack-protector -O2 -pipe -g
> > -feliminate-unused-debug-types"
> >
> > similar things are in CFLAGS, CXXFLAGS, LDFLAGS and CPPFLAGS
> >
> > The plan was to use the compiler and sysroot as it is available in the =
SDK.
> > This is working so far for sinple projects without separately
> > installing the linaro toolchain. Why are these linaro based paths in
> > the environment-setup script and how do I get rid of this to not confus=
e
> the users of the SDK?
> >
> > I appreciate your feedback
>=20
> Thomas,
>=20
> Sorry for the delay. I just checked our SDK and there are no hardcoded pa=
ths
> in there.
>=20
> Trying to figure out what's different I see that your setup script is cal=
led
> "environment-setup-cortexa8hf-vfp-non-linux-gnueabi" while ours is just
> simple "environment-setup". Also I see you mention populate_sdk in
> bitbake and now it becomes clear - you should be using meta-toolchain-
> arago-tisdk recipe where lots of stuff gets cleanup and configured proper=
ly...
>=20
> Attached is the current environment-setup script from our SDK.
>=20
> --
> Denys

