Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3D9D552975
	for <meta-arago@arago-project.org>;
	Thu, 14 Jul 2016 17:51:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6EHnVKN012845;
	Thu, 14 Jul 2016 12:49:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6EHpi0o029151;
	Thu, 14 Jul 2016 12:51:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 14 Jul 2016 12:51:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6EHpivT031377;
	Thu, 14 Jul 2016 12:51:44 -0500
Date: Thu, 14 Jul 2016 13:51:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Thomas <pthomas8589@gmail.com>
Message-ID: <20160714175143.GA3473@edge>
References: <CAD56B7dPn1yNtVe+oDi=m3yUdoVa6+xpggAeUjRk356AkP4rSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD56B7dPn1yNtVe+oDi=m3yUdoVa6+xpggAeUjRk356AkP4rSA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: arago arm9
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
X-List-Received-Date: Thu, 14 Jul 2016 17:51:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

ARM9 platforms haven't been part of our builds and releases for quite some 
time - probably since daisy or maybe even before. So, some parts started to 
rot (first 2 issues you mentioned) and since the custom Arago toolchain used 
for those is about 5 years old, I started removing support for it from latest 
meta-arago (the last parsing issue).

The platforms themselves are still part of meta-ti and mainline kernel, so 
they can still be built with a more generic OE distroless or maybe even Poky 
distro, but Arago support has been deprecated for now...

-- 
Denys


On Mon, Jul 04, 2016 at 08:39:23PM -0400, Paul Thomas wrote:
> Hi I'm trying to build an arago root file system for the L138 but
> following the instructions on the wiki page:
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> 
> For daisy for MACHINE=am180x-evm with a few small changes (compiler
> md5 & changing to linux-dummy) this worked, but udev was broken saying
> "udevd[588]: unable to receive ctrl connection: Function not
> implemented" looking other places this appears to be an issue with
> accept4, arm-arago-linux-gnueabi-gcc doesn't even compile a test
> program with the system call. (BTW, the system is runnable and usable,
> but logging is flodded with the udev messages)
> 
> Anyway my thought was to then try dora, but this also seems broken
> when trying to build kmod with lines like "kmod.c:73: undefined
> reference to `_Static_assert'"
> 
> Is there any sort of build matix for the current build status? I think
> it would be very helpful to include that on the wiki page
> (http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment).
> I can provide further info for either the kmod or udev issues.
> 
> Just for completeness, krogoth & fido say:
> ERROR: ParseError at
> /home/bulk/amsc/arago/tisdk_krogoth/sources/meta-arago/meta-arago-distro/conf/distro/arago.conf:83:
> Could not include required file
> conf/distro/include/toolchain-arago.inc
> 
> thanks,
> Paul
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

