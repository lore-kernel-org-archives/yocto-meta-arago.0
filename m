Return-Path: <nikhil.nd@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DDE7C529DF
	for <meta-arago@arago-project.org>;
	Tue,  2 Dec 2014 07:08:12 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB278Am5022877
	for <meta-arago@arago-project.org>; Tue, 2 Dec 2014 01:08:11 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB2788xI002584
	for <meta-arago@arago-project.org>; Tue, 2 Dec 2014 12:38:09 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Tue, 2 Dec 2014 12:38:08 +0530
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] Applying non local patches
Thread-Index: AdAACzIpnhwplHN0R0WucZIJ8z5GzgNd2gsAAB7x+0A=
Date: Tue, 2 Dec 2014 07:08:06 +0000
Message-ID: <E60A9E1B4132A24DB80BD56ABC9268473502812A@DBDE04.ent.ti.com>
References: <E60A9E1B4132A24DB80BD56ABC926847D2DB79@DBDE04.ent.ti.com>
	<20141201214937.GE5113@edge>
In-Reply-To: <20141201214937.GE5113@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Applying non local patches
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
X-List-Received-Date: Tue, 02 Dec 2014 07:08:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, December 02, 2014 3:20 AM
> To: Devshatwar, Nikhil
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Applying non local patches
>=20
> On Fri, Nov 14, 2014 at 01:02:09PM +0000, Devshatwar, Nikhil wrote:
> > Hi all,
> > Does yocto support applying patches which are under review It is
> > possible to download the patch and add it to the recipe along with
> the
> > actual patch file
> >
> > But  is there another way where we can point to the patches in the
> > SRC_URI itself
> >
> > Something similar to
> >
> > SRC_URI=3D "git:git.fredesktop.org/project/repo.git;protocol=3Dgit \
> >
> > http://patchwork.freedesktop/project/repo/12345/raw;protocol=3Dhttp \ "
> > Are there any examples of such reciepes Please help
>=20
> Nikhil,
>=20
> It's not recommended, but it was always possible. Here's an old example
> from OE Classic, as I couldn't find any recent one:
>=20
> http://cgit.openembedded.org/openembedded/tree/recipes/busybox/busybox_
> 1.7.2.bb
>=20
Thanks for this info, it would really help

> We moved away from that practice, as upstream used to constantly tweak
> and change patches, breaking the build all the time. Having patches in
> metadata gives more control, as updating patches, their checksums and
> making sure the build doesn't break can be done at the same time.
>=20
I understand the cons here
This is mostly for my experiments where I want to apply patches from patchw=
ork
To try out some things
It's easy to just provide link than to download and add in the recipe

Thank you

> --
> Denys

