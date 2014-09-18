Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 3753C529B7
	for <meta-arago@arago-project.org>;
	Thu, 18 Sep 2014 23:00:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC400EUBD8PUW40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 18 Sep 2014 18:00:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C09E22018E; Thu,
	18 Sep 2014 19:00:25 -0400 (EDT)
Date: Thu, 18 Sep 2014 19:00:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>
Message-id: <20140918230025.GZ2480@denix.org>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
	<20140918214549.GY2480@denix.org>
	<4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
MIME-version: 1.0
In-reply-to: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Arago build fails if building srcipk is disabled
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
X-List-Received-Date: Thu, 18 Sep 2014 23:00:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 18, 2014 at 03:55:59PM -0700, Matt Schuckmann wrote:
> 
> 
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Thursday, September 18, 2014 2:46 PM
> > To: Matt Schuckmann
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] Arago build fails if building srcipk is
> > disabled
> > 
> > On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:
> > > I've been chasing this for a bit and I think I've almost got it
> > figured out.
> > > I've been trying to create a new DISTRO based on Arago and I keep
> > getting the following error.
> > >
> > > /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-
> > toolch
> > > ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-
> > r22e+git
> > > rAUTOINC+1ef37cd35d-arago1/temp/run.do_compile.28819: line 105:
> > > sourceipk_do_create_srcipk: command not found
> > >
> > > I finally figured out that if I included arago-source-ipk.conf in my
> > DISTRO file the error goes away.
> > > My understanding is that arago-source-ipk.conf turns on creating
> > srcipk packages for all the packages included in the SDK. I'm not
> > interested in creating srcipk's (at least I don't think I am) since I'm
> > not trying to create an SDK I just want a deployable image.
> > >
> > > Digging a little deeper I found that meta-arago-distro/recipes-
> > kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in a
> > do_compile_prepend() function to pick up any changes to the
> > configuration file and then rebuild the srcipk.
> > >
> > > I think that the do_compile_prepend() function should test the value
> > of one of the CREATE_SRCIPK_* variables before it tries to call
> > sourceipk_do_create_srcipk, I'm just not sure which one.
> > > I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not sure
> > or maybe it should test multiple variables?
> > >
> > > I'd appreciate any guidance.
> > 
> > Matt,
> > 
> > So, the arago-source-ipk.conf defines which components need to create
> > srcipk packages, but it also inherits the sourceipk.bbclass which
> > provides the necessary sourceipk_do_create_srcipk() function. The first
> > thing that function does is it checks whether CREATE_SRCIPK variable is
> > defined and doesn't do anything if it's not.
> > 
> > So, it appears that copy-defconfig.inc should not directly try to call
> > that function because it makes the assumption that sourceipk.bbclass is
> > always inherited. Simplest workaround would be to check for
> > CREATE_SRCIPK variabe before calling that function, but I wonder if
> > there's a better solution...
> > 
> > --
> 
> Denys, 
> Being new to this I can't really answer the question if there is a better way. 
> I would like to know the proper way to check for CREATE_SRCIPK so that I can move on from this. 
> This seems to work but I do not have a high degree of confidence that I got it correct, seems like the value should be checked too. 
> 
> do_compile_prepend() {
>     if [ -n "$CREATE_SRCIPK" ]
>     then
>         cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
>         sourceipk_do_create_srcipk
>     fi
> }
> 
> Matt S. 
> 
> PS. 
> I did notice that there is one other recipe doing something similar
> ./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb

Check line #197 here:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/classes/sourceipk.bbclass;h=8fef2e9d631228eb7255ff1d43cc54b53e7de607;hb=HEAD#l197

-- 
Denys

