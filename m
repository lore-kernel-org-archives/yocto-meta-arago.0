Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 73C9052972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 21:01:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HL18ub024732;
	Thu, 17 Jul 2014 16:01:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HL18C5023235;
	Thu, 17 Jul 2014 16:01:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 16:01:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HL18VE003493;
	Thu, 17 Jul 2014 16:01:08 -0500
Date: Thu, 17 Jul 2014 17:01:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20140717210107.GY15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C6E4B7C@DFLE08.ent.ti.com>
	<CAFZh4h8gkn=P-g0bqjo094Z3xgFqiigU7zPOqfpOjTMGVoCAZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h8gkn=P-g0bqjo094Z3xgFqiigU7zPOqfpOjTMGVoCAZg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Thu, 17 Jul 2014 21:01:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 17, 2014 at 04:54:08PM -0400, Brian Hutchinson wrote:
> On Thu, Jul 17, 2014 at 4:45 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
> > Honestly I don't know how many people are still using am18x in the latest maintenance branches/master. The last TI SDK that used am18x was based on danny.
> > If you used oe-layersetup I would also recommend using either the danny config or the amsdk-06.00.00.00-config.txt. With that you should be able to get something working.
> > The last TI supported kernel for am18 is rather old (2.6.37) and I think some programs like newer udev had issues with such an old kernel so it might take a bit of work to get that working with the latest maintenance branches.
> >
> > The current external Linaro toolchain used in Arago does not support ARM9. The Arago toolchain is your best bet.
> >
> 
> arago-2011.09 is what I've been using but didn't know if there has
> been any update to this.  It's not like you can browse
> http://downloads.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain to see
> what's out there.  If you don't know the name you can't get anything
> from there.

No, I only made 1 release of the Arago toolchain - 2011.09 that is gcc-4.5 
based.

Linaro toolchain (and Linaro in general) is not specifically targeting ARM9, 
but it's still based on upstream GCC and hence should still work and produce 
code for ARM9... Another option is to use upstream GCC completely, i.e. an 
internal toolchain from OE-Core.


> I've been using 3.12 kernel from davinci with latest rootfs.

That will have less problems than 2.6.37, but still prone to issues with the 
old toolchain.

-- 
Denys

