Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id A74B452A85
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 15:53:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRS00IUMC4JIRS1@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Aug 2013 10:53:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A34ED200D3; Mon,
	19 Aug 2013 11:53:07 -0400 (EDT)
Date: Mon, 19 Aug 2013 11:53:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Christian Gagneraud <chgans@gna.org>
Message-id: <20130819155307.GA32524@denix.org>
References: <5211843D.5060805@gna.org>
	<99393E6E-364E-486D-AAB3-6EB66BB9BF72@gmail.com>
	<5211B27F.9070707@gna.org>
MIME-version: 1.0
In-reply-to: <5211B27F.9070707@gna.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	yocto@yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [yocto] GCC SVN repo too slow?
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
X-List-Received-Date: Mon, 19 Aug 2013 15:53:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 19, 2013 at 05:51:59PM +1200, Christian Gagneraud wrote:
> CC: meta-arago@arago-project.org
> 
> 
> On 19/08/13 17:16, Khem Raj wrote:
> >
> >On Aug 18, 2013, at 7:34 PM, Christian Gagneraud <chgans@gna.org> wrote:
> >
> >>Hi all,
> >>
> >>I'm having problems with the GCC SVN repo being so slow to checkout, that svn failed (and so my build too).
> >>I first suspected the proxy we have here, but i tried a checkout from an outside machine (but still in New Zealand) and it seems the problem comes from gcc.gnu.org.
> >>
> >>I am using the arago layer, which requires svn://gcc.gnu.org/svn/gcc/branches;module=gcc-4_5-branch;protocol=http for gcc-crosssdk-intermediate.
> >>
> >>By slow, I really mean slow: 1 to 2 files are checkout per second!?!
> >>
> >>Has anyone encountered the same kind of problems?
> >
> >
> >thats a known issue and one of pressing reasons to not use svn version on later versions if you see new recipes
> >best case you could hit a mirror from yocto project and download the source mirror
> 
> 
> From the logs, I can see that bitbake is trying (among others):
> downloads.yoctoproject.org
> sources.openembedded.org
> 
> but hits a 404, so it fall-backs to GCC's SVN repo directly.
> 
> On the side, from the bitbake logs, I end up with a rather obscure error:
> svn: E175002: REPORT of '/svn/gcc/!svn/vcc/default': 200 OK
> (http://gcc.gnu.org)
> 
> When trying a checkout manually from the outside machine, it fails
> too, but the error message is a bit more friendly:
> svn: REPORT of '/svn/gcc/!svn/vcc/default': Could not read response
> body: connection was closed by server (http://gcc.gnu.org)
> 
> I found plenty of "black magic" workarounds on the web while looking
> for the strange "Error: [...] 200 OK", among them was to increase
> Apache time out! Which won't even really solve my problem, because
> the checkout will takes hours, if not days!
> 
> Right now, I'm really stuck. The only solutions I can think of are:
> - Ask kindly Arago not to use GCC code from SVN, or maybe to upload
> an archive on yocto/oe mirrors.
> - Check with GNU/GCC guys if they can do something about it (maybe
> it's a temporary issue with their server)
> - Wait and see, cross my fingers. :(

Chris,

I'm just wondering why do you even need gcc-4.5? Unless you specifically use  
gcc-4.5 based toolchain with meta-arago. That is the only reason I keep 
gcc-4.5 recipes in meta-arago to support old products with old toolchains. 
We've moved to 4.7 Linaro quite some time ago - when you use that, you won't  
need to download 4.5 version.

If you really need gcc-4.5 and it's not just a misconfiguration, then I have 
a tarball available that can be uploaded to a mirror...

--
Denys

