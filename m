Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 80226529C2
	for <meta-arago@arago-project.org>;
	Thu,  3 Jul 2014 14:16:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s63EGq2H008659;
	Thu, 3 Jul 2014 09:16:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s63EGqhc026766;
	Thu, 3 Jul 2014 09:16:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 3 Jul 2014 09:16:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s63EGpkc011863;
	Thu, 3 Jul 2014 09:16:52 -0500
Date: Thu, 3 Jul 2014 10:16:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ulf Samuelsson <meta-arago@emagii.com>
Message-ID: <20140703141651.GJ15788@edge>
References: <53B449D5.30600@emagii.com> <20140702181315.GA15788@edge>
	<53B459CC.20805@emagii.com> <20140702191802.GB15788@edge>
	<53B45C0A.60805@emagii.com>
	<8F29D6B095ED194EA1980491A5E029710C6DA912@DFLE08.ent.ti.com>
	<53B46ADA.1070400@emagii.com>
	<8F29D6B095ED194EA1980491A5E029710C6DAA36@DFLE08.ent.ti.com>
	<53B4F6EC.6070606@emagii.com> <53B541DB.9030105@emagii.com>
MIME-Version: 1.0
In-Reply-To: <53B541DB.9030105@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: BBB Problem: No USB host at boot
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
X-List-Received-Date: Thu, 03 Jul 2014 14:16:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 03, 2014 at 01:43:23PM +0200, Ulf Samuelsson wrote:
> Building for the Beaglebone Black, using
> meta-arago:dora/meta-ti:dora/linux-ti-staging_3.12
> 
> I boot with a mouse inserted in the USB host connector.   It is not
> detected.
> 
> $ lsusb gives an empty result
> 
> $ lsmod does not show anything but graphics
> 
> I need to start the USB host manually, for things to be working.
> 
> $ modprobe musb_am335x
> 
> Then the mouse is detected and lsusb gives the desired output
> 
> root@beaglebone:/# lsusb
> Bus 002 Device 002: ID 413c:3016 Dell Computer Corp. Optical
> 5-Button Wheel Mouse
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I got it fixed in OE-Core master, waiting for backport to Daisy...

-- 
Denys

