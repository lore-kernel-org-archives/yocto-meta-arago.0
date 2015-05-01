Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5353F529DF
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 15:30:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41FUe39025438
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 10:30:40 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41FUd8O005358
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 10:30:39 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 1 May 2015 10:30:39 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2015.04 build
	2015-04-30_22-00-51
Thread-Index: AQHQg7swyEk1qvM66kefq2765CvgtJ1nehsA//+0HACAAGJ5gP//rx1A
Date: Fri, 1 May 2015 15:30:38 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141293D2@DFLE09.ent.ti.com>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
	<20150501135817.GW29290@edge> <55438D20.6020203@ti.com>
	<20150501151906.GY29290@edge>
In-Reply-To: <20150501151906.GY29290@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
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
X-List-Received-Date: Fri, 01 May 2015 15:30:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does this mean drm is supported by all platforms, and "libdrm" can be a pla=
tform-agnostic dependency?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, May 01, 2015 11:19 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-30_22-=
00-51

I think there's some confusion... Does this link help?

http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_Guid=
e

--=20
Denys


On Fri, May 01, 2015 at 10:26:40AM -0400, Jacob Stiffler wrote:
> I see the error:
>=20
> make[3]: *** No rule to make target
> `../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by
> `libgstwaylandsink.la'.  Stop.
> make[3]: *** Waiting for unfinished jobs....
>=20
> Looks like drm is needed for waylandsink. But I thought am3/am4 did
> not have DRM?
>=20
>=20
>=20
>=20
> On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> >Jake,
> >
> >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> >
> >
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
>=20
> On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> >Jake,
> >
> >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> >
> >
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

