Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CA0B952990
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 22:27:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMMR7oK019726
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 16:27:07 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMMR7Op010520
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 16:27:07 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 22 Nov 2013 16:27:06 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Rini, Tom" <trini@ti.com>
Thread-Topic: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new udev
	entry
Thread-Index: AQHO55E1uU1O34XSuUC6o8gkz9jX75oyEG6A///C3hA=
Date: Fri, 22 Nov 2013 22:27:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C059E@DFLE08.ent.ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
	<1385135121-14345-5-git-send-email-fcooper@ti.com>
	<20131122200029.GT420@bill-the-cat>
In-Reply-To: <20131122200029.GT420@bill-the-cat>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Fri, 22 Nov 2013 22:27:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Tom Rini [mailto:tom.rini@gmail.com] On Behalf Of Rini, Tom
> Sent: Friday, November 22, 2013 2:00 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new ude=
v
> entry
>=20
> On Fri, Nov 22, 2013 at 09:45:20AM -0600, Franklin S. Cooper Jr wrote:
>=20
> > * Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a udev
> entry to
> >   automatically mount sd card partition.
> > * For some reason that udev entry isn't automatically ran.
> > * As a workaround manually trigger udev to run twice (not sure why that=
s
> needed)
> >   for the udev rule to run correctly.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>=20
> This issn't right.  Have you added debugging steps to the mount.sh script=
?
> We're saying, with this change "lets trigger all block devices 3 times", =
and on the
> 3rd attempt we finally do mount things.  I've seen some partitions NOT be=
 auto-
> mounted due to being dirty and needing an fsck prior to mounting them.  I=
f we
> need to do this type of change at the end as a "we can't figure out the r=
oot
> cause, but we need to release", OK.
> But I don't think we're there yet.  Thanks!
[Franklin] Just to give an update it looks like fsck is required to be ran =
to fix this problem however it wouldn't be safe to run fsck and let it auto=
 fix the problem since that could cause potential issues. So if fsck is rea=
lly the proper solution then I'm not sure that would work for something tha=
t needs to automatically work at bootup.=20
>=20
> --
> Tom

