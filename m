Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2A5C252090
	for <meta-arago@arago-project.org>;
	Mon, 26 Aug 2013 18:56:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7QIuED9021651
	for <meta-arago@arago-project.org>; Mon, 26 Aug 2013 13:56:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7QIuEEi011158
	for <meta-arago@arago-project.org>; Mon, 26 Aug 2013 13:56:14 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 26 Aug 2013 13:56:14 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
	LOCALVERSION	and AUTOREV
Thread-Index: AQHOoERNyVGqYPsC8kOE6zc7+d2x8pmjSKeQgABWWwD//7ZVQIAElH+A///hktCAAA+JMA==
Date: Mon, 26 Aug 2013 18:56:13 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596E8D38@DLEE11.ent.ti.com>
References: <1377291818-28047-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
	<20130823211516.GI27308@edge>
	<8F29D6B095ED194EA1980491A5E029710C52B79D@DFLE08.ent.ti.com>
	<20130826144807.GA20807@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C52CC93@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C52CC93@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION	and AUTOREV
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
X-List-Received-Date: Mon, 26 Aug 2013 18:56:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Monday, August 26, 2013 1:04 PM
>To: Dmytriyenko, Denys
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
>LOCALVERSION and AUTOREV
>
>
>
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Monday, August 26, 2013 9:48 AM
>> To: Cooper Jr., Franklin
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
>LOCALVERSION
>> and AUTOREV
>>
>> On Fri, Aug 23, 2013 at 09:54:44PM +0000, Cooper Jr., Franklin
>wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Dmytriyenko, Denys
>> > > Sent: Friday, August 23, 2013 4:15 PM
>> > > To: Cooper Jr., Franklin
>> > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
>> > > Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging:
>enable
>> > > LOCALVERSION and AUTOREV
>> > >
>> > > On Fri, Aug 23, 2013 at 09:08:06PM +0000, Cooper Jr.,
>Franklin wrote:
>> > > >
>> > > >
>> > > > > -----Original Message-----
>> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-
>arago-
>> > > > > bounces@arago-project.org] On Behalf Of Denys
>Dmytriyenko
>> > > > > Sent: Friday, August 23, 2013 4:04 PM
>> > > > > To: meta-arago@arago-project.org
>> > > > > Subject: [meta-arago] [PATCHv2 3/4] linux-ti-staging:
>enable
>> > > > > LOCALVERSION and AUTOREV
>> > > > >
>> > > > > From: Denys Dmytriyenko <denys@ti.com>
>> > > > >
>> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> > > > > ---
>> > > > > v2 - removed the comment about upstreaming LOCALVERSION,
>may not
>> > > > > happen
>> > > > >
>> > > > >  .../recipes-kernel/linux/linux-ti-staging_git.bbappend
>| 17
>> > > > > +++++++++++++++++
>> > > > >  1 file changed, 17 insertions(+)  create mode 100644
>> > > > > meta-arago-distro/recipes-kernel/linux/linux-ti-
>> > > > > staging_git.bbappend
>> > > > >
>> > > > > diff --git
>> > > > > a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_git.bb
>> > > > > appe
>> > > > > nd
>> > > > > b/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_git.bb
>> > > > > appe
>> > > > > nd
>> > > > > new file mode 100644
>> > > > > index 0000000..f99482c
>> > > > > --- /dev/null
>> > > > > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_gi
>> > > > > +++ t.bb
>> > > > > +++ append
>> > > > > @@ -0,0 +1,17 @@
>> > > > > +MACHINE_KERNEL_PR_append =3D "-arago0"
>> > > > > +
>> > > > > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>> > > > > +
>> > > > > +require copy-defconfig.inc
>> > >
>> > > > [Franklin] Are we really planning on have different
>defconfigs for
>> > > > each machine? I thought with DT all machines will share
>the same
>> defconfig.
>> > >
>> > > Yes, linux-ti-staging uses a blank defconfig that points to
>> omap2plus_defconfig.
>> > >
>> > > But copy-defconfig just saves the current config for SDK use
>- they
>> > > will be the same for machines using this recipe. But still,
>there
>> > > are currently only 2 OMAP machines supported by this kernel
>and will
>> > > be 2 Sitara machines with this patchset. If/when we switch
>remaining
>> > > SDK machines to use the latest kernel, we can revisit this
>matter, I guess.
>> > [Franklin]
>> > I guess my point was that copy-defconfig.inc renames the
>.config to
>> > tisdk_${MACHINE}_defconfig. Can we set CONFIG_NAME to
>> "omap2plus_defconfig"
>> > since we should stick with that defconfig name for all
>machines?
>>
>> And what I was trying to say before, is that "all machines" is
>currently only 2 out
>> of several and even then, omap2plus_defconfig in the kernel may
>not match
>> exactly the one produced by the SDK - there may be some mangling
>involved to
>> adjust some config options to sane defaults (although we no
>longer include
>> linux.inc with that code), plus we run "make oldconfig" on it,
>which checks
>> dependecies between config options and may change some os them.
>In other
>> words: omap2plus_defconfig !=3D .config which we package in the
>SDK. It is like
>> the difference between pristine sources and sources that were
>patched and
>> configured...
>[Franklin]  I was hoping we would get rid of all the tweaks to the
>defconfig so that omap2plus_defconfig =3D=3D .config . This would mean
>we push all modifications we needed to mainline. Similar to my
>response to Chase if that isn't the plan then I have no issue with
>the approach.

It's not about just pushing everything to mainline. You may decide to enabl=
e/disable features for your SDK and want to have different configs for a de=
vice.  Currently we only use one ut I don't see the harm in having a copy t=
hat is consistent so that everyone knows what we built with in case you do =
need any tweaks.

>>
>> --
>> Denys
>>
>>
>> > > > > +SRCREV =3D "${AUTOREV}"
>> > > > > +
>> > > > > +KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>> > > > > True).partition('+')[2][0:7]}"
>> > > > > +
>> > > > > +kernel_do_configure_prepend() {
>> > > > > +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion
>]
>> > > > > +    then
>> > > > > +        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>> > > > > +        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>> > > > > +    fi
>> > > > > +}
>> > > > > --
>> > > > > 1.8.3.2
>> > > > >
>> > > > > _______________________________________________
>> > > > > meta-arago mailing list
>> > > > > meta-arago@arago-project.org
>> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>arago
>> > > > _______________________________________________
>> > > > meta-arago mailing list
>> > > > meta-arago@arago-project.org
>> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>arago
>> >
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

