Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B946F52972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 20:56:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HKuHi4007063;
	Thu, 17 Jul 2014 15:56:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HKuGHj012217;
	Thu, 17 Jul 2014 15:56:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 15:56:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HKuGqT016288;
	Thu, 17 Jul 2014 15:56:16 -0500
Date: Thu, 17 Jul 2014 16:56:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140717205616.GX15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C6E4B7C@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E4B7C@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: New Arago - am180x-evm core-image-minimal build is getting MD5 LICENSE errors in daisy
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
X-List-Received-Date: Thu, 17 Jul 2014 20:56:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 17, 2014 at 08:45:58PM +0000, Cooper Jr., Franklin wrote:

> Honestly I don't know how many people are still using am18x in the latest 
> maintenance branches/master. The last TI SDK that used am18x was based on 
> danny.
> If you used oe-layersetup I would also recommend using either the danny 
> config or the amsdk-06.00.00.00-config.txt. With that you should be able to 
> get something working.
> The last TI supported kernel for am18 is rather old (2.6.37) and I think 
> some programs like newer udev had issues with such an old kernel so it might 
> take a bit of work to get that working with the latest maintenance branches.
> 
> The current external Linaro toolchain used in Arago does not support ARM9. 
> The Arago toolchain is your best bet.

Well, you could still use the old Arago toolchain as external for basic things 
like rootfs, but there will be problems with SDK/devkit, as I already dropped 
all the old toolchain components from latest meta-arago... Like I said in the 
other email, this is getting deprecated.

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Brian Hutchinson
> > Sent: Thursday, July 17, 2014 8:30 AM
> > To: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] New Arago - am180x-evm core-image-minimal build
> > is getting MD5 LICENSE errors in daisy
> > 
> > No ARM9 folks on here?
> > 
> > On Fri, Jul 11, 2014 at 4:34 PM, Brian Hutchinson <b.hutchman@gmail.com>
> > wrote:
> > 
> > > So what I did is edit
> > > tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-
> > > arago-toolchain.bb and replaced the LICENSE md5 with the value it
> > > calculated in the error above and that fixed it.  So not sure if a
> > > recipe is busted or if I hosed up something somehow but I thought I'd
> > > ask about it.
> > >
> > > So what is the story with ARM9 AM1808?  Can I use Linaro toolchain yet
> > > or is there still some compatibility issue that is best if I use the
> > > Arago 2011.09?
> > >
> > > Thanks for any ideas/pointers.
> > >
> > > Regards,
> > >
> > > Brian
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

