Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1566.1634596638558445490
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 15:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8968B40C1C;
	Mon, 18 Oct 2021 22:37:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5RbKgrKf4Ej; Mon, 18 Oct 2021 22:37:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 660CE406B5;
	Mon, 18 Oct 2021 22:37:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2DBB6174695; Mon, 18 Oct 2021 18:37:15 -0400 (EDT)
Date: Mon, 18 Oct 2021 18:37:15 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Cc: meta-arago@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-arago] [dunfell/master][PATCH 2/2] linux-firmware: Package intel 9260 WiFi and BT firmware
Message-ID: <20211018223715.GL10132@denix.org>
References: <20211007140939.19819-1-sinthu.raja@ti.com>
 <20211007140939.19819-3-sinthu.raja@ti.com>
 <20211007180722.GR1528@denix.org>
 <CAEd-yTQdf6kJDD3PL8voJ+b=ciYKrtqi86CUm9DHden-TuNhBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEd-yTQdf6kJDD3PL8voJ+b=ciYKrtqi86CUm9DHden-TuNhBw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2021 at 01:54:35PM +0530, Sinthu Raja M wrote:
> On Thu, Oct 7, 2021 at 11:37 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, Oct 07, 2021 at 07:39:39PM +0530, Sinthu Raja wrote:
> > > From: Sinthu Raja <sinthu.raja@ti.com>
> > >
> > > The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
> > > repository.
> > >
> > > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > > ---
> > >  .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> > > index 146596ad..2e2ab1c4 100644
> > > --- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> > > +++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> > > @@ -1,4 +1,16 @@
> > > -PR_append = ".arago0"
> > > +PR_append = ".arago1"
> > > +
> > > +PACKAGES_prepend_j7-evm =+ "${PN}-iwlwifi-9260"
> > > +PACKAGES_prepend_j7-evm =+ "${PN}-ibt-18"
> >
> > Two issues here:
> >
> > 1. use either _prepend or =+ but not both
> Hi Denys,
> I found an issue that _prepend is not working and throwing error
> during parsing the recipes, below is the error
> Nothing RPROVIDES 'linux-firmware-iwlwifi-9260'

The reason is that += and =+ automatically insert whitespace, while _prepend 
and _append do not, simply concatenating strings as is, so you need to take 
care of whitespaces yourself.


> But when adding only '=+', it is able to parse the recipe. So, I will
> resend the patch with the updated code.
> 
> Regards,
> Sinthu Raja.
> 
> > 2. making machine-specific changes to only PACKAGES isn't right for several
> > reasons - should probably be a generic change
> >
> >
> > > +LICENSE_${PN}-iwlwifi-9260 =+ "Firmware-iwlwifi_firmware"
> > > +LICENSE_${PN}-ibt-18 =+ "Firmware-ibt_firmware"
> > > +
> > > +FILES_${PN}-iwlwifi-9260 =+ "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
> > > +FILES_${PN}-ibt-18 =+ "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
> > > +
> > > +RDEPENDS_${PN}-iwlwifi-9260 =+ "${PN}-iwlwifi-license"
> > > +RDEPENDS_${PN}-ibt-18 =+ "${PN}-ibt-license"
> > >
> > >  do_install_append() {
> > >       rm -rf  ${D}/lib/firmware/ti-connectivity/
> > > --
> > > 2.31.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
