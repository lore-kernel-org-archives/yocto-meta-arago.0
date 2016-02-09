Return-Path: <anandb@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CA96D529E4
	for <meta-arago@arago-project.org>;
	Tue,  9 Feb 2016 05:50:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u195o3IQ006897
	for <meta-arago@arago-project.org>; Mon, 8 Feb 2016 23:50:03 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u195o2QY031164
	for <meta-arago@arago-project.org>; Mon, 8 Feb 2016 23:50:03 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u195o0q4023738
	for <meta-arago@arago-project.org>; Tue, 9 Feb 2016 11:20:01 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Tue, 9 Feb 2016 11:19:59 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to
	/dev/dri/card0
Thread-Index: AQHRXcgRAtL6Fw4RekCclPmovcVxFJ8b3gSAgAEurQCAADYWgIAF/Qvw
Date: Tue, 9 Feb 2016 05:49:58 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622731CC947@DBDE04.ent.ti.com>
References: <1454424195-11064-1-git-send-email-anandb@ti.com>
	<20160204183559.GO31480@edge> <56B44A9E.1090204@ti.com>
	<20160205155253.GS31480@edge>
In-Reply-To: <20160205155253.GS31480@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Tue, 09 Feb 2016 05:50:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

I posted v2 of the patch.

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, February 05, 2016 9:23 PM
To: Balagopalakrishnan, Anand
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

Anand,

Thanks. Then we need to add this line to the patch for tracking:

Upstream-Status: Pending

--=20
Denys


On Fri, Feb 05, 2016 at 12:39:18PM +0530, Anand Balagopalakrishnan wrote:
> Denys,
>=20
> I plan to push the embedded patch to wayland-devel. We could have a
> rework of this patch based on comments.
>=20
> Nonetheless, I have no doubt that this patch is indeed required. The
> current Weston code is not factoring in the embedded SoC
> configurations.
>=20
> Regards,
> Anand
>=20
> On Friday 05 February 2016 12:05 AM, Denys Dmytriyenko wrote:
> >Anand,
> >
> >Is this patch meant to be upstreamed? Or is this rather a hack for our
> >own setup? If latter, please add the patch to weston_1.9.0.bbappend in
> >meta-arago-distro instead of the main recipe. Thanks.
> >
>=20

