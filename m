Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6580552972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 21:07:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HL7ZbW027451;
	Thu, 17 Jul 2014 16:07:35 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HL7Zc3021954;
	Thu, 17 Jul 2014 16:07:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 16:07:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HL7ZhT020450;
	Thu, 17 Jul 2014 16:07:35 -0500
Date: Thu, 17 Jul 2014 17:07:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20140717210734.GA15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<20140717205217.GW15788@edge>
	<CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Jul 2014 21:07:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 17, 2014 at 05:02:33PM -0400, Brian Hutchinson wrote:
> On Thu, Jul 17, 2014 at 4:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > Hi, Brian,
> >
> > Sorry for the delay.
> >
> > You basically have 2 options:
> >
> > 1. Use the BSP originally made by TI specifically for OMAPL138 devices,
> > including AM18x. That would mean kernel 2.6.37 and hence, you'd need older
> > toolchain (~gcc-4.5) and older usedspace and system libs like udev... To
> > achieve that you'd need to use an older release of Yocto/OE/Arago, say Denzil,
> > Danny, maybe Dylan.
> >
> > 2. Use the latest mainline kernel, which supports most of OMAPL138 platforms,
> > but TI doesn't make an official product based on this, so no commercial
> > support, unfortunately. But you can use the latest toolchain, userspace etc.
> > with it and build it out of more recent Yocto/OE/Arago, like master, Daisy,
> > Dora etc.
> >
> > As of the LICENSE breagake in meta-arago - I'll fix it, but the old gcc-4.5
> > based Arago toolchain is now pretty much deprecated.
> 
> Hey Denys,
> 
> You said latest toolchain ... which toolchain?  I didn't think Arago
> built a toolchain.  Looks like the arago-2011.09 is still the one to
> be used with Arago but I'm not 100% sure on that which is why I asked.

TOOLCHAIN_TYPE=internal will build the toolchain from sources.


> I build everything using Yocto 1.5 last year and remember having
> issues building 3.12 with the toolchain built by Yocto.  If I remember

Hmm, not sure about the issues with the upstream toolchain. Another option 
would be to use Linaro toolchain - either external or internal. The only catch 
is that Linaro is not directly targeting or supporting ARM9 platforms. So, any 
support requests would have to go to upstream GCC.


> correctly, use used rootfs built for am1808 using the toolchain in
> Yocto 1.5 and the davinci kernel I used had to be built with the
> arago-2011.09 toolchain.
> 
> I'm getting ready for another release of our product and am stepping
> up to daisy (1.6) to pickup latest package fixes etc. (heartbleed in
> openssl etc.).
> 
> Regards,
> 
> Brian

