Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id A201652094
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 21:10:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MEU0020A2SBKZU1@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Dec 2012 15:09:58 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6A541200BD; Mon,
	10 Dec 2012 16:09:46 -0500 (EST)
Date: Mon, 10 Dec 2012 16:09:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20121210210946.GD4591@denix.org>
References: <50C648A7.4050601@ti.com> <20121210204535.GB4591@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C3463AF@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3463AF@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-arago master 469a8425 seems broken
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
X-List-Received-Date: Mon, 10 Dec 2012 21:10:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 10, 2012 at 09:03:56PM +0000, Cooper Jr., Franklin wrote:
> I had to lock down oe-core and meta-oe  because of this same issue.
> 
> Here are the commits I am using for the Sitara SDK which was before all the recent changes.
> Meta-openembedded : e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f
> Oe-core: c15fae372cf75403facc28cf76f973b1279425dd

Franklin,

While I do understand your reasoning behind such a move (especially with 
crypto software changing versions/revisions and the need to get the 
clearance), shipping the older version may expose customers to security risks, 
since 1.0.0j patches a known vulnerability issue:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2333

Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Monday, December 10, 2012 2:46 PM
> > To: Hernandez, Carlos
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] meta-arago master 469a8425 seems broken
> > 
> > On Mon, Dec 10, 2012 at 03:40:07PM -0500, Carlos Hernandez wrote:
> > > jenkins@jenkins1:/home/a0850405/oe/build$ MACHINE=am335x-evm
> > bitbake
> > > virtual/bootloader -c clean Parsing recipes: 100%
> > >
> > |################################################################
> > #####
> > > |###############|
> > > Time: 00:00:15
> > > Parsing of 1353 .bb files complete (0 cached, 1353 parsed). 1719
> > > targets, 131 skipped, 8 masked, 0 errors.
> > > ERROR: No recipes available for:
> > >
> > > /home/a0850405/oe/sources/meta-arago/meta-arago-distro/recipes-connect
> > > ivity/openssl/openssl_1.0.0i.bbappend
> > 
> > Carlos,
> > 
> > meta-arago master currently still only works with denzil. So, openssl-1.0.0i is
> > present in denzil of oe-core, while master of oe-core has newer openssl-1.0.0j.
> > 
> > --
> > Denys
> > 
> > 
> > > ERROR: Command execution failed: Exited with 1
> > >
> > > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> > code.
> > >
> > >
> > > jenkins@jenkins1:/home/a0850405/oe/sources/meta-arago$ git log
> > > commit 469a8425e702969a5be18dae0184980bd4d031b4
> > > Author: Denys Dmytriyenko <denys@ti.com>
> > > Date:   Thu Dec 6 10:44:26 2012 -0500
> > >
> > >     arago.conf: bump the version
> > >
> > >     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

