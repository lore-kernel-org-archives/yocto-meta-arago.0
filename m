Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D30DC5298F
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 16:23:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0TGNFwA004876;
	Wed, 29 Jan 2014 10:23:15 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TGNFr4018492;
	Wed, 29 Jan 2014 10:23:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 Jan 2014 10:23:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TGNFmP024734;
	Wed, 29 Jan 2014 10:23:15 -0600
Date: Wed, 29 Jan 2014 11:23:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20140129162314.GP6814@edge>
References: <CADnUhn0GG7AByt0bWeqkCtVWxNxr66-8m16-YaxnM-S4aw5B4w@mail.gmail.com>
	<20140129025313.GM6814@edge>
	<CADnUhn3EbUhYYo4TjxVi+dDM9n-62SOk65kCH-ehe_-Ax4DGZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn3EbUhYYo4TjxVi+dDM9n-62SOk65kCH-ehe_-Ax4DGZg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, trini@ti.com, Pekon Gupta <pekon@ti.com>
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
X-List-Received-Date: Wed, 29 Jan 2014 16:23:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

+Tom Rini

Tom, can you please comment? Thanks.


On Wed, Jan 29, 2014 at 05:20:26PM +0200, matti kaasinen wrote:
> In short:
> If I create UBIFS partition on Linux side, it works quite fine. I can
> create directories, files update them without  problems. But if I open this
> volume on U-Boot side, I'll get thousands of ecc error messages. Now, if I
> try to access this same volume from Linux side after this episode, it also
> provides these ecc errors. Therefore, Linux created UBIFS partition gets
> corrupted by accessing it from U-Boot side. Volume opening is enough for
> this. This I have experienced by Angstrom distribution with Linux 3.8.13
> and it possibly was U-Boot 10.04. Anyhow, as it seems that you are now
> working with Linux 3.12 - U-Boot 2013-10 combination, you'll need patching
> to cope with this issue. By my understanding required patching is not made
> before U-Boot 2014-01 and Linux 3.14.
> 
> Patching required include:
> Quote from Pekon's answer to me:
> 
> "
> I don't think any earlier kernel versions ever supported beaglebone
> Its only recently that a major patch-series of NAND driver was
> accepted and  tested on beaglebone.
> The patches  are currently in l2-mtd.git tree which should make into
> 3.13 kernel, before being in linux-next for sometime.
> (a) Reference:
> http://lists.infradead.org/pipermail/linux-mtd/2013-October/049462.html
> 
> (b) In addition to above series, you might need beaglebone DTS updates
> which you can refer from below ..
> http://lists.infradead.org/pipermail/linux-mtd/2013-October/049438.html
> "
> 
> U-Boot patching over U-Boot 2013-10 should be found from:
> http://patchwork.ozlabs.org/project/uboot/list/?submitter=17320&state=*.
> 
> I'm not sure how valid above link is anymore. Maybe Pekon can comment that.
> 
> -Matti
> 
> 2014-01-29 Denys Dmytriyenko <denys@ti.com>
> 
> > On Mon, Jan 20, 2014 at 04:29:52PM +0200, matti kaasinen wrote:
> > > Hi!
> > >
> > > I Have been using Angstrom distribution for my beaglebone (+ nand flash)
> > > based board. Problem with Angstrom baked Linux/U-boot images is that
> > > whereas both support ubifs partition on nand flash they both seem to
> > handle
> > > it in their own ways. Does Aragon distribution have this same problem?
> >
> > Can you please provide more detailed report for the issue? Otherwise it's
> > quite difficult to give any recommendations. Thanks.
> >
> > --
> > Denys
> >

