Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 283B4529DA
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 17:36:04 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2Ha2PI027745
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 11:36:02 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2HZxlF024509
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 23:06:00 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Tue, 3 Dec 2013 01:35:59 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] Header files missing in the image
Thread-Index: Ac7ueTAtnsgVZOSOQceiUoBlZpPTYAAo2yuAABiuBsD//34ogP//eMjQ
Date: Mon, 2 Dec 2013 17:35:58 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D546E236@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D546DDE1@DBDE04.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E970669@DLEE08.ent.ti.com>
	<CF956B779D819D41BBC043B7082161D546E202@DBDE04.ent.ti.com>
	<20131202171057.GI690@edge>
In-Reply-To: <20131202171057.GI690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Header files missing in the image
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
X-List-Received-Date: Mon, 02 Dec 2013 17:36:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I am trying to understand why the release build is missing header files, wh=
ereas the daily build has them.
The image recipe is the same, however I see many header files in the daily =
build image.=20
I just wanted to know if there is a setting in any conf or bbclass for the =
same that is causing header files to be installed.
 =20

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, December 02, 2013 10:41 PM
> To: Hingolikar, Mrinmayee
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Header files missing in the image
>=20
> On Mon, Dec 02, 2013 at 11:57:02AM -0500, Hingolikar, Mrinmayee wrote:
> >    Thanks Denys.
> >
> >    What needs to be done for including headers?
>=20
> Can you please explain what you are trying to do - maybe there's a
> better approach? Are you really looking for the header files in the
> rootfs? Generally it can be done by including necessary -dev packages,
> but it's not recommended.
> Are you trying to enable native compilation on the target?
>=20
> --
> Denys
>=20
>=20
> >    From: Dmytriyenko, Denys
> >    Sent: Monday, December 02, 2013 6:39 PM
> >    To: meta-arago@arago-project.org; Hingolikar, Mrinmayee
> >    Subject: RE: [meta-arago] Header files missing in the image
> >
> >
> >
> >    There should not be any headers on the rootfs by default, as it's
> not
> >    meant for development. That is what devkit is for.
> >
> >    Denys
> >
> >    -----Original Message-----
> >    From: Hingolikar, Mrinmayee [mrinmayee@ti.com]
> >    Received: Sunday, 01 Dec 2013, 4:39
> >    To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> >    Subject: [meta-arago] Header files missing in the image
> >
> >    Hi all,
> >
> >
> >
> >    I have faced a strange issue during one of the builds. The
> generated GLSDK
> >    image has an empty /usr/include ie no .h files at all.
> >
> >    Is this due to any misconfiguration from my side?
> >
> >
> >
> >    Appreciate any help on this.
> >
> >
> >
> >    Thanks and Regards,
> >
> >    Mrinmayee
> >
> >

