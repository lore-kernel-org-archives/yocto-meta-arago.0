Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0F4D8529CC
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2013 15:34:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8NFYkvx031105;
	Mon, 23 Sep 2013 10:34:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NFYkvL010529;
	Mon, 23 Sep 2013 10:34:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 23 Sep 2013 10:34:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
	when packaging data to avoid breakage
Thread-Index: AQHOtjOrf6IhCDQdC0WSxKtxZdgs95nPFFQ7gABYwACAAAErgIAECUZg
Date: Mon, 23 Sep 2013 15:34:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159741920@DLEE11.ent.ti.com>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
	<20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C558340@DFLE08.ent.ti.com>
	<20130920205310.GE30673@edge>
In-Reply-To: <20130920205310.GE30673@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Mon, 23 Sep 2013 15:34:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Friday, September 20, 2013 4:53 PM
>To: Cooper Jr., Franklin
>Cc: Maupin, Chase; Denys Dmytriyenko; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference
>symlinks when packaging data to avoid breakage
>
>On Fri, Sep 20, 2013 at 08:49:00PM +0000, Cooper Jr., Franklin
>wrote:
>>
>>
>> > -----Original Message-----
>> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> > bounces@arago-project.org] On Behalf Of Maupin, Chase
>> > Sent: Friday, September 20, 2013 3:31 PM
>> > To: Denys Dmytriyenko
>> > Cc: meta-arago@arago-project.org
>> > Subject: Re: [meta-arago] [PATCH] sourceipk: do not
>dereference symlinks
>> > when packaging data to avoid breakage
>> >
>> > Will this still package things like the patches applied on top
>of the kernel in the
>> > kernel sources?
>>
>> [Franklin] Good call. Your right it doesn't. I gave it a shot
>and the
>> symbolic link remains but of course the link is broken if it is
>used on a
>> different machine.
>
>Yeah, I had the same question originally. Unfortunately, you
>cannot assume
>there are no broken links in the sources to begin with. And those
>broken
>symlinks cannot be dereferenced w/o breaking the entire tar
>command and hence
>the build. That is what we discussed couple days ago - kernel now
>has a broken
>symlink that kills our sourceipk...
>
>Why do patches symlinked and not copied? Can we fix that step
>instead of doing
>it in tar command?

For most builds I think the idea is not to have multiple copies of the patc=
hes.  But we wanted to provide those patches in the sources we ship.  That =
was why the symlink we dereferenced to provide the real file and not a poin=
ter to the patch.  So I'm not sure that it is a good idea to always copy pa=
tches instead of symlink as most people probably won't care.  Is there a wa=
y to bypass the error?  Maybe something like --ignore-command-error?  I'm n=
ot sure what changed that created this issue so I'm not sure if this applie=
s.

>
>--
>Denys
>
>
>> > On Sep 20, 2013, at 2:00 PM, "Denys Dmytriyenko"
><denis@denix.org> wrote:
>> >
>> > > From: Denys Dmytriyenko <denys@ti.com>
>> > >
>> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> > > ---
>> > > meta-arago-distro/classes/sourceipk.bbclass | 2 +-
>> > > 1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta-arago-distro/classes/sourceipk.bbclass
>b/meta-arago-
>> > distro/classes/sourceipk.bbclass
>> > > index 1ea0577..777cb4f 100644
>> > > --- a/meta-arago-distro/classes/sourceipk.bbclass
>> > > +++ b/meta-arago-distro/classes/sourceipk.bbclass
>> > > @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
>> > >         fi
>> > >
>> > >         #Write the data tarball
>> > > -        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf
>$srcipk_dir/data.tar.gz .
>> > > +        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf
>$srcipk_dir/data.tar.gz .
>> > >
>> > >         # Create the debian-binary file
>> > >         echo "2.0" > $srcipk_dir/debian-binary
>> > > --
>> > > 1.8.3.2
>> > >
>> > > _______________________________________________
>> > > meta-arago mailing list
>> > > meta-arago@arago-project.org
>> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

