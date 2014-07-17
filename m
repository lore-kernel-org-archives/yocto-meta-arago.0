Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id 5C84B52972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 21:02:34 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id o6so1617291oag.11
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HzR4AiVnedqsSaazPMiCioH3OP2H24/6FV0zVPUBVr4=;
	b=M3KqsB4maQXtQxksTFX70a/HJrRl+mHmEkzD360Ee6RewqYNOOfy196K9BLHgE9MER
	HWPHCcBa6ho4N3SdM7plpDFPuXgLRQJY/BGd6VZB5uozgdDQtaTXzAegHh6yo54RPcK1
	nb1o2rG1SwlEES+v9aGldWgVTWC+uwBkIIPIpMSLy389m1d6+0xZOz7JwjO/bXVXAtAH
	LrQTfLdT850ybFbpoBRwv36NVdcQWdTovhOA6f98jDnMdowCVM9MsPlPApBXNVnbZRdG
	okQ72yDbww1vyHXrqNAPwlXV36wep1O7A4Tmaw1lnU3/Gul2pxNfgmatMu/0yL4GzvNl
	iHeA==
MIME-Version: 1.0
X-Received: by 10.182.241.130 with SMTP id wi2mr49248497obc.27.1405630953519; 
	Thu, 17 Jul 2014 14:02:33 -0700 (PDT)
Received: by 10.60.124.234 with HTTP; Thu, 17 Jul 2014 14:02:33 -0700 (PDT)
In-Reply-To: <20140717205217.GW15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<20140717205217.GW15788@edge>
Date: Thu, 17 Jul 2014 17:02:33 -0400
Message-ID: <CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Thu, 17 Jul 2014 21:02:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 17, 2014 at 4:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Hi, Brian,
>
> Sorry for the delay.
>
> You basically have 2 options:
>
> 1. Use the BSP originally made by TI specifically for OMAPL138 devices,
> including AM18x. That would mean kernel 2.6.37 and hence, you'd need older
> toolchain (~gcc-4.5) and older usedspace and system libs like udev... To
> achieve that you'd need to use an older release of Yocto/OE/Arago, say Denzil,
> Danny, maybe Dylan.
>
> 2. Use the latest mainline kernel, which supports most of OMAPL138 platforms,
> but TI doesn't make an official product based on this, so no commercial
> support, unfortunately. But you can use the latest toolchain, userspace etc.
> with it and build it out of more recent Yocto/OE/Arago, like master, Daisy,
> Dora etc.
>
> As of the LICENSE breagake in meta-arago - I'll fix it, but the old gcc-4.5
> based Arago toolchain is now pretty much deprecated.

Hey Denys,

You said latest toolchain ... which toolchain?  I didn't think Arago
built a toolchain.  Looks like the arago-2011.09 is still the one to
be used with Arago but I'm not 100% sure on that which is why I asked.
I build everything using Yocto 1.5 last year and remember having
issues building 3.12 with the toolchain built by Yocto.  If I remember
correctly, use used rootfs built for am1808 using the toolchain in
Yocto 1.5 and the davinci kernel I used had to be built with the
arago-2011.09 toolchain.

I'm getting ready for another release of our product and am stepping
up to daisy (1.6) to pickup latest package fixes etc. (heartbleed in
openssl etc.).

Regards,

Brian

