Return-Path: <trini@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6248A529B5
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2014 20:39:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s14KdRJD005241;
	Tue, 4 Feb 2014 14:39:27 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14KdRRo029839;
	Tue, 4 Feb 2014 14:39:27 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 4 Feb 2014 14:39:27 -0600
Received: from [172.22.136.209] (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14KdLtH019330;
	Tue, 4 Feb 2014 14:39:22 -0600
Message-ID: <52F14FF7.5090103@ti.com>
Date: Tue, 4 Feb 2014 15:39:19 -0500
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: matti kaasinen <matti.kaasinen@gmail.com>
References: <CADnUhn0GG7AByt0bWeqkCtVWxNxr66-8m16-YaxnM-S4aw5B4w@mail.gmail.com>
	<20140129025313.GM6814@edge>
	<CADnUhn3EbUhYYo4TjxVi+dDM9n-62SOk65kCH-ehe_-Ax4DGZg@mail.gmail.com>
	<20140129162314.GP6814@edge>
In-Reply-To: <20140129162314.GP6814@edge>
X-Enigmail-Version: 1.6
X-Mailman-Approved-At: Tue, 04 Feb 2014 20:42:03 +0000
Cc: meta-arago@arago-project.org, Pekon Gupta <pekon@ti.com>
Subject: Re: ubifs crossupport between Linux and U-Boot
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
X-List-Received-Date: Tue, 04 Feb 2014 20:39:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 01/29/2014 11:23 AM, Denys Dmytriyenko wrote:
> +Tom Rini
> 
> Tom, can you please comment? Thanks.
> 
> 
> On Wed, Jan 29, 2014 at 05:20:26PM +0200, matti kaasinen wrote:
>> In short:
>> If I create UBIFS partition on Linux side, it works quite fine. I can
>> create directories, files update them without  problems. But if I open this
>> volume on U-Boot side, I'll get thousands of ecc error messages. Now, if I
>> try to access this same volume from Linux side after this episode, it also
>> provides these ecc errors. Therefore, Linux created UBIFS partition gets
>> corrupted by accessing it from U-Boot side. Volume opening is enough for
>> this. This I have experienced by Angstrom distribution with Linux 3.8.13
>> and it possibly was U-Boot 10.04. Anyhow, as it seems that you are now
>> working with Linux 3.12 - U-Boot 2013-10 combination, you'll need patching
>> to cope with this issue. By my understanding required patching is not made
>> before U-Boot 2014-01 and Linux 3.14.

If you do not have sufficient malloc space in U-Boot (and by default, we
do not right now on TI armv7 platforms, in some cases, I will be fixing
this shortly), UBI/UBIFS support can go whacky.  I've not seen ECC
errors, but I've seen other things.

Also you made sure that step one was a 'nand erase' on the whole of the
area you're going to be using, right?

-- 
Tom

