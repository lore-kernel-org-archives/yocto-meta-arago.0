Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by arago-project.org (Postfix) with ESMTPS id CBD9F529E8
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 00:58:47 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so2823058pab.41
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 17:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Aw0EKS23SvOyX0cEg+qsbspXEZqNgbNIhg3YyghJYSw=;
	b=JFnEAiaHY9wNLsaLcUof0g9mH5GL2L+BDr2Nm92rapu0/5/AGuS2ysUSRRItwx0tpV
	L5xyBEkflj/ecwPlScwDCHFqEvMAhxlmVwQ3z7kLthOEKgRf5648aV/Bi1TIZwzxL7Ih
	oZIGOfgvhVNycNCf/ggVlhgn9K3hCdd313c9IKJm/zt+aRAXzBARscvHmu5CWmnjhcyB
	8jiSfTA78ZwEKAxmUpP5i/KKqGmSROiNQlyAolo3HI47WwEpSuYf0X8ris96kkKq9Y83
	LqRawJqO3G2XQwUvU0I4Pju+n9lLEKYXef79O+R19ddVyJ6y6EmYkCQPj0r5525QPgcP
	JYdA==
X-Received: by 10.68.96.130 with SMTP id ds2mr5143800pbb.99.1377219526504;
	Thu, 22 Aug 2013 17:58:46 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225]) by mx.google.com with ESMTPSA id
	tz3sm13503345pbc.20.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 17:58:45 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <5216B3C1.30705@gna.org>
Date: Fri, 23 Aug 2013 12:58:41 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <CADBzu5AZA8NRjTeQGvFDurHEDOx=gaSL90FgYM0-0tf1kdDAmQ@mail.gmail.com>
In-Reply-To: <CADBzu5AZA8NRjTeQGvFDurHEDOx=gaSL90FgYM0-0tf1kdDAmQ@mail.gmail.com>
Subject: Re: flashing arago onto beaglebone black emmc
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
X-List-Received-Date: Fri, 23 Aug 2013 00:58:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/13 09:36, Nick Gart wrote:
>
> Sorry, I am not sure if my first e-mail went through since I wasn't
> subscribed to the list, please ignore if this is a duplicate.
>
> I'm trying to flash ti-sdk-am335x-evm-06.00.00.00 to the eMMC of a
> beagle bone black.
> I believe I'm successfully partitioning and flashing it, using
> angstrom's emmc flashing
> script(https://raw.github.com/beagleboard/meta-beagleboard/master/contrib/bone-flash-tool/emmc.sh)

Are you running this script from an external SD/MMC card? I assume so, 
Do you have a log? Did you run this script unmodified?


> but upon boot I get the following output:
>
>
> U-Boot SPL 2013.01.01 (Aug 20 2013 - 17:14:40)

It seems the processor was able to load MLO, which in turn loads u-boot 
SPL, but where from? Is your external MMC still in at that stage?
If not, then at least up to there, stuff have been loaded from your eMMC 
VFAT boot partition.

> musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
> HB-ISO Rx, HB-ISO Tx, SoftConn)
> musb-hdrc: MHDRC RTL version 2.0
> musb-hdrc: setup fifo_mode 4
> musb-hdrc: 28/31 max ep, 16384/16384 memory
> USB Peripheral mode controller at 47401000 using PIO, IRQ 0
> musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
> HB-ISO Rx, HB-ISO Tx, SoftConn)
> musb-hdrc: MHDRC RTL version 2.0
> musb-hdrc: setup fifo_mode 4
> musb-hdrc: 28/31 max ep, 16384/16384 memory
> USB Host mode controller at 47401800 using PIO, IRQ 0
> OMAP SD/MMC: 0

One (e)MMC instance for u-boot SPL (while "full" u-boot sees 2, see 
below)...

> mmc_send_cmd : timeout: No status update

I'm not sure if it's the beginning of your problems, but it seems u-boot 
SPL is having some trouble with (e)MMC ...

> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2013.01.01 (Aug 20 2013 - 17:14:40)

... but anyway, u-boot SPL was able to load and run a "full" u-boot, 
again, is it from eMMC? If so, this is looking good.

>
> I2C:   ready
> DRAM:  512 MiB
> WARNING: Caches not enabled
> NAND:  No NAND device found!!!
> 0 MiB
> MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1

2 (e)MMC instances for "full" u-boot (u-boot SPL had only one), looks 
good to me so far.

> *** Warning - readenv() failed, using default environment

If you don't have a uEnv.txt on your boot partition, then this message 
can be ignored, if you have one, it means that u-boot couldn't read it

>
> musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
> HB-ISO Rx, HB-ISO Tx, SoftConn)
> musb-hdrc: MHDRC RTL version 2.0
> musb-hdrc: setup fifo_mode 4
> musb-hdrc: 28/31 max ep, 16384/16384 memory
> USB Peripheral mode controller at 47401000 using PIO, IRQ 0
> musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
> HB-ISO Rx, HB-ISO Tx, SoftConn)
> musb-hdrc: MHDRC RTL version 2.0
> musb-hdrc: setup fifo_mode 4
> musb-hdrc: 28/31 max ep, 16384/16384 memory
> USB Host mode controller at 47401800 using PIO, IRQ 0
> Net:   <ethaddr> not set. Validating first E-fuse MAC
> cpsw, usb_ether
> Hit any key to stop autoboot:  1 ... 0
> mmc_send_cmd : timeout: No status update
> Card did not respond to voltage select!
> mmc0(part 0) is current device
> mmc_send_cmd : timeout: No status update
> Card did not respond to voltage select!

The eMMC isn't detected, or maybe it's your empty external MMC slot, or 
both, can't tell, I'm not familiar with this :(

> Booting from nand ...

And the BB black doesn't have NAND!

>
> no devices available
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
> U-Boot#

Game over!

>
> Any ideas on how to proceed?

Did you have a look at u-boot and u-boot SPL source code, especially the 
(e)MMC stuff?

My half-a-cent.
Chris

PS: Can you send plain text email please? See 
http://catb.org/~esr/faqs/smart-questions.html#formats

>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


